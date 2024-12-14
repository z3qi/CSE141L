module Ctrl(
  input        [8:0] mach_code,     // 9-bit machine code
  input               Eql,          // Equal flag
                      Lss,          // Less than flag
                      Grt,          // Greater than flag

  output logic [2:0] Aluop,        // 3-bit ALU operation code, only assigned for MOV, PUT, ADD, SUB, LSL/LSR, CMPR, CMPN;
  output logic       Alu_en,       // ALU enable
  output logic [2:0] Ra,           // Source register A address (expanded to 3 bits)
                     Rb,           // Source register B address (expanded to 3 bits)
                     Num_addr,     // Number address, only assigned for PUT;
  output logic [2:0] Num_data,     // Number data, only assigned for loading and storing in data_mem;

  output logic [7:0] Num,          // Number, only assigned for CMPN;

  output logic       WenR,         // Register write enable
                    //  WenD,         // Memory write enable
                     Ldr,          // Load data flag
                     Str,          // Store data flag
                     Jen,           // Jump enable
  output logic [2:0] Jump_idx0,         // the serial number of the branch instruction, need to be looked up in the Jump_table
  output logic [3:0] Jump_idx1,

  output logic       loop_branch,

  output logic       logical_shift,
                     compare_type

  // input logic       complete_ALU,
  // input logic       complete_RegFile,
  // output logic       PC_next,
  // input logic       complete_branch
  // output logic [3:0] Load_addr,
  //                    Store_addr
);

  logic [2:0] opcode;
  logic [2:0] jump_code;

