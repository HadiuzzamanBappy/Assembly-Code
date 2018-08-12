org 100h
.model small
.stack 100h
.data
number1 db ?
number2 db ?
number3 db ?
hint1 db "enter the two number:$"
hint2 db "the result is: $"

.code
main proc
    mov ax,@data
    mov ds,ax
    
    new:
    
    mov ah,9
    lea dx,hint1
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,1
    int 21h
    
    mov number1,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,1
    int 21h
    
    mov number2,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov al,number2
    mov cl,number1
    cmp cl,al
    jg exchange
    
    mov al,0
    add al,number2
    sub al,number1
    add al,48
    mov number2,al
    
    print:
    mov ah,9
    lea dx,hint2
    int 21h
    
    mov dl,number2
    mov ah,2
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    loop new
    
    exchange:
    mov al,0
    add al,number1
    sub al,number2
    add al,48
    mov number2,al
    jmp print
    
    mov ah,4ch
    int 21h
    main endp
end main