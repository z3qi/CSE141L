module ProgCtr(
  input             Clk,
                    Reset,
  					start,
                    Jen,
  input  logic[7:0] Jump,
  input  logic[7:0] PC_prev,
  input  logic[1:0] problem,

  output      [8:0] Instruction,
  output logic[7:0] PC,
  output logic       pc_done_flag
);

  int i;
  // InstROM
  InstROM instr_rom(
    .PC(PC),
    .mach_code(Instruction)
  );

  // Update PC

  // 这里需要修改，PC需要一个来自control的input，来决定是否需要更新PC
  // always_ff @(posedge Clk) begin
  //   if(Reset)
  //     PC <= 'b0;
  //   else if(Jen)
  //     PC <= Jump;
  //   else begin
  //     PC <= PC_prev + 6'd1;
      
  //     if(PC == 6'd256) begin
  //       pc_done_flag <= 1'b1;
  //     end
  //   end
  // end

always_ff @(posedge Clk or negedge Reset) begin
  if (Reset || start) begin
    PC <= -1;
    pc_done_flag <= 1'b0;
  end else begin
    if (Jen) begin
      PC <= Jump;
//      $display("Jump to line %d", Jump);
    end else begin
      PC <= PC_prev + 8'd1;
//      $display("Continue to line %d", PC);
      if (problem == 2'b00 && PC == 8'd118)
        pc_done_flag <= 1'b1;
      else if (problem == 2'b01 && PC == 8'd105)
        pc_done_flag <= 1'b1;
//      else if (problem == 2'b10 && PC == 8'd88)
      else if (problem == 2'b10 && PC == 8'd81)
        pc_done_flag <= 1'b1;
    end
  end
end


endmodule