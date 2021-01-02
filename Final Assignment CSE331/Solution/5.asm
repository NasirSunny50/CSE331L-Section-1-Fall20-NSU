.MODEL SMALL
.STACK 100H

.DATA

PROMPT_1 DB "ENTER A NUMBER TO FIND EVEN OR ODD:$"
PROMPT_2 DB 0DH,0AH, "THE NUMBER IS:$"

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
    
    LEA DX, PROMPT_2
    MOV AH, 9
    INT 21H
    
    TEST BL, 01H
    
    JNE @ODD
    
    MOV AH, 2
    MOV DL, "E"
    INT 21H
    JMP @EXIT
    
    @ODD:
    MOV AH, 2
    MOV DL, "O"
    INT 21H
    
    @EXIT:
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN




