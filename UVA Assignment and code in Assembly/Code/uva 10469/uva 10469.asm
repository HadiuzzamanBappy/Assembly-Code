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
    
    mov bl,a
    mov bh,b
    xor bh,bl        ;first ^ second
    
    cmp bh,9
    jg greater       ;if(output>9)
                           ;print 2 digit
    
    mov dl,bh
    add dl,48         ;else
    mov ah,2            ;print 1 digit
    int 21h
    jmp restart
    
  greater:
    mov al,bh
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