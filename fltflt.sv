module fltflt(
  input              clk, 
                     reset, 
                     start,
  // output [1:0]       prog_mode,
  output logic       done
);

// Only the program counter is based on the clock signal, all other modules should be synchronous (always_comb)


  logic [1:0] problem_top;

  assign problem_top = 2'b10;

  wire [7:0] addr_in_dm_top;
  wire       Ldr_top;
  wire       Str_top;
  wire [7:0] DatA_top;
  wire [7:0] Num_to_load_top;

  wire [8:0] mach_code_top;
  wire [7:0] Jump_top;
  wire       Jen_top;
  wire [7:0] PC_top;
  logic      pc_done_flag_top;

  wire       Eql_top;
  wire       Lss_top;
  wire       Grt_top;
  wire       Alu_en_top;
  wire [2:0] Aluop_top;
  wire [2:0] Ra_top;
  wire [2:0] Rb_top;
  wire       WenR_top;
  wire [2:0] Num_addr_top;
  wire [2:0] Num_ls_index_top;
  wire [7:0] Num_top;
  wire [3:0] Jptr_con_top;
  wire [2:0] Jptr_b_top;
  wire       loop_branch_top;
  wire       logical_shift_top;
  wire       compare_type_top;

  wire [7:0] DatB_top;
  wire [7:0] Rslt_top;

  wire [7:0] Num_to_put_top;



  data_mem data_mem1(  // Data memory
    .clk(clk),
    .DataAddress(addr_in_dm_top),
    .ReadMem(Ldr_top),
    .WriteMem(Str_top),
    .DataIn(DatA_top),  // input
    .DataOut(Num_to_load_top)  // output
  );

  ProgCtr PC1(  // Program counter
    .Clk(clk),
    .Reset(reset),
    .start(start),
    .Jump(Jump_top),  // input
    .Jen(Jen_top),
    .Instruction(mach_code_top),
    .PC(PC_top),
    .PC_prev(PC_top),
    .problem(problem_top),
    .pc_done_flag(pc_done_flag_top)
  );

  Ctrl C1(  // Control logic
    .mach_code(mach_code_top),

    .Eql(Eql_top),
    .Lss(Lss_top),
    .Grt(Grt_top),  // input

    .Alu_en(Alu_en_top),
    .Aluop(Aluop_top),

    .Ra(Ra_top),
    .Rb(Rb_top),

    .WenR(WenR_top),
    // .WenD(WenD_top), 
    .Ldr(Ldr_top),
    .Str(Str_top),

    .Num_addr(Num_addr_top),  // output
    .Num(Num_top),  // output
    .Num_data(Num_ls_index_top),

    .Jen(Jen_top),

    .Jump_idx0(Jptr_b_top),  // output
    .Jump_idx1(Jptr_con_top),
    .loop_branch(loop_branch_top),  // output

    .logical_shift(logical_shift_top),  // output
    .compare_type(compare_type_top)

  );


  RegFile RF1(  // Register file
    .RdatA(DatA_top),  // output
    .RdatB(DatB_top),

    .Clk(clk),
    .Wen(WenR_top),
    .Ra(Ra_top),
    .Rb(Rb_top),
    // .Wd(Wd_top),
    .Wdat(Rslt_top)  // input
  );


  ALU A1(  // Arithmetic and logic unit
    .Aluop(Aluop_top),
    .Alu_en(Alu_en_top),
    .DatA(DatA_top),  // input
    .DatB(DatB_top),
    .Num(Num_top),  // input

    .Num_to_put(Num_to_put_top),  // input

    .logical_shift(logical_shift_top),  // input
    .compare_type(compare_type_top),

    .Num_to_load(Num_to_load_top),  // input

    .Rslt(Rslt_top),  // output
    .Grt(Grt_top),  // output
    .Lss(Lss_top),
    .Eql(Eql_top)
  );


  put_LUT PL1(  // Put LUT
    .problem(problem_top),
    .Num_put_idx(Num_addr_top),  // input
    .Num_to_put(Num_to_put_top)  // output
  );

  load_store_LUT LS1(  // Load/Store LUT
    .problem(problem_top),
    .Reference(Num_ls_index_top),  // input
    .addr_in_dm(addr_in_dm_top)  // output
  );

  branch_LUT BL1(
    .problem(problem_top),
    .loop_branch(loop_branch_top),  // input
    .Jptr_con(Jptr_con_top),  // input
    .Jptr_b(Jptr_b_top),  // input
    .Jump(Jump_top)  // output
  );

assign done = pc_done_flag_top;



endmodule