always_comb begin
    // Branch instructions
    if (mach_code[8:7] == 2'b11) begin
      // && (mach_code[6:4] == 3'b110 || mach_code[6:4] == 3'b111)
      jump_code = mach_code[6:4];
      case(jump_code)
        3'b000: begin // BEQ
          Alu_en = 1'b0;
          Aluop = 3'bZ;
          Ra = 3'bZ;
          Rb = 3'bZ;
          Num_addr = 3'bZ;
          Num_data = 2'bZ;
          Num = 8'bZ;
          WenR = 1'b0;
          Ldr = 1'b0;
          Str = 1'b0;
          Jen = Eql;
          Jump_idx0 = 3'bZ;
          Jump_idx1 = mach_code[3:0];
          loop_branch = 1'b0;
          logical_shift = 1'bZ;
          compare_type = 1'bZ;
        end
        3'b001: begin // BNE
          Alu_en = 1'b0;
          Aluop = 3'bZ;
          Ra = 3'bZ;
          Rb = 3'bZ;
          Num_addr = 3'bZ;
          Num_data = 2'bZ;
          Num = 8'bZ;
          WenR = 1'b0;
          Ldr = 1'b0;
          Str = 1'b0;
          Jen = !Eql;
          Jump_idx0 = 3'bZ;
          Jump_idx1 = mach_code[3:0];
          loop_branch = 1'b0;
          logical_shift = 1'bZ;
          compare_type = 1'bZ;
        end
        3'b010: begin 
          Alu_en = 1'b0;
          Aluop = 3'bZ;
          Ra = 3'bZ;
          Rb = 3'bZ;
          Num_addr = 3'bZ;
          Num_data = 2'bZ;
          Num = 8'bZ;
          WenR = 1'b0;
          Ldr = 1'b0;
          Str = 1'b0;
          Jen = Grt;
          Jump_idx0 = 3'bZ;
          Jump_idx1 = mach_code[3:0];
          loop_branch = 1'b0;
          logical_shift = 1'bZ;
          compare_type = 1'bZ;
        end
        3'b011: begin 
          Alu_en = 1'b0;
          Aluop = 3'bZ;
          Ra = 3'bZ;
          Rb = 3'bZ;
          Num_addr = 3'bZ;
          Num_data = 2'bZ;
          Num = 8'bZ;
          WenR = 1'b0;
          Ldr = 1'b0;
          Str = 1'b0;
          Jen = Lss | Eql;
          Jump_idx0 = 3'bZ;
          Jump_idx1 = mach_code[3:0];
          loop_branch = 1'b0;
          logical_shift = 1'bZ;
          compare_type = 1'bZ;
        end
        3'b100: begin 
          Alu_en = 1'b0;
          Aluop = 3'bZ;
          Ra = 3'bZ;
          Rb = 3'bZ;
          Num_addr = 3'bZ;
          Num_data = 2'bZ;
          Num = 8'bZ;
          WenR = 1'b0;
          Ldr = 1'b0;
          Str = 1'b0;
          Jen = Lss;
          Jump_idx0 = 3'bZ;
          Jump_idx1 = mach_code[3:0];
          loop_branch = 1'b0;
          logical_shift = 1'bZ;
          compare_type = 1'bZ;
        end
        3'b101: begin
          if (mach_code[3] == 1'b0) begin 
          Alu_en = 1'b0;
          Aluop = 3'bZ;
          Ra = 3'bZ;
          Rb = 3'bZ;
          Num_addr = 3'bZ;
          Num_data = 2'bZ;
          Num = 8'bZ;
          WenR = 1'b0;
          Ldr = 1'b0;
          Str = 1'b0;
          Jen = 1'b1;
          Jump_idx0 = mach_code[2:0];
          Jump_idx1 = 4'bZ;
          loop_branch = 1'b1;
          logical_shift = 1'bZ;
          compare_type = 1'bZ;
          end
          else begin 
          Alu_en = 1'b1;
          Aluop = 3'b110;
          Ra = mach_code[2:0];
          Rb = 3'bZ;
          Num_addr = 3'bZ;
          Num_data = 2'bZ;
          Num = 8'bZ;
          WenR = 1'b1;
          Ldr = 1'b0;
          Str = 1'b0;
          Jen = 1'b0;
          Jump_idx0 = 3'bZ;
          Jump_idx1 = 3'bZ;
          loop_branch = 1'bZ;
          logical_shift = 1'bZ;
          compare_type = 1'bZ;
          end
        end
        3'b110: begin // LOAD
          Alu_en = 1'b0;
          Aluop = 3'bZ;
          Ra = {2'b0, mach_code[3]};
          Rb = 3'bZ;
          Num_addr = 3'bZ;
          Num_data = mach_code[2:0];
          Num = 8'bZ;
          WenR = 1'b1;
          Ldr = 1'b1;
          Str = 1'b0;
          Jen = 1'b0;
          Jump_idx0 = 3'bZ;
          Jump_idx1 = 3'bZ;
          loop_branch = 1'bZ;
          logical_shift = 1'bZ;
          compare_type = 1'bZ;
        end
        3'b111: begin // STORE
          Alu_en = 1'b0;
          Aluop = 3'bZ;
          Ra = {2'b0, mach_code[3]};
          Rb = 3'bZ;
          Num_addr = 3'bZ;
          Num_data = mach_code[2:0];
          Num = 8'bZ;
          WenR = 1'b0;
          Ldr = 1'b0;
          Str = 1'b1;
          Jen = 1'b0;
          Jump_idx0 = 3'bZ;
          Jump_idx1 = 3'bZ;
          loop_branch = 1'bZ;
          logical_shift = 1'bZ;
          compare_type = 1'bZ;
        end
      endcase
    end

    else if (mach_code[8:6] == 3'b000) begin // MOV
      Alu_en = 1'b1;
      Aluop = 3'b000;
      Ra = mach_code[5:3];
      Rb = mach_code[2:0];
      Num_addr = 3'bZ;
      Num_data = 2'bZ;
      Num = 8'bZ;
      WenR = 1'b1;
      Ldr = 1'b0;
      Str = 1'b0;
      Jen = 1'b0;
      Jump_idx0 = 3'bZ;
      Jump_idx1 = 3'bZ;
      loop_branch = 1'bZ;
      logical_shift = 1'bZ;
      compare_type = 1'bZ;
    end

    else if (mach_code[8:6] == 3'b001) begin // PUT
      Alu_en = 1'b1;
      Aluop = 3'b001;
      Ra = mach_code[5:3];
      Rb = 3'bZ;
      Num_addr = mach_code[2:0]; 
      Num_data = 2'bZ;
      Num = 8'bZ;
      WenR = 1'b1;
      Ldr = 1'b0;
      Str = 1'b0;
      Jen = 1'b0;
      Jump_idx0 = 3'bZ;
      Jump_idx1 = 3'bZ;
      loop_branch = 1'bZ;
      logical_shift = 1'bZ;
      compare_type = 1'bZ;
    end

    else if (mach_code[8:6] == 3'b010) begin // ADD
      Alu_en = 1'b1;
      Aluop = 3'b010;
      Ra = mach_code[5:3];
      Rb = mach_code[2:0];
      Num_addr = 3'bZ; 
      Num_data = 2'bZ;
      Num = 8'bZ;
      WenR = 1'b1;
      Ldr = 1'b0;
      Str = 1'b0;
      Jen = 1'b0;
      Jump_idx0 = 3'bZ;
      Jump_idx1 = 3'bZ;
      loop_branch = 1'bZ;
      logical_shift = 1'bZ;
      compare_type = 1'bZ;
    end

    else if (mach_code[8:6] == 3'b011) begin // SUB
      Alu_en = 1'b1;
      Aluop = 3'b011;
      Ra = mach_code[5:3];
      Rb = mach_code[2:0];
      Num_addr = 3'bZ; 
      Num_data = 2'bZ;
      Num = 8'bZ;
      WenR = 1'b1;
      Ldr = 1'b0;
      Str = 1'b0;
      Jen = 1'b0;
      Jump_idx0 = 3'bZ;
      Jump_idx1 = 3'bZ;
      loop_branch = 1'bZ;
      logical_shift = 1'bZ;
      compare_type = 1'bZ;
    end

    else if (mach_code[8:6] == 3'b100) begin // LSL/LSR
      Alu_en = 1'b1;
      Aluop = 3'b100;
      Ra = mach_code[4:2];
      Rb = {1'b0, mach_code[1:0]};
      Num_addr = 3'bZ; 
      Num_data = 2'bZ;
      Num = 8'bZ;
      WenR = 1'b1;
      Ldr = 1'b0;
      Str = 1'b0;
      Jen = 1'b0;
      Jump_idx0 = 3'bZ;
      Jump_idx1 = 3'bZ;
      loop_branch = 1'bZ;
      logical_shift = mach_code[5]; // set logical shift direction
      compare_type = 1'bZ;
    end

    else if (mach_code[8:6] == 3'b101) begin
      Alu_en = 1'b1;
      Aluop = 3'b101;
      Num_addr = 3'bZ;
      Num_data = 2'bZ;

      WenR = 1'b0;
      Ldr = 1'b0;
      Str = 1'b0;
      Jen = 1'b0;
      Jump_idx0 = 3'bZ;
      Jump_idx1 = 3'bZ;
      loop_branch = 1'bZ;
      logical_shift = 1'bZ;
      compare_type = mach_code[5];
      if (mach_code[5] == 1'b0) begin
        Ra = {1'b0, mach_code[4:3]};
        Rb = mach_code[2:0];
        Num = 8'bZ;
      end else begin
        Ra = mach_code[4:2];
        Rb = 3'bZ;
//        Num = mach_code[1:0];  // There might be other mismatched bit width assignment, be careful
        Num = {6'b0, mach_code[1:0]};
      end
    end

  // if (complete_ALU) begin
  //   complete_ALU = 1'b0;
  // end

  // if (complete_RegFile) begin
  //   complete_RegFile = 1'b0;
  //   PC_next = 1'b1;
  // end

  /*

    if (mach_code[8:7] == 2'b11) begin
      if (mach_code[6:4] == 3'b000) begin
        $display("If Eql %b, Jump to R%d ", Eql, Jump_idx1);
      end else if (mach_code[6:4] == 3'b001) begin
        $display("If Not Eql %b, Jump to R%d ", !Eql, Jump_idx1);
      end else if (mach_code[6:4] == 3'b010) begin
        $display("If Grt %b, Jump to R%d ", Grt, Jump_idx1);
      end else if (mach_code[6:4] == 3'b011) begin
        $display("If Lss or Eql %b, Jump to R%d ", Lss | Eql, Jump_idx1);
      end else if (mach_code[6:4] == 3'b100) begin
        $display("If Lss %b, Jump to R%d ", Lss, Jump_idx1);
      end else if (mach_code[6:4] == 3'b101) begin
        if (mach_code[3] == 1'b0) begin
          $display("Jump to R%d ", Jump_idx0);
        end else begin
          $display("Flip R%d ", Ra);
        end
      end
    end

    else if (Aluop == 3'b000) begin
      $display("Mov from R%d to R%d ", Rb, Ra);
    end else if (Aluop == 3'b001) begin
      $display("Put Num %d to R%d ", Num_addr,Ra);
    end else if (Aluop == 3'b010) begin
      $display("Add from R%d to R%d ", Rb, Ra);
    end else if (Aluop == 3'b011) begin
      $display("Sub R%d to store to R%d ", Rb, Ra);
    end else if (Aluop == 3'b100) begin
      $display("Shift R%d units of R%d ", Rb, Ra);
    end else if (Aluop == 3'b101) begin
      $display("Compare R%d with ? ", Ra);
    end 

 */

end


endmodule