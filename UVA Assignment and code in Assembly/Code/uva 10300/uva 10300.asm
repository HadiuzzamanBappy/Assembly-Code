include "emu8086.inc"
.model small
.stack 100h
.data
        ;int i,j,a,b,c,d,e;
i dw ?
j dw ?
a dw ?
b dw ?
c dw ?
d dw ?
e dw ?
count dw ?
value dw ?
sum dw ?
.code
main proc   
               ;fetching all data
    mov ax,@data     
    mov ds,ax
    
 again:
    mov count,0
       
    mov value,0
    call input     ;scanf("%d",&a)
    mov ax,value
    mov a,ax
    
    printn
    
    mov i,0    ;for(i=0;
  case_loop:
    mov ax,a
    cmp i,ax
    jge exit_case_loop  ;i<a;
    
    mov sum,0     ;int sum=0;
    
    mov value,0
    call input
    mov ax,value     ;scanf("%d",&b);
    mov b,ax
    
    printn
    
    mov j,0       ;for(j=0
  loop_for:
    mov ax,b
    cmp j,ax
    jge exit_loop    ;j<b;
    
    mov value,0
    call input
    mov ax,value     ;scanf("%d",&c);
    mov c,ax
    
    printn
    
    mov value,0
    call input
    mov ax,value      ;scanf("%d",&d);
    mov d,ax
    
    printn
    
    mov value,0
    call input
    mov ax,value     ;scanf("%d",&e);
    mov e,ax
    
    printn
    
    mov ax,c
    mov bx,e
    mul bx        ;(c*e);
    
    add ax,sum
    
    mov sum,ax     ; sum=sum+(c*e);
    
    inc j        ;j++)
    jmp loop_for
    
  exit_loop:
    mov ax,sum
    cmp ax,0
    je print_num
    
    mov dx,0
    mov ax,sum
    mov bx,10      ;for printing moving 1 by 1 digit in stack
    div bx
    
    mov sum,ax
    push dx
    
    inc count
    mov cx,count     ;counting stack length
    
    jmp exit_loop
    
  print_num:
    pop dx
    add dl,48       ;poping 1 value and printing it
    mov ah,2
    int 21h
  
    loop print_num
    
    printn
    inc i           ;i++)
    jmp case_loop
    
  exit_case_loop:
    jmp again       ;restartting program
  exit:    
    mov ah,4ch
    int 21h
    
    main endp
input proc
    push ax
    push bx     ;taking all register in stack
    push cx
    push dx
    
  input_for:
    mov ah,1
    int 21h      ;scanf
    cmp al,13
    je exit_for
    
    sub al,48
    cbw           ;converting byte to word
    
    mov cx,ax
    mov ax,value
    mov bx,10      ;saving value 
    mul bx
    
    add ax,cx
    mov value,ax   ;value=value*10 + scanf
    
    jmp input_for
    
  exit_for:  
    pop ax
    pop bx
    pop cx        ;restoring all register
    pop dx
    ret
    input endp
end main