module ALU(
  input [2:0] Aluop,
  input       Alu_en,
  input [7:0] DatA,  // the number stored in register A
              DatB,  // the number stored in register B
              Num,    // the number of NUM used to compare
  
  input [7:0] Num_to_put, // only used in PUT
  input       logical_shift,
              compare_type,

  input [7:0] Num_to_load, // only used in LOAD

  output logic [7:0] Rslt,  // the result number of the ALU operation
  output logic       Grt,    // Greater than flag
                     Lss,    // Less than flag
                     Eql    // Equal flag
                    //  complete_ALU
);


  logic [7:0] temp_result;

  always_comb begin

    temp_result = 8'b0;

    if (Alu_en) begin
      case(Aluop)
        3'b000: temp_result = DatB;                  // MOV
        3'b001: temp_result = Num_to_put;                   // PUT
        3'b010: temp_result = DatA + DatB;           // ADD
        3'b011: temp_result = DatA - DatB;           // SUB
        3'b100: begin 
          if (logical_shift == 1'b0)                 // LSL
            temp_result = DatA << DatB;
          else
            temp_result = DatA >> DatB;         // LSR
        end

        3'b101: begin
          if (compare_type == 1'b0) begin
            if (DatA == DatB) begin
              Eql = 1'b1;
              Grt = 1'b0;
              Lss = 1'b0;
            end
            else
              begin
                Eql = 1'b0;
                if (DatA > DatB) begin
                  Grt = 1'b1;
                  Lss = 1'b0;
                end
                else begin
                  Grt = 1'b0;
                  Lss = 1'b1;
                end
              end
          end

          else begin
            if (DatA == Num) begin
              Eql = 1'b1;
              Grt = 1'b0;
              Lss = 1'b0;
            end
            else
              begin
                Eql = 1'b0;
                if (DatA > Num) begin
                  Grt = 1'b1;
                  Lss = 1'b0;
                end
                else begin
                  Grt = 1'b0;
                  Lss = 1'b1;
                end
              end
          end

        end

        3'b110: begin                               // FLIP
          temp_result = ~DatA;
          Eql = 1'b0;
          Grt = 1'b0;
          Lss = 1'b0;
        end
        default: temp_result = 8'b0;
      endcase

    end

    else begin
      temp_result = Num_to_load;
    end

    Rslt = temp_result;

  // $display("ALU result: %b\n", Rslt);
  // complete_ALU = 1'b1;

  end

endmodule