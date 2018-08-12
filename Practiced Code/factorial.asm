include "emu8086.inc"
.model small
.stack 100h
.data
sum dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,8
    mov ax,1
  factorial:
    mul cx
    
    loop factorial
    
    mov ah,4ch
    int 21h
    
    main endp
end main