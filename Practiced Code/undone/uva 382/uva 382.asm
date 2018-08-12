include "emu8086.inc"
.model small
.stack 100h
.data
inputstart db "PERFECTION OUTPUT",10,13,"$"
outputend db "END OF OUTPUT",10,13,"$"
perfect db "  PERFECT",10,13,"$"
deficient db "  DEFICIENT",10,13,"$"
abandant db "  ABUNDANT",10,13,"$"

main_input db ?

.code 
main proc
            ;fetchinf the data segment
    mov ax,@data
    mov ds,ax
    
    ;displaying the output hint
    lea dx,inputstart
    mov ah,9
    int 21h
         
         ;taking the first input
    call input
    
    cmp dl,0
    je exit        
    
   
    
         
  exit:
    printn
        ;exiting string
    lea dx,outputend
    mov ah,9
    int 21h
        ;exit
    mov ah,4ch
    int 21h
      
    main endp

     ;procedure for taking input
input proc
    for:  
    mov ah,1
    int 21h
    cmp al,13     ;if input is new line the it will refused to take input
    je exit_for
    sub al,48   ;taking the ascii value
    mov bh,10      ;bh=10
    mov bl,al        ;bl=input value al
    mov al,dl    ;stored value dl to the al 
    mul bh           ;al=al*bh
    add al,bl         ;al=al+bl
    mov dl,al       ;dl=al final
    jmp for     ;again taking input
       
       ;when exit for called then it will return the ascii value store in dl
 exit_for:
    ret
    input endp
end main