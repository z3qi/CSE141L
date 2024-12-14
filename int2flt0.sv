// revised 2024.10.12
// behavioral model for integer to float conversion
// CSE141L  dummy DUT for int_to_float
// goes alongside yours in the testbench 
module int2flt0(
  input        clk, 
               reset, 				    // master reset -- start at beginning 
               start,                   // request -- start next conversion
  output logic done);				    // your acknowledge back to the testbench --ready for next operation
  logic        nil;					    // zero trap
  logic        max_neg;                 // 16'h8000 trap
  logic[ 7:0]  ctr;					    // clock cycle downcounter
  logic[ 5:0]  exp;					    // floating point exponent
  logic[15:0]  int1;				    // input value
  logic        sgn; 				    // floating point sign
  logic        trap;                    // max neg or 0 input
  bit  [ 1:0]  pgm;                     // counts 1, 2, 3 program
// port connections to dummy data_mem
  bit     [7:0]  DataAddress;		    // pointer
  bit            ReadMem;			
  bit            WriteMem;				// write enable
  bit     [7:0]  DataIn;				// data input port 
  wire    [7:0]  DataOut;				// data output port
  data_mem       data_mem1(.*);	  		// dummy data_memory for compatibility

  always @(posedge clk) begin
	if(reset) begin 
	  pgm     = pgm+'b1;			    // move to the next program
	end	                                // do nothing else
    else if(start) begin
	  int1    = {data_mem1.mem_core[1],data_mem1.mem_core[0]};
	  sgn     = int1[15];               // two's comp MSB also works as fl pt sign bit
	  trap    = !int1[14:0];            // trap 0 or 16'h8000) 
      exp     = 6'd29;			   	    // biased exponent starting value = 14 + 15
	  done    = 1'b0;
    end
	else if(!done) begin	   :nonreset
	  if(sgn) int1 = ~int1 + 16'b1;     // int1 = abs(int1)
      if(trap) begin
	    exp = sgn? 5'd30 : '0;
		int1 = '0;
	  end
      else begin
// normalization -- start w/ biased exponent = 14+15, count down as needed
        for(int ct=29;ct>13;ct--) begin
          if(int1[14]==1'b0) begin   // priority coder
            int1 = int1<<1'b1;	// looks for position of leading one
	        exp--;				        // decrement exponent every time we double mant.
//			$display("exp = %d, int1 = %b",exp,int1);
	      end
		  else break; 
		end
//		$display("preround exp = %d",exp);
// rounding
        if(&int1[14:3]) begin		   // round-induced overflow
		  exp++;
		  int1 ='0;		               // output mantissa = 0
		end
        else if(int1[4]||int1[2:0]) begin
//          $display("I get a round %b",int_int);
          int1 = int1+{int1[3],3'b0}; 
//          $display("%b",int_int);
		end
//		$display("postround exp = %d",exp);  
        {data_mem1.mem_core[3],data_mem1.mem_core[2]} = {sgn,exp,int1[13:4]};
      end
	  #2000ns done = '1;                   // adjust as needed for your design
    end	 :nonreset
  end

endmodule