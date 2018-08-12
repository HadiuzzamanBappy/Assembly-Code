include "emu8086.inc"
.model small
.stack 100h
.data
t dw ?
sum dw ?
sum2 dw ?
i dw ?
n dw ?
m dw ?
j dw ?
value dw ?
count dw ?
a dw 100 dup(0)
.code
main proc 
           ;fetching all data
    mov ax,@data
    mov ds,ax
    
 again:
    mov j,1
    mov count,0     ;count=0
    
    mov value,0
    call input
    mov ax,value     ;scanf("%d",&t)!=
    mov t,ax
    
    printn
    
    cmp ax,0
    je exit      ;checking whetther  t!=0
    
    mov sum,0    ;sum=0;
    mov sum2,0   ;sum2=0;
    
    mov i,0     ;for(i=0;
    mov si,0    ;array index
  for1:
    mov ax,i
    cmp ax,t
    jge for2_zero    ;i<T;
    
    mov value,0
    call input      ;scanf("%d",&a[i]);
    mov ax,value
    
    printn
    
    mov a[si],ax
    add ax,sum
    mov sum,ax       ;sum+=a[i];
    
    inc si    ; as define word then index+=2
    inc si
    inc i     ;i++)
    jmp for1  
  for2_zero:  
    xor dx,dx
    mov ax,sum
    mov bx,t
    div bx
    
    mov n,ax   ;n=sum/t;
    
    mov i,0     ;for(i=0;
    mov si,0     ;array index
  for2:
    mov ax,i
    cmp ax,t
    jge push_before  ;i<T;
    
    mov ax,n
    cmp a[si],ax
    jle increament  ;if(a[i]>n)
    
    mov ax,a[si]
    sub ax,n
    mov m,ax      ; m=a[i]-n;
    
    mov ax,m
    add sum2,ax   ;sum2+=m;
  increament:  
    inc si     ; as define word then index+=2
    inc si
    inc i    ;i++)
    
    jmp for2
  push_before:
    print "Set#"     ;printf("Set #
  push_value:
    mov ax,j
    cmp ax,0     ;checking for j is 0 or not
    je pop_value
    
    xor dx,dx
    mov bx,10  
    div bx        ;sum/10
    
    push dx      ;pushing last digit as reminder
    mov j,ax
    
    inc count      ;value length increase
    
    jmp push_value
    
  pop_value:
    mov ax,count
    cmp ax,0       ;checking for value length
    je push_before2
    dec count
      
    pop dx
    add dx,48
    mov ah,2     ;printing digit from stack
    int 21h
    
    jmp pop_value
    
  push_before2:
    printn          ;printf("The minimum number of moves is") 
    print "The minimum number of moves is "    
  push_value2:
    mov ax,sum2
    cmp ax,0     ;checking for sum2 is 0 or not
    je pop_value2
    
    xor dx,dx
    mov bx,10  
    div bx        ;sum/10
    
    push dx      ;pushing last digit as reminder
    mov sum2,ax
    
    inc count      ;value length increase
    
    jmp push_value2
    
  pop_value2:
    mov ax,count
    cmp ax,0       ;checking for value length
    je exit2
    dec count
      
    pop dx
    add dx,48
    mov ah,2     ;printing digit from stack
    int 21h
    
    jmp pop_value2    
  exit2:
    printn 
    inc j      ;j++;
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