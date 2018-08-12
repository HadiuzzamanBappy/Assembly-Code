include "emu8086.inc"
.model small
.stack 100h
.data
value db ?
result db ?
length db ?
.code
main proc 
        ;fetching data from data segment
    mov ax,@data
    mov ds,ax
  printn "PERFECTION OUTPUT"  
  again:     
            ;making all the variable value to zero
    mov result,0
    mov value,0
        ;taking input
         ;scanf for two digit
  loop_input:
    mov ah,1
    int 21h    
    cmp al,13      ;checking whether it is new line
    je next
    sub al,48
    mov bl,al
    mov al,value
    mov bh,10
    mul bh
    add al,bl
    mov value,al
    jmp loop_input
    
  next:
    printn
            ;input value/2
    mov al,value
    cmp al,0
    je exit
    mov ah,0
    mov bl,2
    div bl
    mov length,al
    mov bl,1    ;for(int i=1
  loop_for:
    cmp bl,length    ;i<value/2
    jg real_ans
    mov al,value
    mov ah,0
    div bl
    cmp ah,0
    je addition         ;jumping addition loop if(value%2==0)
    inc bl      ;i++
    jmp loop_for
         
         ;result+=i;
  addition:
    mov bh,result
    add bh,bl
    mov result,bh
    inc bl
    jmp loop_for
      
  real_ans:
    mov bh,result
    cmp bh,value
    je equal        ;if(sum==a) jmp equal
    cmp bh,value   ;if(sum<a)
    jl lesser         ;jmp lesser
             
             
             ;else printf("%5d  ABUNDANT\n",a);
    mov bh,value
    cmp bh,9
    jg greater1
    mov ah,2
    mov dl,value
    add dl,48
    int 21h
    printn "  ABUNDANT"
    jmp again 
    
            ;for two digit output
  greater1:
    mov al,value
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
    printn "  ABUNDANT"
    jmp again
            
            ;printf("%5d  PERFECT\n",a);
  equal:
    mov bh,value
    cmp bh,9
    jg greater2
    mov ah,2
    mov dl,value
    add dl,48
    int 21h
    printn "  PERFECT"
    jmp again 
    
            ;for two digit output
  greater2:
    mov al,value
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
    printn "  PERFECT"
    jmp again
    
    jmp again
            
            printf("%5d  DEFICIENT\n",a);
  lesser:
    mov bh,value
    cmp bh,9
    jg greater3
    mov ah,2
    mov dl,value
    add dl,48
    int 21h
    printn "  DEFICIENT"
    jmp again
            
            ;for two digit output
  greater3:
    mov al,value
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
    printn "  DEFICIENT"
    jmp again 
        ;jump exit
  exit:  
    mov ah,4ch
    int 21h
    main endp
end main