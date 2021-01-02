.MODEL SMALL
.STACK 100H

.DATA
        STR1 DB "ENTER a to z: $"
        I1 DB 50 DUP("$")
        I2 DB 50 DUP("$")
        NEW DB 10,13,"$"
        



MAIN PROC
CODE SEGMENT
        ASSUME DS:DATA,CS:CODE
START:

        MOV AX,@DATA
        MOV DS,AX

        LEA SI,I1


        MOV AH,09H
        LEA DX,STR1
        INT 21H

        MOV AH,0AH
        MOV DX,SI
        INT 21H


        MOV AH,09H
        LEA DX,NEW
        INT 21H

        MOV CL,I1+1
        ADD CL,1
        ADD SI,2

        L1:
        
        INC SI

        CMP BYTE PTR[SI],"$"
        JNE L1

        DEC SI

        LEA DI,I2
        
        L2:
        MOV AL,BYTE PTR[SI]

        MOV BYTE PTR[DI],AL

        DEC SI
        INC DI
        LOOP L2 

        MOV AH,09H
        LEA DX,I2
        INT 21H


        MOV AH,09H
        LEA DX,NEW
        INT 21H
        
        MOV AH,4CH
        INT 21H


ENDS
END START




