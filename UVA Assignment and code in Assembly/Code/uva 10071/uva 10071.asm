org 100h
.model small
.stack 100h
.data
v db "initial velocity : $"
a db "initial acceleration : $"
result db "displacement be in twice of that time : $"
.code
main proc
        
        ;storing the data into the data segment
    mov ax,@data
    mov ds,ax
    
  first:
        ;hint for velocity
    lea dx,v
    mov ah,9
    int 21h
            ;getting the first input
    mov ah,1
    int 21h
    sub al,48    ;make the ascii value to the decimal
    mov bl,al     ;moving the value of al to the variable a as a=al
         
         ;checking the input is zero or not
    cmp bl,0
    je zero    ;if zero then jump to the label zero
    
    call printline
                  
    ;hint for acceleration
    lea dx,a
    mov ah,9
    int 21h
        ;getting the scnd input
    mov ah,1
    int 21h
    sub al,48    ;make the ascii value to the decimal
    
            ;checking the input is zero or not
    cmp al,0
    je zero    ; if zero then jump to the label zero 
    mov cl,al
    
    call printline
     
       ;else it will work
     mov al,cl
     mul bl     ;multiply al by bl and store it in al as we know always result store in al
     mov dl,al   ;moving the value from al to dl
            
     mov al,2    ;then store the value 2 in al
     mul dl     ; and then multiply this al=2 by dl result value
     mov ah,0
     aam        ;adjusting after multiply in al and ah that means ax
          
          ;making decimal value
     add ah,48     
     add al,48
            
            ;moving ax to bx for our register work
     mov bx,ax
     
     ;hint for result
    lea dx,result
    mov ah,9
    int 21h
         
          ;printing the bx value
     mov dl,bh
     mov ah,2
     int 21h
     mov dl,bl
     int 21h
     
     call printline
        
    jmp again
    
    
  zero:
        ;printing zero as output
    mov dl,0
    mov ah,2
    int 21h
         
         ;printing new line
    mov dl,10
    int 21h
    mov dl,13
    int 21h
        
        ;initiating the programme again
  again: 
    jmp first
    
    main endp
proc printline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    ret
printline endp

end main