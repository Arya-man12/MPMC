ORG 0000H   
 SETB P3.5   
 MOV P1, #00H  ; Make Port 1 as output port 
 MOV TMOD, #60H  ; counter 1, mode 2;C/T=1 external pulses 
 MOV TH1, #0 ; clear TH1 
AGAIN:  SETB TR1 ; start the counter 
BACK: MOV A, TL1  ; get copy of TL 
 MOV P1, A ; display it on port 2 
 JNB TF1, BACK ; keep doing, if TF=0 
 CLR TR1  ; Stop the counter 1 
 CLR TF1  ; make TF=0 
 SJMP AGAIN  ; keep doing it 