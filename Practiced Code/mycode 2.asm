.Model Small
.Stack 100h
.data
    str1 DB "Enter a Number:$"
.code 
Main Proc
        ;initialize data segment
    MOV AX,@Data
    MOV DS,AX 
    
        ;load the starting address of str1 
    LEA DX,str1  ;LEA=Load Efective Address
    MOV AH,9
    INT 21h
    
        ;taking an input
    MOV AH,1
    INT 21h
      
        ;last 2 constant 2 line
    MOV AH,4CH
    INT 21h
    
Main Endp
    End Main