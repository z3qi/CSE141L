module ALU_tb;
  // Testbench Signals
  reg [2:0] Aluop;
  reg [7:0] DatA, DatB;
  reg       LSL_sel, ORR_sel;
  wire [7:0] Rslt;
  wire       Zero, Neg;

  // Instantiate the ALU module
  ALU uut (
    .Aluop(Aluop),
    .DatA(DatA),
    .DatB(DatB),
    .LSL_sel(LSL_sel),
    .ORR_sel(ORR_sel),
    .Rslt(Rslt), 
    .Zero(Zero),
    .Neg(Neg)
  );

  // Test Sequence
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    // Monitor the signals
    $monitor("Time=%0t | Aluop=%b | DatA=%d | DatB=%d | Rslt=%d | Zero=%b | Neg=%b",
             $time, Aluop, DatA, DatB, Rslt, Zero, Neg);
    
    // Test MOV operation (Aluop = 3'b000)
    Aluop = 3'b000; DatA = 8'd0; DatB = 8'd15; LSL_sel = 0; ORR_sel = 0;
    #10;

    // Test CMP operation (Aluop = 3'b001)
    Aluop = 3'b001; DatA = 8'd20; DatB = 8'd20; LSL_sel = 0; ORR_sel = 0;
    #10;

    // Test ADD operation (Aluop = 3'b010)
    Aluop = 3'b010; DatA = 8'd10; DatB = 8'd5; LSL_sel = 0; ORR_sel = 0;
    #10;

    // Test SUB operation (Aluop = 3'b011)
    Aluop = 3'b011; DatA = 8'd15; DatB = 8'd5; LSL_sel = 0; ORR_sel = 0;
    #10;

    // Test NEG operation (Aluop = 3'b100)
    Aluop = 3'b100; DatA = 8'd10; DatB = 8'd0; LSL_sel = 0; ORR_sel = 0;
    #10;

    // Test LSL (shift left) operation (Aluop = 3'b101)
    Aluop = 3'b101; DatA = 8'd4; DatB = 8'd2; LSL_sel = 0; ORR_sel = 0;
    #10;

    // Test LSR (shift right) operation (Aluop = 3'b101)
    Aluop = 3'b101; DatA = 8'd16; DatB = 8'd1; LSL_sel = 1; ORR_sel = 0;
    #10;

    // Test AND operation (Aluop = 3'b110)
    Aluop = 3'b110; DatA = 8'b10101010; DatB = 8'b11001100; LSL_sel = 0; ORR_sel = 0;
    #10;

    // Test ORR operation (Aluop = 3'b110)
    Aluop = 3'b110; DatA = 8'b10101010; DatB = 8'b11001100; LSL_sel = 0; ORR_sel = 1;
    #10;

    // Finish simulation
    $finish;
  end

endmodule
