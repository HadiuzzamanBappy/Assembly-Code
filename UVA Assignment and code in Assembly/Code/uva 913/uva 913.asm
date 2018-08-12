include "emu8086.inc"
.model small
.stack 100h
.data
input_value db ?
i db ?
j db ?
k db ?
sum db ?
final db ?
.code
main proc
    mov ax,@data
    mov ds,ax

  again:
    mov dl,0
    call input
    mov input_value,dl   ;scanf("%lld",&n)
    printn
    
    mov j,1        ;j=1
    mov sum,0       ;sum=0
    
    mov i,1      ;for(i=1;
  for1:
    mov bl,i
    cmp bl,input_value      ;i<input_value;
    jge final_get
    
    inc j          ;j++
    inc i         ;i+=2)
    inc i
    
    jmp for1
  final_get:
          ;final=(j*i)+j-1;
    mov al,j        ;al=j
    mov ah,0       ;ah=0
    mov bl,i        ;bl=i
    mul bl           ;al=al*bl
    add al,j       ;al+=j
    sub al,1         ;al-=1
    mov final,al    ;final=al
    
    mov k,1     ;for(k=1;
  for2:
    mov bl,k
    cmp bl,3       ;k<=3;
    jg print_sum
    
    mov al,sum
    add al,final
    mov sum,al      ;sum=sum+final;
    dec final         ;final-=2;
    dec final
    inc k          ;k++)
    
    jmp for2
  print_sum: 
    mov dl,sum
    cmp dl,9                
    jg greater
    add dl,48
    mov ah,2        ;printf("%lld\n",sum);  for 1 digit output
    int 21h
    
    jmp jump_again
  greater:
    mov al,sum
    mov ah,0
    mov bl,10
    div bl
    
    mov bx,ax
    mov dl,bl
    mov ah,2
    add dl,48       ;printf("%lld\n",sum); for 2 digit output
    int 21h
    mov dl,bh
    add dl,48
    int 21h
 jump_again:
    printn       
    jmp again
  exit:
    mov ah,4ch
    int 21h
main endp
    
input proc
  loop_input:
    mov ah,1
    int 21h            ;checking for new line
    cmp al,13
    je loop_exit
    
    sub al,48
    mov bl,al
    mov al,dl
    mov ah,0         ;dl=1 or 2 digit input
    mov bh,10
    mul bh
    add al,bl
    mov dl,al
    jmp loop_input
    
  loop_exit:
    ret
    input endp
end main