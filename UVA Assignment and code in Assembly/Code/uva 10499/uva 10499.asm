include "emu8086.inc"
.model small
.stack 100h
.data
.code
main proc
  input:  
    mov ah,1
    int 21h       ;scanf("%ld",&a)
    cmp al,45
    je finish        ;if(a>0) then finish
    
    cmp al,1
    je zero_output   ;if(a==1) then  zero_output
    
    sub al,48
    mov bl,25
    mul bl
    mov ah,0
    mov bl,10       ;25*a
    div bl
    mov bx,ax
    
    printn
    mov ah,2
    mov dl,bl      ;as it is 2 digit value then prin high value which is stored in bl register
    add dl,48
    int 21h
    mov dl,bh
    add dl,48           ;low value which is in bh
    int 21h
    
    printn "%"
    jmp input
    
  zero_output:
    printn "0%"          ;printf("0%%\n");
    jmp input
    
    finish:
    mov ah,1      ;taking another any input after - sign
    int 21h
    printn
    mov ah,4ch      ;exit
    int 21h
    main endp
end main 