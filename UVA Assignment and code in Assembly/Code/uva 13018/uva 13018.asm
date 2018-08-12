include "emu8086.inc"
.model small
.stack 100h
.data
m db ?
n db ?
i db ?
t db ?
.code
main proc
           ;fetching all data
    mov ax,@data
    mov ds,ax
    
    mov t,1       ;t=1;
  again:
    xor dl,dl
    call input     ;scanf("%d",&n)
    mov m,dl
    
    printn
    
    xor dl,dl
    call input     ;scanf("%d",&n)
    mov n,dl
    
    mov bl,t         ;if(t==0)
    cmp bl,0
    je one_line_print     ;then print one line
    jmp next_step
      
  one_line_print:
    printn              ;printf("\n");
  
  next_step:  
    mov bl,m
    cmp bl,n
    jg just_exchange     ;if(m>n)
    
    jmp just_exchange_skip    ;else skip exchanging
 just_exchange:
 
    mov bl,m
    mov bh,n
    mov m,bh         ;m=n
    mov n,bl          ;n=m
    
  just_exchange_skip:
    mov bl,m
    cmp bl,n           ;if(m==n)
    je print_m
    
    jmp looping_print_n
               
  print_m:
        add bl,1
        cmp bl,9
        jg greater1
        
        mov dl,bl
        add dl,48      ;printf("%d\n",m+1); for one digit
        mov ah,2
        int 21h
        
        jmp after_print_m 
        
      greater1:
        mov al,bl
        mov ah,0
        mov bl,10
        div bl
        
        mov cx,ax
        
        mov dl,cl          ;;printf("%d\n",m+1); for two digit
        add dl,48
        mov ah,2
        int 21h 
     
        mov dl,ch
        add dl,48
        mov ah,2
        int 21h
        
  after_print_m:     
    printn            ;print new line
    
    jmp making_t_zero
    
  looping_print_n:
     mov bl,m
     add bl,1
     mov i,bl       ;for(i=m+1;)
    for_loop:
        mov bh,n
        add bh,1
        cmp i,bh           ;i<=n+1
        jg making_t_zero
        
        cmp bl,9
        jg greater2
        
        mov dl,i
        add dl,48      ;printf("%d\n",i); for one digit
        mov ah,2
        int 21h 
        jmp loop_again
        
     greater2:
        mov al,i
        mov ah,0
        mov bl,10
        div bl
        
        mov cx,ax
        
        mov dl,cl
        add dl,48       ;;printf("%d\n",i); for 2 digit
        mov ah,2
        int 21h 
     
        mov dl,ch
        add dl,48
        mov ah,2
        int 21h
      loop_again:
        printn
        inc i         ;;i++
        jmp for_loop 
  
  making_t_zero:   
     mov t,0        ;t=0;
     
     jmp again
    
    main endp
input proc
  input_loop:  
    mov ah,1
    int 21h
    cmp al,13   ;taking input and checking either new line
    je return
    
    sub al,48
    mov bl,al
    mov al,dl
    mov bh,10     ;taking multi digit by adding with 10*before
    mul bh                      ;+current
    add al,bl
    mov dl,al
    jmp input_loop
    
  return:
    ret  
    input endp
end main