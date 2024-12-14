LOAD r0 1
LOAD r1 0
MOV r5 r1
MOV r6 r0
PUT r7 0
PUT r2 6
CMPR r2 r6
BGT 2
CMPR r2 r6
BEQ 2
MOV r7 r2
PUT r2 2  // Branch 2
PUT r3 1
ADD r2 r3
LSL r0 r3
LSR r0 r2
PUT r2 0
PUT r3 0
PUT r4 5
CMPR r0 r4
BLT 0
ADD r4 r4
CMPR r0 r4
BEQ 7
PUT r4 5
SUB r0 r4
PUT r2 1
PUT r3 3
CMPR r0 r3
BLT 3
MOV r4 r0
SUB r0 r3
LSL r2 r0
CMPN r0 1
BLE 4
PUT r3 4
SUB r4 r3
PUT r0 3
SUB r3 r0
SUB r0 r3
PUT r3 3
SUB r3 r4
LSL r6 r0
SUB r0 r4
LSR r6 r0
LSR r5 r3
ADD r2 r6
ADD r2 r5
LSL r1 r0
MOV r0 r2
B 1
CMPN r0 1  // Branch 4
BLT 3
PUT r3 3
PUT r4 2
SUB r3 r4
LSL r6 r3
MOV r1 r6
ADD r3 r0
LSR r6 r3
ADD r2 r6
LSL r1 r0
LSR r5 r0
ADD r1 r5
MOV r0 r2
B 1
PUT r2 1  // Branch 3
LSL r2 r0
PUT r3 2
CMPR r0 r3
BLE 6
SUB r0 r3  // re
PUT r4 3
SUB r4 r3
MOV r3 r4
LSL r6 r3
SUB r3 r0
LSR r6 r3  // finish re
PUT r3 3
SUB r3 r0
LSR r5 r3
ADD r2 r6
ADD r2 r5
MOV r1 r2
PUT r3 3
PUT r0 0
CMPR r3 r4
BNE 1
PUT r0 1
PUT r3 3  // Branch 6
PUT r4 2
SUB r3 r4
LSL r6 r3
LSR r6 r3
SUB r4 r0
MOV r1 r4
LSR r6 r1
ADD r2 r6
MOV r1 r2
PUT r0 0
B 1
PUT r0 7 // Branch 7
PUT r1 7
MOV r2 r7
PUT r3 6
SUB r0 r3
CMPR r2 r3
BLT 0
PUT r0 6
PUT r1 0
B 0
PUT r2 6  // Branch 1
CMPR r2 r7
BGT 0
FLIP r0
FLIP r1
PUT r2 7
CMPR r2 r1
BNE 5
PUT r2 1
ADD r0 r2
PUT r2 1  // Branch 5
ADD r1 r2
STORE r0 3  // Branch 0
STORE r1 2