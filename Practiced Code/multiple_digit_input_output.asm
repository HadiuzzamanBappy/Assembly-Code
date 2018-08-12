include "emu8086.inc"
.model small
.stack 100h
.data
value dw ?
value1 dw ?
count dw ?
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov value,0
    call input
    mov ax,value
    mov value1,ax
    
    printn
    
    mov count,0
  push_value:
    mov ax,value1
    cmp ax,0
    je pop_value
    
    xor dx,dx
    mov bx,10  
    div bx
    
    push dx
    mov value1,ax
    
    inc count
    
    jmp push_value
    
  pop_value:
    mov ax,count
    cmp ax,0
    je exit2
    dec count
      
    pop dx
    add dx,48
    mov ah,2
    int 21h
    
    jmp pop_value
    
  exit2:
    mov ah,4ch
    int 21h
      
    main endp
input proc
    push ax
    push bx
    push cx
    push dx
 
 for_loop:   
    mov ah,1
    int 21h
    cbw       ;al=input value, ah=1 oi j mov korlam
                    ;then jkhn cbw dilm then al=input value and ah=0 hoye gese
    cmp ax,13
    je exit
    
    sub ax,48
    
    mov cx,ax
    
    mov ax,value
    mov bx,10
    mul bx
    
    add ax,cx
    
    mov value,ax
    
    jmp for_loop
    
  exit:  
    pop dx
    pop cx
    pop bx
    pop ax
    ret
    input endp
end main