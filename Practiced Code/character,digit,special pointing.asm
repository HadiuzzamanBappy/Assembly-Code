org 100h
.model small
.stack 100h
.data
    ucaseMSG db "this is an uppercase character:$"
    lcaseMSG db "this is a lowercase character:$"
    digitMSG db "this is a digit:$"
    specialMSG db "this is a special character:$"
.code
main proc
    
    ;initialising data segment
    mov ax,@data
    mov ds,ax
    
    again2:
    ;prompt user
    mov dl,":"
    mov ah,2
    int 21h
    
    ;input from user
    mov ah,1
    int 21h
    mov bl,al    ;moving the temporary data fromn al to bl
    
    ;denote a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ;comparing for uppercase
    cmp bl,65
    jge checkucase   ;if condition true the jumping to checkucase 
     
lowercasechecking:
    ;comparing for lowercase
    cmp bl,97
    jge checklcase     ;if condition true the jumping to checklcase

digitchecking:    
    ;comparing for digit
    cmp bl,48
    jge checkdigit     ;if condition true the jumping to checkdigit
    jmp special           ;else to the special label
    
      
checkucase:
    cmp bl,90
    jle uppercase              ;if condition true the jumping to uppercase
    jmp lowercasechecking            ;else to the  lowercasechecking
    
checklcase:
    cmp bl,122
    jle lowercase         ;if condition true the jumping to lowercase
    jmp digitchecking            ;else to the digitchecking
    
checkdigit:
    cmp cl,57
    jle digit             ;if condition true the jumping to digit
          
uppercase:
        ;printing the uppercase msg
    lea dx,ucaseMSG
    mov ah,9
    int 21h
    jmp again
lowercase:
        ;printing the lowercase msg
    lea dx,lcaseMSG
    mov ah,9
    int 21h
    jmp again
digit:
        ;printing the digit msg
    lea dx,digitMSG
    mov ah,9
    int 21h
    jmp again
special:
        ;printing the special character msg
    lea dx,specialMSG
    mov ah,9
    int 21h
    jmp again
    
again:
        ;printing a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    jmp again2

exit:
        ;terminating the program
    mov ah,4ch
    int 21h
    
    main endp
end main
        