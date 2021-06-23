
ORG 0000H
SETB P3.5 ;p3.5 pin in counter 
CLR P1.2 ;for square wave
MOV P2,#0 ;to show counter output
MOV TMOD,#01100001B ;initializing tmod with counter 1 and in mode 2 and timer 0 in mode 1
MOV TH1,#0
CLR A
SETB TR1;start counter 1
INC A;incrementing A
HERE: MOV A,TL1
MOV P2,A ;store count value in p2 port
CPL P3.5 ; compliment the p3.5 value
MOV R7,#255 ;mode 2 can count upto max 256
ACALL DELAY
CJNE A,#0AH,HERE ;checks if the count is equal to 10 or not
CLR TF1
CLR TR1 ;stop the counter 1
AGAIN: MOV TH0,#0FEH ;to get a frequency of 1khz
MOV TL0,#32H
SETB TR0;start timer 0
CPL P1.2
LOOP: JNB TF0,LOOP ;wait for 0.5msec
CLR TR0 ;stop timer 0
CLR TF0
SJMP AGAIN
DELAY: DJNZ R7,DELAY
RET
END
