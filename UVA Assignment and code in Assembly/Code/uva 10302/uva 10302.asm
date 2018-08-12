include "emu8086.inc"
.model small
.stack 100h
.data
a dw ?
b dw ?
c dw ?
i dw ?
value dw ?
count dw ?
.code
main proc 
           ;fetching all data
    mov ax,@data
    mov ds,ax
    
 again:
    mov count,0     ;count=0
    
    mov value,0
    call input
    mov ax,value     ;scanf("%d",&a)!=
    mov a,ax
    mov b,ax
    
    printn
    
    mov b,0    ;b=0;
    
    mov i,1     ;for(i=1;
  for:
    mov ax,i
    cmp ax,a
    jg push_value   ;i<=a;
    
    mov ax,i
    mov bx,i
    mul bx
    mul bx
    
    mov c,ax    ;c=i*i*i;
    
    mov ax,c
    add b,ax     ;b=b+c;
    
    inc i      ;i++)
    jmp for
      
  push_value:
    mov ax,b
    cmp ax,0     ;checking for sum is 0 or not
    je pop_value
    
    xor dx,dx
    mov bx,10  
    div bx        ;sum/10
    
    push dx      ;pushing last digit as reminder
    mov b,ax
    
    inc count      ;value length increase
    
    jmp push_value
    
  pop_value:
    mov ax,count
    cmp ax,0       ;checking for value length
    je exit2
    dec count
      
    pop dx
    add dx,48
    mov ah,2     ;printing digit from stack
    int 21h
    
    jmp pop_value  
  exit2:
    printn
    jmp again    ;calliing the program again 
  exit:
    mov ah,4ch
    int 21h
      
    main endp
input proc
    push ax
    push bx
    push cx    ;saving all data if used
    push dx
 
 for_loop:   
    mov ah,1
    int 21h       ;getting input
    cbw                        
    cmp ax,13
    je exit3     ;checking whether it is new line
    
    cmp ax,32
    je exit3    ;checking whether it is space
    
    sub ax,48   ;making pure digit
    
    mov cx,ax    ;cx=input
    
    mov ax,value
    mov bx,10     ;value=value*10
    mul bx
    
    add ax,cx     ;recent result+input
    
    mov value,ax   ;value=recent result
    
    jmp for_loop   ;loop call
    
  exit3:  
    pop dx
    pop cx
    pop bx     ;restoring all registor value
    pop ax
    ret
    input endp
end main