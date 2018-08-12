include "emu8086.inc"
.model small
.stack 100h
.data
testcase db ? 
a db ?
b db ?
.code
main proc 
            ;fetching data fro data segment
    mov ax,@data
    mov ds,ax
  
  again:
        ;making the value set
    mov a,0
    mov b,1
           
           ;taking the testcase input while (testcase!=0)
    mov ah,1
    int 21h
    sub al,48
    cmp al,0
    je exit
    mov testcase,al
    mov al,0         ;for(int i=0
  for_start:
    cmp al,testcase    ;i<testcase
    jge result  
    inc al            ;i++
    
    mov bh,b    ;c=b;
    mov bl,a
    add bl,bh    ;b=a+b;

    mov b,bl     ;assign to b
    mov a,bh       ;a=c;
    jmp for_start
    
  result:
    printn
    mov bl,b
    cmp bl,9            ;printf("%d\n",b); for 1 digit
    jg greater
    mov dl,b
    add dl,48
    mov ah,2
    int 21h
    printn
    jmp again
    
  greater:
    mov al,b
    mov ah,0
    aaa
    mov bx,ax
    mov dl,bh                ;printf("%d\n",b); for 2 digit
    add dl,48
    mov ah,2
    int 21h
    mov dl,bl
    add dl,48
    int 21h
    printn    
    jmp again
    
  exit:
    mov ah,4ch
    int 21h  
    main endp
end main