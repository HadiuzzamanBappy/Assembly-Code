include "emu8086.inc"
.model small
.stack 100h
.data
value1 dw ?
value2 dw ?
i dw ?
carry dw ?
r dw ?
c dw ?
value dw ?

.code
main proc 
            ;fetching the data
    mov ax,@data
    mov ds,ax
    
  restart: 
             ;calling for first multidigit number
    mov value,0  
    call input      ;input function call
    mov dx,value
    mov value1,dx        ;value1
    
    printn        ;new line
             ;calling for 2nd multidigit number
    mov value,0  
    call input
    mov dx,value
    mov value2,dx
    
    mov ax,value1
    cmp ax,0             ;if (value1==0
    je second_zero       ;then go for second value checking
    jmp main_work
    
  second_zero:
    mov ax,value2
    cmp ax,0            ;&& value2==0)
    je exit                ;then jump exit
    
  main_work:
    mov r,0          ;r=0;
    mov carry,0       ;carry=0;
    
    mov i,1       ;for(i=1; 
    
  main_for: 
    mov ax,value1
    cmp ax,0
    je second_zero2
    jmp work
    
  second_zero2:
    mov ax,value2           ;if (value1==0 && value2==0)
    cmp ax,0                      ;then go for printing result
    je print_result
    
  work:  
    mov c,0
    
    mov ax,i              ;for(i=1; i<16;
    cmp ax,16
    jge print_result 
    
    mov ax,r
    add c,ax               ;c+=r;
    
    xor dx,dx
    mov ax,value1
    mov bx,10
    div bx
    
    add c,dx        ;c+= (value1%10)
    
    xor dx,dx
    mov ax,value2
    mov bx,10
    div bx
    
    add c,dx        ;c+=(value2%10)
    
    mov ax,c
    cmp ax,9        ;if(c>9)
    jg r_1              ;then go to r_1
    
    mov r,0             ;else r=0
    jmp division_values
  
  r_1:
    inc carry          ;carry++;
    mov r,1              ;r=1;
  
  division_values:  
    xor dx,dx
    mov ax,value1
    mov bx,10
    div bx
    
    mov value1,ax       ;value1/=10;
    
    xor dx,dx
    mov ax,value2
    mov bx,10
    div bx
    
    mov value2,ax        ;value2/=10;
    
    inc i          ;i++)
    jmp main_for
    
  print_result:
    printn
    mov ax,carry
    cmp ax,0          ;if(carry==0)
    je no_carry
    
    mov ax,carry
    cmp ax,1            ;else if(carry==1)
    je one_carry
    
    mov dx,carry     ;else
    add dl,48        ;print carry value
    mov ah,2
    int 21h
    
    printn " carry operation."    ;printf("%d carry operations.\n",carry);
    jmp restart
  no_carry:
    printn "No carry operation."   ;printf("No carry operation.\n");
    jmp restart
    
  one_carry:
    printn "1 carry operation."    ;printf("1 carry operation.\n");
    jmp restart
      
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