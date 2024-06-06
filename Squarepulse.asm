ORG 0H         ; Set the origin to address 0 
 
MOV TMOD, #01H ; Set Timer 0 in mode 1 (16-bit timer) 
MOV TL0, #0    ; Initialize low byte of Timer 0 
MOV TH0, #0    ; Initialize high byte of Timer 0 
 
; Calculate the reload value for a 10 ms delay 
MOV R7, #110   ; Assuming XTAL = 11.0592 MHz 
MOV R6, #59 
 
MOV A, #65536   ; Load 65536 into accumulator 
SUBB A, R7      ; Subtract R7 from accumulator 
MOV R4, A       ; Store result in R4 
 
MOV A, #0 
SUBB A, R6      ; Subtract R6 from accumulator 
MOV R5, A       ; Store result in R5 
 
MOV DPTR, #RELOAD_VALUE 
MOVX A, @DPTR  ; Load the reload value into ACC 
MOV TH0, A     ; Move it to the high byte of Timer 0 
 
 
 
SETB TR0       ; Start Timer 0 
 
MAIN_LOOP:  
    JNB TF0, MAIN_LOOP ; Wait until Timer 0 overflows 
 
    CLR TF0          ; Clear Timer 0 overflow flag 
    MOV P0, #89H     ; Send 'Y' to Port 0 (ASCII code for 'Y') 
    MOV P1, #4EH     ; Send 'N' to Port 1 (ASCII code for 'N') 
 
RELOAD_VALUE: DW 65320 ; Placeholder for the reload 
value 
 
END 
 
 
 
 
Output