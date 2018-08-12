org 100h
.model small
.stack 100h
.data
char db ?
.code
main proc
    mov ah,1
    int 21h
    mov char,al
    
    mov ah,2
    mov dl,0ah
    int 21h
    
    mov dl,0dh
    int 21h
    
    sub char,32
    
    mov ah,2
    mov dl,char
    int 21h
main endp
end main
    
    