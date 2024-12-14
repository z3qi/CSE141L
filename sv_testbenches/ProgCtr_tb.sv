module ProgCtr(
  input             Clk,
                    Reset,
                    Jen,
  input       [5:0] Jump,
  output      [8:0] Instruction,
  output logic[5:0] PC,
  output logic      pc_done_flag
);

  // InstROM instantiation
  InstROM instr_rom(
    .PC(PC),
    .mach_code(Instruction)
  );

  // Program counter and done flag logic
  always_ff @(posedge Clk or posedge Reset) begin
    if(Reset) begin
      PC <= '0;
      pc_done_flag <= 1'b0;
    end
    else begin
      if(Jen) begin
        PC <= Jump;  // Jump to target address
        if(Jump == 6'd0) begin  // If jumping back to start
          pc_done_flag <= 1'b1;  // Signal program completion
        end
      end
      else begin
        PC <= PC + 6'd1;  // Normal sequential execution
        // Check if we've reached the end of program
        if(PC == 6'd256) begin  // Assuming 64 instructions max
          pc_done_flag <= 1'b1;
        end
      end
    end
  end

endmodule