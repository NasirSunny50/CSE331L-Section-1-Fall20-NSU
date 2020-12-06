.MODEL SMALL
.STACK 100H

.DATA
PROMPT_1 DB "ENTER iNTEGER 1:-$"
PROMPT_2 DB 0DH,0AH, "ENTER iNTEGER 2:-$"
PROMPT_3 DB 0DH,0AH, "MUL of the Integers:-$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, PROMPT_1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    MOV BL, AL
    SUB BL,48
    
    MOV DL, 10
    MOV AH,2
    INT 21H
    
    MOV DL, 13
    MOV AH,2
    INT 21H
    
    LEA DX, PROMPT_2
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    SUB AL,48
    
    MUL BL
    
    MOV BL,AL
    ADD BL,48
    
    MOV DL, 10
    MOV AH,2
    INT 21H
    
    MOV DL, 13
    MOV AH,2
    INT 21H
    
    LEA DX, PROMPT_3
    MOV AH, 9
    INT 21H
    
        
    MOV DL,BL
    MOV AH,2
    INT 21H
    
     
           
            
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
    



