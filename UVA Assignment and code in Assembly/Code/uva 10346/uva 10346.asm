include "emu8086.inc"
.model small
.stack 100h
.data
a dw ?
b dw ?
x dw ?
z dw ?
n dw ?
sum dw ?
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
    
    mov value,0
    call input
    mov ax,value      ;scanf("%d",&b)!=
    mov b,ax
    
    printn   
    
    cmp ax,1
    jle exit       ;if(b>1) then exit
    
    mov ax,a
    mov n,ax      ;n=a
    
    mov sum,0     ;sum=0
    
  while:
    mov ax,a
    cmp ax,b
    jl print_sum   ;while(a>=b)
    
    xor dx,dx
    mov ax,a
    mov bx,b     ;a/b
    div bx
    
    mov z,ax    ;z=a/b;
    
    mov x,dx   ;x=a%b;
    
    add ax,dx
    
    mov a,ax   ;a=z+x;
    
    mov ax,z
    add sum,ax   ;sum=sum+z;
    
    jmp while
      
  print_sum:
    mov ax,n
    add sum,ax    ;sum=sum+n
  push_value:
    mov ax,sum
    cmp ax,0     ;checking for sum is 0 or not
    je pop_value
    
    xor dx,dx
    mov bx,10  
    div bx        ;sum/10
    
    push dx      ;pushing last digit as reminder
    mov sum,ax
    
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