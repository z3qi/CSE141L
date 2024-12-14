module load_store_LUT(
  input[1:0] problem,
  input[2:0] Reference,

  output logic[7:0] addr_in_dm
);

  always_comb begin
    if (problem == 2'b00) begin
      case(Reference)
      0: addr_in_dm = 8'b00000000; 
      1: addr_in_dm = 8'b00000001;
      2: addr_in_dm = 8'b00000010;
      3: addr_in_dm = 8'b00000011;
      endcase
      // $display("Problem id is 00 and address %d = %d",Reference,addr_in_dm);
    end

    else if (problem == 2'b01) begin
      case(Reference)
      0: addr_in_dm = 8'b00000100; 
      1: addr_in_dm = 8'b00000101;
      2: addr_in_dm = 8'b00000110;
      3: addr_in_dm = 8'b00000111;
      endcase
    end

    else if (problem == 2'b10) begin
      case(Reference)
      0: addr_in_dm = 8'b00001000; 
      1: addr_in_dm = 8'b00001001;
      2: addr_in_dm = 8'b00001010;
      3: addr_in_dm = 8'b00001011;
      4: addr_in_dm = 8'b00001100;
      5: addr_in_dm = 8'b00001101;
      6: addr_in_dm = 8'b00001110;
      7: addr_in_dm = 8'b00001111;
      endcase
    end
  end

endmodule