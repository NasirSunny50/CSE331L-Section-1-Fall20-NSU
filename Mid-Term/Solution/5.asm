.MODEL SMALL
.STACK 100h
.DATA        
     
     A DB 1,1,2,2,3,3
     B DB 6     
     
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AX,DATA
        MOV DS,AX
        MOV CL,6
        
        LEA BX,A
        
        MOV AH, 4CH
        INT 21H
    
MAIN ENDP
END MAIN
                 
                 


