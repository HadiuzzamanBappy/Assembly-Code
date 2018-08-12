org 100h
.model small
.stack 100h
.data
    x db ?
    x1 db "enter the input:$"
    x2 db "displaying the output:$"
.code
main proc
    
    ;storing all data to the data segment
    mov ax,@data
    mov ds,ax
    
    ;displaying the input asking ques
    lea dx,x1
    mov ah,9
    int 21h
    
    ;entering a new line
     mov ah,2
     mov dl,0dh
     int 21h
     
     mov dl,0ah
     int 21h
    
    ;ask for input
     mov ah,1
     int 21h
     
     ;keeping the input in a temporary variable
     mov x,al
     
     ;entering a new line
     mov ah,2
     mov dl,0ah
     int 21h
     
     mov dl,0dh
     int 21h
     
     ;displaying the output string
     lea dx,x2
     mov ah,9
     int 21h
     
     ;enetering a new line
     mov dl,0dh
     mov ah,2
     int 21h
     
     mov dl,0ah
     int 21h
     
     ;displaying the data
     mov dl,x
     mov ah,2
     int 21h
main endp
    end main
                                              