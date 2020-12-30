.MODEL SMALL
.STACK 64
.DATA

  STRING DB ?
  SYM DB '$'
  
  INPUT_M DB 0ah,0dh,0AH,0DH, 'PLEASE ENTER A STRING: ',0DH,0AH,'$'
  
  OUTPUT_M DB 0ah,0dh,0AH,0DH, 'TOTAL NUMBER OF VOWELS IN THE STRING: ',0DH,0AH,'$'
  
  STR        DB  50 DUP (?)   
   C_VOWELS      DB  'AEIOU'
   S_VOWELS      DB  'aeiou'
   C_CONSONANTS  DB  'BCDFGHJKLMNPQRSTVWXYZ'
   S_CONSONANTS  DB  'bcdfghjklmnpqrstvwxyz'
  
.CODE
MAIN PROC
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
       
OUTPUT: LEA DX, OUTPUT_M
        MOV AH, 9
        INT 21H
        
        
        @COUNT:                      
       LODSB                     

       LEA DI, C_VOWELS           
       MOV CX, 5                  

       REPNE SCASB                
       JE @INCREMENT_VOWELS       
                                  

       LEA DI, S_VOWELS           
       MOV CX, 5                  

       REPNE SCASB               
       JE @INCREMENT_VOWELS      
                                  

       LEA DI, C_CONSONANTS       
                                  
       MOV CX, 21                

       REPNE SCASB                
       JE @INCREMENT_CONSONANTS   
                                 

       LEA DI, S_CONSONANTS      
                                 
       MOV CX, 21                

       REPNE SCASB               
       JE @INCREMENT_CONSONANTS   
                                 

       JMP @NEXT                 

       @INCREMENT_VOWELS:        
         INC DL                   
         JMP @NEXT               

       @INCREMENT_CONSONANTS:    
         INC DH                   

       @NEXT:                    
         DEC BX            
         JNE @COUNT
        
        
        MOV AH, 4CH
        INT 21H
        
MAIN ENDP
END MAIN




