.MODEL SMALL
.STACK 64
DATA SEGMENT
    STRING DB ?
  SYM DB '$'
INPUT_M DB 0ah,0dh,0AH,0DH, 'ENTER INPUT STRING: ',0DH,0AH,'$'
STRLEN1 DW $-STR1
STRREV DB 20 DUP(' ')
STR_PALIN DB 'STRING IS PALINDROME.','$'
STR_NOT_PALIN DB 'STRING IS NOT PALINDROME.','$'
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
    
    BEGIN:
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, OFFSET INPUT_M
    MOV AH, 9
    INT 21H
    
    LEA SI, STRING 
    
INPUT: MOV AH, 1
       INT 21H
       
       MOV [SI], AL
       INC SI
       
       CMP AL, 0DH
       JNZ INPUT
       
       MOV AL, SYM
       MOV [SI],'$'
       
OUTPUT:     
        MOV DL, 0AH
        MOV AH, 02H
        INT 21H
        
        
        MOV DX, OFFSET STRING
        MOV AH, 9
        INT 21H
        
        

        
        MOV AX, DATA
        MOV DS, AX
        MOV ES, AX
        MOV CX, STRLEN1
        ADD CX, -2
        
        LEA SI, INPUT_M
        LEA DI, STRREV
        
        ADD SI, STRLEN1
        ADD SI, -2
        
        L1:
        MOV AL, [SI]
        MOV [DI], AL
        DEC SI
        INC DI
        LOOP L1
        MOV AL, [SI]
        MOV [DI], AL
        INC DI
        MOV DL, '$'
        MOV [DI], DL
        MOV CX, STRLEN1
        
        PALIN_CHECK:
        LEA SI, INPUT_M
        LEA DI, STRREV
        REPE CMPSB
        JNE NOT_PALIN
        
        PALIN:
        MOV AH, 09H
        LEA DX, STR_PALIN
        INT 21H
        JMP EXIT
        
        NOT_PALIN:
        MOV AH, 09H
        LEA DX, STR_NOT_PALIN
        INT 21H
        
        EXIT:
        MOV AX, 4CH
        INT 21H
CODE ENDS
END BEGIN



