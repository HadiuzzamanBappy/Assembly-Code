include "emu8086.inc"
.model small
.stack 100h
.data
case db ?
limit db ?
line db ?
i db ?
j db ?
k db ?
l db ?
m db ?
n db ?
.code
main proc 
            ;fetching data fro data segment
    mov ax,@data
    mov ds,ax
    
  again:
    mov i,1         ;for(i=1;
    mov j,1         ;for(j=1;
    mov k,1         ;for(k=1;
    mov l,1         ;for(l=1;
    mov n,1          ;for(n=1;
    
    mov dl,0
    call input
    mov case,dl    ;scanf("%d",&t)
    printn
    
    
  case_for:
    mov bl,i     
    cmp bl,case    ;i<=t;
    jg exit
     
    mov dl,0
    call input
    mov limit,dl      ;scanf("%d",&a);
    
    printn
    
    mov bl,limit
    sub bl,1
    mov m,bl        ;for(m=limit-1;
    
    mov dl,0
    call input
    mov line,dl       ;scanf("%d",&b);
    
    printn
       
  main_for:
    mov bl,j          
    cmp bl,line         ;j<=b;
    jg case_for_inc     ;if j>b then case_for_inc
    
  in_for_1:
    mov bl,k           
    cmp bl,limit           ;k<=a;
    jg in_for_2            ;if k>a then in_for_2
    
  in_in_for_1:
    mov bl,l
    cmp bl,k            ;l<=k; 
    jg in_for_1_inc        ;if l>k then in_for_1_inc
    
    mov dl,k
    add dl,48        ;printf("%d",k);
    mov ah,2
    int 21h
    
    inc l               ;l++)
    jmp in_in_for_1 
    
  in_for_1_inc:
    mov l,1
    
    printn
    inc k           ;k++)
    jmp in_for_1
       
  in_for_2:
    mov bl,m
    cmp bl,1        ;m>=1; 
    jl main_for_inc
    
  in_in_for_2:
    mov bl,n
    cmp bl,m         ; n<=m; 
    jg in_for_2_dec      ;if n>m then in_for_2_dec
    
    mov dl,m
    add dl,48         ;printf("%d",m);
    mov ah,2
    int 21h
    
    inc n             ;n++)
    jmp in_in_for_2
    
  in_for_2_dec:
    mov n,1
    printn
    dec m             ;m--)
    jmp in_for_2
      
  main_for_inc:
    mov bl,i
    cmp bl,case         ;if(k!=t ||
    jne new_line         ;jmp new_line
    
    mov bl,j
    cmp bl,line          ;|| l!=b)
    jne new_line         ;jmp new_line
    
    jmp real_main_for_inc    ;else 
                                ;jmp  real_main_for_inc
  new_line:
    printn       ;\n
    
  real_main_for_inc:
    mov k,1
    mov bl,limit
    sub bl,1
    mov m,bl
      
    inc j              ;j++)
    jmp main_for
    
  case_for_inc:
    mov j,1  
    inc i             ;i++)
    jmp case_for
  exit:
    mov ah,4ch
    int 21h           ;return 0;
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