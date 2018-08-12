org 100h
 .model small
 .stack 100h
 .code
 main proc
    
    again:
    
    mov ah,2
    mov dl,":"
    int 21h
          ;geting frst input
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,2
    mov dl,":"
    int 21h
           ;getting scnd input
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,2
    mov dl,":"
    int 21h
           ;getting third input
    mov ah,1
    int 21h
    mov cl,al
    
    mov ah,2
    mov dl,":"
    int 21h
           ;getting fourth input
    mov ah,1
    int 21h
    mov ch,al
          ;printing a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    proc1:
    cmp bl,bh
    jge ex1     ;checking if(bl>bh) then jump ex1
    jmp com1    ;else skip to the compare com1
    
    ex1:
    xchg bl,bh  ;exchanging bl and bh
    
    com1:
    cmp bh,cl
    jge ex2     ;checking if(bh>cl) then jump ex2
    jmp com2    ;else skip to the compare com2
    
    ex2:
    xchg bh,cl   ;exchanging cl and bh
    
    com2:
    cmp cl,ch
    jge ex3     ;checking if(cl>ch) then jump ex3
    jmp scnd    ;else skip to the second step scnd
    
    ex3:
    xchg cl,ch   ;exchanging cl and ch
    
    scnd:
    cmp bl,bh
    jge ex11     ;checking if(bl>bh) then jump ex11
    jmp com11    ;else skip to the compare com11
    
    ex11:
    xchg bl,bh  ;exchanging bl and bh
    
    com11:
    cmp bh,cl
    jge ex22     ;checking if(bh>cl) then jump ex22
    jmp thrd    ;else skip to the step thrd
    
    ex22:
    xchg bh,cl   ;exchanging cl and bh
    
    thrd:
    cmp bl,bh
    jge ex111     ;checking if(bl>bh) then jump ex111
    jmp print    ;else skip to the print
    
    ex111:
    xchg bl,bh  ;exchanging bl and bh
          
          ;label for printing the value
    print:
    mov ah,2
          
          ;printing increasing order
    mov dl,bl
    int 21h
    mov dl,bh
    int 21h
    mov dl,cl
    int 21h
    mov dl,ch
    int 21h
          
          ;printing the new line
    mov dl,10
    int 21h
    mov dl,13
    int 21h
          
          ;printing in decreasing order
    mov dl,ch
    int 21h
    mov dl,cl
    int 21h
    mov dl,bh
    int 21h
    mov dl,bl
    int 21h
           
           ;printing a new line
    mov dl,10
    int 21h
    mov dl,13
    int 21h
            ;jumping to the first for re initiate the programme
    jmp again
           
           ;terminate the program
    mov ah,4ch
    int 21h
    
    main endp
end main    