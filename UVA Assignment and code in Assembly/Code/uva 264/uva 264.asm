include "emu8086.inc"
.model small
.stack 100h
.data
info db "The input list contains a single number per line and",10,13," will be terminated by 0.$"
value db ?
a db ?
b db ?
i db ?
n db ?
.code
main proc 
        ;fetching data segment
    mov ax,@data
    mov ds,ax
         ;printing info
    lea dx,info
    mov ah,9
    int 21h
    printn
    
    mov value,0        ;value=0
    
  again:
  input_for: 
            ;user input
    mov ah,1
    int 21h
    cmp al,13     ;checking input==\n
    je next_loop
          
          ;taking multi digit input 
    sub al,48
    mov bl,al
    mov al,value
    mov ah,10
    mul ah
    add al,bl
    mov value,al
    jmp input_for
    
   next_loop: 
    mov al,value    ;checking input==0?
    cmp al,0
    je exit             ;if true then exit
    
    mov value,al
    mov n,al
    
    mov bh,1    ;for(int i=1
        
        ;making the operation with for loop
  for_loop:
    mov bl,value
    cmp bh,bl     ;i<value
    jge next
    sub bl,bh     ;value-i
    mov value,bl
    inc bh        ;i++
    mov i,bh
    jmp for_loop
    
  next:  
           ;getting the mod value of i%2 store in ah
    mov al,i
    mov bl,2
    div bl
    
    cmp ah,1        ;checking ah==1?
    je work1
    mov al,value
    mov a,al    ;a=value
    jmp work2
    
  work1:
            ;a=1+i-value
    mov bl,1
    mov bh,i
    add bl,bh
    sub bl,value
    mov a,bl
    
  work2:  
        ; b=i-a+1;
    mov bh,i
    mov bl,a
    sub bh,bl
    add bh,1
    mov b,bh
         
         ;printing the result in this formation 
         
         ;printf("TERM %d IS %d/%d\n",n,a,b);
    printn
    print "TERM "
    mov bh,n
    cmp bh,9
    jg twodigit_value
    mov ah,2
    mov dl,n
    add dl,48
    int 21h
    jmp is
    
  twodigit_value:  
    mov al,0
    add al,n
    mov ah,0
    aaa
    mov bx,ax
    mov ah,2
    mov dl,bh
    add dl,48
    int 21h
    mov dl,bl
    add dl,48
    int 21h
  is:  
    print " IS "
    mov ah,2
    mov dl,a
    add dl,48
    int 21h
    print "/"
    mov ah,2
    mov dl,b
    add dl,48
    int 21h
    printn
         
         ;making all variable value to 0
    mov value,0
    mov i,0
    mov a,0
    mov b,0
        
    jmp again   ;calling again for restarting the program
  exit:
    mov ah,4ch
    int 21h  
    main endp
end main