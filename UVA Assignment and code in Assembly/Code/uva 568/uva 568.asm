include "emu8086.inc"
.model small
.stack 100h
.data
sum db ?
i db ?
input db ?
.code
main proc 
            ;fetching data fro data segment
    mov ax,@data
    mov ds,ax
    
    printn "this only works for 1 to 11 input because"
    printn "after this kind of input makes overflow to the register" 
  again:
    mov input,0
                ;taking the input to the 2 digit
  loop_input:
    mov ah,1
    int 21h
    cmp al,13
    je loop_exit1
    
    sub al,48
    mov bl,al
    mov al,input
    mov ah,0
    mov bh,10
    mul bh
    add al,bl
    mov input,al
    jmp loop_input
        ;after takinng input checking whether the input value is null
  loop_exit1:
    mov al,input
    cmp al,0
    je loop_input  
    mov sum,1
    mov i,1
                ;for(i=1;i<=a;i++)
  loop_for:
    mov al,input
    cmp al,i
    jl loop_exit
    mov al,sum
    mov bl,i       ;sum=sum*i;
    mul bl
    mov sum,al
    inc i   
                ;while(sum%10==0)
  loop_while:
    mov al,sum
    mov ah,0
    mov bl,10        ;sum/=10;
    div bl
    cmp ah,0
    jg loop_for     ;if ==0 then again go to for loop
    mov sum,al
    jmp loop_while
    
    jmp loop_for
    
  loop_exit:
    printn
    mov al,sum
    mov ah,0
    mov bl,10        ;sum=sum%10;
    div bl
    mov sum,ah
          
          ;printf("%5d -> %lld\n",a,sum);
    mov bl,input
    cmp bl,9
    jg greater
    
    mov dl,input
    add dl,48
    mov ah,2           ;for 1 digit output
    int 21h
    jmp result
    
  greater:
    mov al,input
    mov ah,0
    aaa
    mov bx,ax
    
    mov dl,bh
    add dl,48                ;for 2 digit output
    mov ah,2
    int 21h
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
  result: 
    print " -> "
    
    mov bl,sum
    cmp bl,9
    jg greater2
    
    mov dl,sum
    add dl,48
    mov ah,2          ;for 1 digit output
    int 21h
    jmp restart
    
  greater2:
    mov al,sum
    mov ah,0
    aaa
    mov bx,ax
    
    mov dl,bh
    add dl,48               ;for 2 digit output
    mov ah,2
    int 21h
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
  restart:
    printn  
    jmp again
  exit:
    mov ah,4ch
    int 21h           ;return 0;
    main endp
end main