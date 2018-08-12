.Model Small
.Stack 100h
.code
Main Proc 
        ;ask user for a input digit
    MOV DL,':'
    MOV AH,2
    INT 21h
    
        ;taking an input
    MOV AH,1
    INT 21h
      
        ;moving the input to other register
    MOV CL,AL
    
        ;ask user for another input
    MOV DL,':'
    MOV AH,2
    INT 21h
      
        ;displaying it
    MOV AH,1
    INT 21h 
    
        ;adding and displaying procedure
    ADD CL,AL
    SUB CL,48
    
        ;creating new line
    MOV DL,0Dh
    MOV AH,2
    INT 21h
    
    MOV DL,0Ah
    INT 21h 
    
    
        ;displaying an equal sign
    MOV DL,'='
    MOV AH,2
    INT 21h
    
    MOV DL,CL
    MOV AH,2
    INT 21h
    
        ;last 2 constant 2 line
    MOV AH,4CH
    INT 21h
    
Main Endp
    End Main