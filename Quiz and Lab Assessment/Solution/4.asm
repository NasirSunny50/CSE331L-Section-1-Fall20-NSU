 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  "Enter A Hex digit : $"
    PROMPT_2  DB  0DH,0AH, "in Decimal it is : $"


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

     MOV AH, 2                    
     MOV DL, 31H
     INT 21H

     SUB BL, 11H                  

     MOV DL, BL                   
     INT 21H

     MOV AH, 4CH               
     INT 21H
 MAIN ENDP
 END MAIN



