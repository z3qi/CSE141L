module RegFile(
  input      Clk,	 // clock
             Wen,    // write enable
  input logic[2:0] Ra,     // read address pointer A  // will always write to Ra
                   Rb,     //                      B
			//  Wd,	 // write address pointer
  input logic [7:0] Wdat,   // write data in
  output logic [7:0]RdatA,	 // read data out A
                    RdatB); // read data out B

  logic[7:0] Core[8]; // reg file itself (8*8 array)

  always_comb begin
    RdatA = Core[Ra];
    RdatB = Core[Rb];
  end

  always_ff @(posedge Clk) begin
    if(Wen) Core[Ra] <= Wdat;

//   $display("Core[%d] = %b", Ra, Wdat);

  end

endmodule