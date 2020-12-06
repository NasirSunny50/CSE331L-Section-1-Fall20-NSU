.MODEL SMALL
.STACK 100H

.data

.CODE    

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    
    MOV CX, 1
    
    MOV AH, 2
    MOV DL, 42
    
    @LOOP:
    INT 21H
    INC DL
    DEC CX
    
    JNZ @LOOP
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN




