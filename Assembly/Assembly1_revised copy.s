LOAD r0 0
LOAD r1 1
PUT r2 6
PUT r7 0
CMPR r0 r2
BLT 5
PUT r7 6
FLIP r0
FLIP r1
PUT r2 1
PUT r3 7
CMPR r1 r3
BNE 6
ADD r0 r2
ADD r1 r2  // Branch 6
CMPN r0 0  // Branch 5
BNE 7
PUT r2 0  // NEW LINE!!! Line index after here + 1
PUT r3 0  // NEW LINE!!! Line index after here + 1
CMPN r1 0
BEQ 4
B 0
PUT r2 3  // Branch 7
PUT r3 1
MOV r4 r0
CMPN r4 0  // Branch 1
BEQ 8
LSR r4 r3
ADD r2 r3
B 1
PUT r2 0  // Branch 0
PUT r3 1
MOV r4 r1
CMPN r4 0  // Branch 2
BEQ 8
LSR r4 r3
ADD r2 r3
B 2
PUT r6 5  // Branch 8
ADD r6 r2
PUT r3 4
CMPR r2 r3
BLE 9
MOV r4 r0
MOV r5 r1
MOV r1 r2
PUT r3 3
SUB r1 r3
PUT r3 1
SUB r1 r3
PUT r0 4
SUB r0 r1
MOV r3 r4
PUT r2 3
SUB r2 r1
LSL r3 r2
LSR r3 r1
PUT r2 0
ADD r2 r3
PUT r3 3
SUB r3 r0
LSL r4 r3
PUT r3 0
ADD r3 r4
LSR r5 r0
ADD r3 r5
B 3
CMPR r2 r3  // Branch 9
BEQ 10
MOV r5 r1
PUT r3 3
PUT r4 1
ADD r3 r4
SUB r3 r2
LSL r5 r3
PUT r2 3
PUT r4 2
SUB r2 r4
LSR r5 r2
PUT r2 0
ADD r2 r5
PUT r4 2
ADD r3 r4
LSL r1 r3
PUT r3 0
ADD r3 r1
B 3
MOV r4 r0  // Branch 10
MOV r5 r1
PUT r0 3
PUT r1 1
SUB r0 r1
PUT r1 3
PUT r2 2
SUB r1 r2
PUT r2 0
LSL r4 r0
LSR r4 r1
ADD r2 r4
MOV r4 r5
LSR r4 r0
ADD r2 r4
PUT r3 1
LSL r5 r3
PUT r3 0
ADD r3 r5
B 3
ADD r2 r7  // Branch 3
PUT r0 2
LSL r6 r0
ADD r2 r6
STORE r2 2  // Branch 4
STORE r3 3