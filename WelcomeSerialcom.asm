ORG 0000H         
MAIN: MOV TMOD, #20H      
MOV TH1,#0FDH         
MOV SCON, #50H     
SETB TR1      
REPEAT:MOV DPTR, #MESSAGE     
NEXT:CLR A          
MOVC A, @A+DPTR       
JZ REPEAT         
MOV SBUF, A       
HERE:JNB TI, HERE      
CLR TI            
INC DPTR         
SJMP NEXT         
MESSAGE:DB 'Welcome!',0   
END  