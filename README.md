Instructions for Running the Code

To run the code, begin with the top-level modules: int2flt.sv, flt2int.sv, and fltflt.sv. The only difference between these modules is the problem_top signal, which determines the specific problem to run: 00 for Problem 1, 01 for Problem 2, and 10 for Problem 3. Apart from this signal, the structure of these top modules remains identical.

Next, ensure that the contents of the mach_code.txt file are updated with the corresponding machine code for the specific problem you are testing.

Finally, replace ProgCtrl.sv with ProgCtrl_revised.sv when synthesizing the code. While ProgCtrl.sv works fine on EDAPlayground, the revised version, ProgCtrl_revised.sv, is necessary for proper synthesis.
