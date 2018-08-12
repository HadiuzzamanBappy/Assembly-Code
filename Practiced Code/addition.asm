org 100h
.model small
.stack 100h
.data
    str1 db "input first number: $"
    str2 db "input second number: $"
    str3 db "sum: $"
    a db ?
    b db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,str1
    int 21h
    
    mov ah,1
    int 21h
    mov a,al
             
    mov ah,2         
    mov dl,0ah
    int 21h
    
    mov dl,0dh
    int 21h
    
    mov ah,9
    lea dx,str2
    int 21h
    
    mov ah,1
    int 21h
    mov b,al
    
    add al,a
    mov b,al
    sub b,48
             
    mov ah,2         
    mov dl,0ah
    int 21h
    
    mov dl,0dh
    int 21h
    
    mov ah,9
    lea dx,str3
    int 21h
    
    mov ah,2
    mov dl,b
    int 21h
    
main endp
    end main