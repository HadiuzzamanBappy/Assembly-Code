include "emu8086.inc"
.model small
.stack 100h
.data
n db ?
sum db ?
.code
main proc
  
  again:  
    mov dl,0          ;scanf("%d", &n)
    call input        
    cmp dl,0          ;compare a!=0
    je exit
    
    mov n,dl
    mov sum,0      ;sum = 0;
    
    printn
  while:  
    mov bh,n
    cmp bh,0         ;while(n > 0)
    jle print
    
    mov ah,0
    mov al,n
    mov bh,3           ;sum += n/3;
    div bh
    mov bh,sum
    add bh,al
    mov sum,bh
    
    add ah,al         ;n = n/3 + n%3;
    mov n,ah
    
    cmp ah,2
    je checking         ;if(a==2 ||
    cmp ah,1
    je checking          ;|| a==1)  then jump checking
    
    jmp while
    
  checking:
    cmp ah,2
    je add_n        ;if(a==2) then add_n
    jmp print
    
  add_n:
    inc n          ;n++;
    jmp while
      
  print:
    mov al,sum
    cmp al,15
    jg greater_than_15        
    cmp al,9
    jg greater_than_9
    
    mov dl,sum
    add dl,48         ;else
    mov ah,2            ;print 1 digit
    int 21h
    jmp restart
    
  greater_than_15:
    mov ah,0
    mov al,sum
    mov bl,10
    div bl
    mov bx,ax
    
    mov dl,bl
    add dl,48        ;print high digit
    mov ah,2
    int 21h

    mov dl,bh
    add dl,48         ;print low digit
    mov ah,2
    int 21h
    
    jmp restart
  greater_than_9:
    mov al,sum
    xor ah,ah            ;printf("%d\n", sum);
    aaa                      ;;print 2 digit
    
    mov bx,ax
    
    mov dl,bh
    add dl,48        ;print high digit
    mov ah,2
    int 21h

    mov dl,bl
    add dl,48         ;print low digit
    mov ah,2
    int 21h 
  
  restart:  
    printn
    jmp again       ;restart the program
    
  exit:
    mov ah,4ch
    int 21h
      
    main endp
input proc
  input_loop:  
    mov ah,1
    int 21h
    cmp al,13
    je return
    
    sub al,48
    mov bl,al          ;taking multiple value digit
    mov al,dl
    mov bh,10
    mul bh
    add al,bl
    mov dl,al
    jmp input_loop
    
  return:
    ret  
    input endp
end main