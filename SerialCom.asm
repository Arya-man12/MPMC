ORG 0000H   
MOV P1,#00H   
MOV TMOD,#20H    MOV TH1,#-6   
    
MOV SCON,#50H      
SETB TR1          
HERE:JNB RI,HERE          
MOV A,SBUF       
MOV P1,A          
CLR RI            
SJMP HERE  