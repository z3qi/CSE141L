module branch_LUT(
  input[1:0] problem,
  input      loop_branch,
  input[3:0] Jptr_con,
  input[2:0] Jptr_b,
  output logic[7:0] Jump
  // output logic       complete_branch
);

  always_comb begin
    if (problem == 2'b00) begin
      if (loop_branch) begin
        case(Jptr_b)
        0: Jump = 'd30;
        1: Jump = 'd25;
        2: Jump = 'd33;
        3: Jump = 'd110;
        endcase
        // $display("B Jump = %d", Jump);
      end
      else begin
        case(Jptr_con)
        0: Jump = 'd30; 
        1: Jump = 'd25;
        2: Jump = 'd33;
        3: Jump = 'd110;
        4: Jump = 'd114;
        5: Jump = 'd15;
        6: Jump = 'd14;
        7: Jump = 'd22;
        8: Jump = 'd38;
        9: Jump = 'd70;
        10: Jump ='d90;
        endcase
        // $display("Other Jump = %d", Jump);
      end
    end

    else if (problem == 2'b01) begin
      if (loop_branch) begin
        case(Jptr_b)
        0: Jump = 'd123;
        1: Jump = 'd111;
        2: Jump = 'd11;
        3: Jump = 'd62;
        4: Jump = 'd51;
        5: Jump = 'd121;
        6: Jump = 'd89;
        7: Jump = 'd101;
        endcase
        // $display("B Jump = %d", Jump);
      end
      else begin
        case(Jptr_con)
        0: Jump = 'd123; 
        1: Jump = 'd111;
        2: Jump = 'd11;
        3: Jump = 'd66;
        4: Jump = 'd51;
        5: Jump = 'd121;
        6: Jump = 'd89;
        7: Jump = 'd101;
        endcase
        // $display("Other Jump = %d", Jump);
      end
    end

    else if (problem == 2'b10) begin
      if (loop_branch) begin
        case(Jptr_b)
        // 0: Jump = 'd86;
        // 1: Jump = 'd24;
        // 2: Jump = 'd34;
        // 3: Jump = 'd44;
        // 4: Jump = 'd48;
        // 5: Jump = 'd61;
        // 6: Jump = 'd66;
        // 7: Jump = 'd69;
        0: Jump = 'd46;
        1: Jump = 'd61;
        endcase
        // $display("B Jump = %d", Jump);
      end
      else begin
        case(Jptr_con)
        // 0: Jump = 'd86;
        // 1: Jump = 'd24;
        // 2: Jump = 'd34;
        // 3: Jump = 'd44;
        // 4: Jump = 'd48;
        // 5: Jump = 'd61;
        // 6: Jump = 'd66;
        // 7: Jump = 'd69;
        // 8: Jump = 'd79;
        0: Jump = 'd46;
        1: Jump = 'd61;
        endcase
        // $display("Other Jump = %d", Jump);
      end
    end
    // complete_branch = 1'b1;
  end

endmodule