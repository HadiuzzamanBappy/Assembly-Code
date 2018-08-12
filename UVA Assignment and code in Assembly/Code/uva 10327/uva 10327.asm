include "emu8086.inc"
.model small
.stack 100h
.data
a dw ?
b dw 100 dup(0)
c dw ?
i dw ?
j dw ?
d dw ?
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
    mov ax,value     ;scanf("%d",&a)
    mov a,ax
    
    printn
    
    mov d,0    ;d=0;
    
    mov i,0      ;for(i=0;  
    mov si,0
  for1:
    mov ax,a
    cmp i,ax
    jge before_for2   ;i<a;
    
    mov value,0
    call input
    mov ax,value     ;scanf("%d",&b[i])
    mov b[si],ax
    
    printn
    
    inc i      ;i++)
    inc si
    inc si     ;index increasing
    jmp for1
  before_for2:
    mov i,1    ;for(i=1;  
    mov j,0      ;for(j=0;  
    mov si,0
  for2:
    mov ax,a
    cmp i,ax
    jge print   ;i<a;
  for3:
    mov ax,a
    dec ax
    cmp j,ax
    jge increament   ;j<a-1;
    
    mov ax,b[si]
    cmp ax,b[si+2]
    jle increament2   ;if(b[j]>b[j+1])
    
    mov bx,b[si]
    mov ax,b[si+2]     
    
    mov b[si+2],bx
    mov b[si],ax       ;swap(b[j] and b[j+1])
    
    inc d        ;d++;
    
  increament2:    
    inc j       ;j++)
    inc si
    inc si      ;;index increasing
    jmp for3
    
  increament:  
    inc i      ;i++)
    mov si,0
    mov j,0    ;for(j=0;
    jmp for2
  print:
    mov dx,d
    print "Minimum exchange operations : "
    cmp dx,0
    jg push_value
    add dl,48
    mov ah,2       ;if result is zero
    int 21h
    
    jmp exit2    
  push_value:
    mov ax,d
    cmp ax,0     ;checking for d is 0 or not
    je pop_value
    
    xor dx,dx
    mov bx,10  
    div bx        ;d/10
    
    push dx      ;pushing last digit as reminder
    mov d,ax
    
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