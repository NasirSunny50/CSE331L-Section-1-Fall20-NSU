


org 100h

A DW 5 DUP (?)  

MOV AX, OFFSET ARRO
MOV [AX],1
MOV [AX++],2
MOV [AX],3
MOV [AX++],4
MOV [AX],5

ret




