org 100h
.model small
.stack 100h
.data
about db "a program to determine the value of the third card",10,13,"that maximizes the probability of that ",10,13,"player winning the game.$"
frst db 10,13,"Enter the frst number A (1<A<13): ",10,13,"$"
scnd db 10,13,"Enter the second number B (1<B<13): ",10,13,"$"
win db "Winning Card: ",10,13,"$"

.code
main proc
    
    ;loading data to the data segment
    mov ax,@data
    mov ds,ax
       
       ;loading the about
    lea dx,about
    mov ah,9
    int 21h
    
 again_start:
            ;setting message for first input
    lea dx,frst
    mov ah,9
    int 21h
        
        ;getting the first input
    mov ah,1
    int 21h
    mov bh,al
          
          ;setting message for second input
    lea dx,scnd
    mov ah,9
    int 21h
         
         ;getting the second input
    mov ah,1
    int 21h
    mov bl,al
        
        ;new line
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
         ;output message
    lea dx,win
    mov ah,9
    int 21h
          ;checking what is greater than other
    cmp bl,bh
    jge greater  ;if bl greater than and equal with bh then jump greater label
    jmp lesser          ;else lesser label
    
  greater:
        ;printing greater or equal as bl
    mov dl,bl
    mov ah,2
    int 21h
           
           ;procedure start again for next test case
    jmp again_start 
    
  lesser:
        ;printing leasser as bh
    mov dl,bh
    mov ah,2
    int 21h
          
          ;procedure start again for next test case
    jmp again_start
    
    main endp
end main