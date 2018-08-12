include "emu8086.inc" 
.model small
.stack 100h
.data
value dw ?
value1 dw ?
value2 dw 100 dup(0)
count dw ?
count2 dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
 again:
    mov count,0
    mov count2,0
       
    mov value,0
    call input
    mov ax,value
    mov value1,ax
    
    printn
    
    lea si,value2
     
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
    inc count2
    
    jmp push_value
    
  pop_value:
    
    mov ax,count
    cmp ax,0
    je exit_print
    dec count
      
    pop dx
    mov [si],dx
    add dx,48
    mov ah,2
    int 21h
    
    add si,2
    
    jmp pop_value
    
  exit_print:
    sub si,2
    
    mov di,si
    xor si,si
    
    lea si,value2
    
  value_check:
    mov ax,[si]
    mov bx,[di]
    cmp ax,bx
    je value_next
    jmp exit_not
    
 value_next:
    sub count2,1
    add si,2
    sub di,2
       
    mov ax,count2
    cmp ax,0
    je exit_yes
    jmp value_check
    
 exit_yes:
    printn
    printn "Pallindrome"   
    jmp exit
    
 exit_not:
    printn
    printn "Not Pallindrome"
 exit:
    jmp again        
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
    je exit2
    
    sub ax,48
    
    mov cx,ax
    
    mov ax,value
    mov bx,10
    mul bx
    
    add ax,cx
    
    mov value,ax
    
    jmp for_loop
    
  exit2:  
    pop dx
    pop cx
    pop bx
    pop ax
    ret
    input endp
end main