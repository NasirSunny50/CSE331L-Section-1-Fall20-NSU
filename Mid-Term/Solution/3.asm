.MODEL SMALL
.STACK 100H

.DATA
PROMPT_1 DB "Enter a Number1:-$"
PROMPT_2 DB 0DH,0AH, "Enter a Number2:-$" 
PROMPT_3 DB 0DH,0AH, "Smallest one:-$"

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
    
    MOV AH, 1
    INT 21H
    
    MOV BL, AL 
    
    
    LEA DX, PROMPT_3            
    MOV AH, 9
    INT 21H

    CMP BL, BH                   

    JNBE @ELSE                   

    MOV DL, BL                  
    JMP @DISPLAY                

    @ELSE:                       
      MOV DL, BH                 

    @DISPLAY:                    
      MOV AH, 2                  
      INT 21H
    
    
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN



