ORG 0000H  
MOV R0,#40H   
MOV DPTR,#3000H  
MOV R2,#05H  
LOOP:MOV A,@R0  
            CPL A  
            MOVX @DPTR,A  
            INC R0  
            INC DPTR  
            DJNZ R2,LOOP  
             END 