module put_LUT(
  input[1:0] problem,
  input[2:0] Num_put_idx,

  output logic[7:0] Num_to_put
);

  always_comb begin
    if (problem == 'b0) begin
      case(Num_put_idx)
      0: Num_to_put = 0; 
      1: Num_to_put = 1;
      2: Num_to_put = 2;
      3: Num_to_put = 8;
      4: Num_to_put = 10;
      5: Num_to_put = 14;
      6: Num_to_put = 128;
      7: Num_to_put = 255;
      endcase
    end

    else if (problem == 'b01) begin
      case(Num_put_idx)
      0: Num_to_put = 0; 
      1: Num_to_put = 1;
      2: Num_to_put = 2;
      3: Num_to_put = 8;
      4: Num_to_put = 10;
      5: Num_to_put = 15;
      6: Num_to_put = 128;
      7: Num_to_put = 255;
      endcase
    end

    else if (problem == 'b10) begin
      case(Num_put_idx)
      // 0: Num_to_put = 0; 
      // 1: Num_to_put = 1;
      // 2: Num_to_put = 8'b01000010;
      // 3: Num_to_put = 8'b00001000;
      // 4: Num_to_put = 8'b00010000;
      // 5: Num_to_put = 8'b10000000;
      // 6: Num_to_put = 8'b00000100;
      // 7: Num_to_put = 0;
      0: Num_to_put = 0; 
      1: Num_to_put = 1;
      2: Num_to_put = 2;
      3: Num_to_put = 3;
      4: Num_to_put = 4;
      5: Num_to_put = 6;
      6: Num_to_put = 8'b01000000;
      7: Num_to_put = 8'b10000000;
      endcase
    end
  end

endmodule