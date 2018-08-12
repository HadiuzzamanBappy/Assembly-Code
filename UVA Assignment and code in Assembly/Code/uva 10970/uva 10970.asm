include "emu8086.inc"
.model small
.stack 100h
.data
a db ?
b db ?
.code
main proc
  
  again:  
    mov dl,0
    call input        ;taking first input
    
    mov a,dl
    
    printn
    
    mov dl,0
    call input         ;taking second input

    mov b,dl
    
    printn
    
    mov ah,0
    mov al,a
    mov bl,b
    mul bl
    sub al,1
    
    cmp al,9
    jg greater
    
    mov dl,al
    add dl,48         ;else
    mov ah,2            ;print 1 digit
    int 21h
    jmp restart
    
  greater:
    xor ah,ah
    aaa
    
    mov bx,ax
    
    mov dl,bh
    add dl,48        ;print high digit
    mov ah,2
    int 21h

    mov dl,bl
    add dl,48         ;print low digit
    mov ah,2
    int 21h 
  
  restart:  
    printn
    jmp again       ;restart the program
    main endp
input proc
  input_loop:  
    mov ah,1
    int 21h
    cmp al,13
    je return
    
    sub al,48
    mov bl,al
    mov al,dl
    mov bh,10
    mul bh
    add al,bl
    mov dl,al
    jmp input_loop
    
  return:
    ret  
    input endp
end main