.MODEL SMALL
.STACK 64
.DATA

  STRING DB ?
  SYM DB '$'
  VOWEL DB ?
  
  INPUT_M DB 0ah,0dh,0AH,0DH, 'ENTER INPUT STRING: ',0DH,0AH,'$'
  
  OUTPUT_M DB 0ah,0dh,0AH,0DH, 'TOTAL NUMBER OF VOWEL IN BL REGISTER',0DH,0AH,'$'
  
  
.CODE
MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
    
        MOV DX, OFFSET INPUT_M
        MOV AH, 9
        INT 21H
    
        LEA SI, STRING 
    
INPUT:  
        MOV AH, 1
        INT 21H
       
        MOV [SI], AL
        INC SI
       
        CMP AL, 0DH
        JNZ INPUT
       
        MOV AL, SYM
        MOV [SI],'$'
     
OUTPUT:
        LEA DX, OUTPUT_M
        MOV AH, 9
        INT 21H
        
        MOV DL, 0AH
        MOV AH, 02H
        INT 21H
       
        
        MOV SI, OFFSET STRING  
        MOV BL, 00
    
             
 
CHECK: 
        MOV AL, [SI]
        CMP AL,'$'
        JZ END
        CMP AL,'A'
        JZ COUNT   
        CMP AL,'E'
        JZ COUNT   
        CMP AL,'I'
        JZ COUNT   
        CMP AL,'O'
        JZ COUNT   
        CMP AL,'U'
        JZ COUNT
        CMP AL,'a'
        JZ COUNT   
        CMP AL,'e'
        JZ COUNT   
        CMP AL,'i'
        JZ COUNT   
        CMP AL,'o'
        JZ COUNT   
        CMP AL,'u'
        JZ COUNT   
        INC SI
        JMP CHECK
  
   
  
  COUNT: 
        INC BL
        MOV VOWEL, BL
        INC SI
        JMP CHECK
  
  
  END:
    MOV AH, 4CH 
    INT 21H
MAIN ENDP
END MAIN



