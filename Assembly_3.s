LOAD r0 1
LOAD r1 3
PUT r2 2
CMPR r2 r0
BGT 1
PUT r2 2
CMPR r0 r2
BEQ 2
PUT r7 2
PUT r6 3
ADD r6 r7
CMPR r0 r6
BEQ 4
PUT r5 4
ADD r6 r5
CMPR r0 r6
BEQ 6
CMPR r0 r6
BGT 7
PUT r5 3
SUB r6 r5
MOV r0 r6
PUT r1 0
B 0
CMPR r0 r1 // Branch 1
BEQ 8
PUT r0 4
PUT r3 1
LSL r0 r3
PUT r1 5
ADD r1 r3
ADD r1 r3
ADD r1 r3
B 0
CMPR r1 r2 // Branch 2
BEQ 3
MOV r0 r1
PUT r1 4
ADD r1 r1
PUT r2 6
ADD r1 r2
PUT r2 1
ADD r1 r2
B 0
PUT r3 6 // Branch 3
ADD r0 r3
PUT r1 0
B 0
CMPR r1 r6 // Branch 4
BLT 5
PUT r4 4
ADD r6 r4
PUT r4 6
ADD r6 r4
MOV r0 r6
PUT r1 2
PUT r3 1
LSR r1 r3
PUT r3 6
ADD r1 r3
B 0
PUT r7 1 // Branch 5
ADD r6 r7
MOV r0 r6
PUT r1 5
B 0
MOV r0 r6 // Branch 6
PUT r1 0
B 0
PUT r4 4 // Branch 7
ADD r4 r4
PUT r3 6
ADD r4 r3
PUT r3 1
ADD r4 r3
ADD r4 r3
ADD r4 r3
MOV r1 r4
B 0
PUT r2 4 // Branch 8
PUT r3 1
SUB r2 r3
LSL r2 r3
MOV r0 r2
PUT r1 6
B 0
STORE r0 5 // Branch 0
STORE r1 4