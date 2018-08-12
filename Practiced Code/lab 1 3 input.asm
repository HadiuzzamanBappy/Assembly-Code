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
    mov bh,al
    
    mov ah,2
    mov dl,":"
    int 21h
           ;getting scnd input
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,2
    mov dl,":"
    int 21h
           ;getting third input
    mov ah,1
    int 21h
    mov cl,al
          ;printing a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    cmp bl,bh   ;comparing bl<bh 
    jle scnd11  ;if bl is small then jmp scnd11
    
    jmp scnd12  ;else scnd2
    
    scnd11:
    cmp bl,cl   ;bl<cl
    jle trd11   ;if bl small then jump trd11
    
    jmp trd12   ;else trd12
    
    scnd12:
    cmp bh,cl   ;bh<cl
    jle trd13   ;if bh small then jump trd13
    
    jmp trd14   ;else jump trd14
    
    trd11:
        ;printing small=bl value
    mov ah,2
    mov dl,bl
    int 21h
    cmp bh,cl   ;checking for medium value
    jle frt11   ;if bh is small that means medium then jump frt11
    
    mov ah,2
    mov dl,cl    ;printing cl=medium
    int 21h
    mov dl,bh    ;printing bh=large
    int 21h
    jmp exit
        
    trd12:
    mov ah,2
    mov dl,cl  ;printing small=cl
    int 21h
    cmp bl,bh  ;comparing for medium bl<bh
    jle frt12  ;if bl small then jump frt12
    
    mov ah,2
    mov dl,bh  ;printing the medium
    int 21h
    mov dl,bl  ;printing the small
    int 21h
    jmp exit   ;jump to another label exit
    
    trd13:
    mov ah,2
    mov dl,bh  ;printing small=bh
    int 21h
    cmp bl,cl  ;comparing for medium bl<cl
    jle frt13  ;if bl small then jump frt12
    
    mov ah,2
    mov dl,cl   ;medium value print
    int 21h
    mov dl,bl   ;large value printing
    int 21h
    jmp exit
    
    trd14:
    mov ah,2
    mov dl,cl   ;printing small=cl
    int 21h
    cmp bl,bh  ;comparing for medium bl<bh
    jle frt14
    
    mov ah,2
    mov dl,bh   ;medium
    int 21h
    mov dl,bl   ;large
    int 21h
    jmp exit
    
    frt11:
    mov ah,2
    mov dl,bh   ;medium
    int 21h
    mov dl,cl   ;large
    int 21h     
    jmp exit
    
    frt12:
    mov ah,2
    mov dl,bl   ;medium
    int 21h
    mov dl,bh   ;large
    int 21h
    jmp exit
    
    frt13:
    mov ah,2
    mov dl,bl    ;medium
    int 21h
    mov dl,cl    ;large
    int 21h
    jmp exit
    
    frt14:
    mov ah,2
    mov dl,bl      ;medium
    int 21h
    mov dl,bh      ;large
    int 21h    
    
    exit:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    cmp bl,bh   ;comparing bl>bh 
    jge scnd21  ;if bl is big then jmp scnd21
    
    jmp scnd22  ;else scnd2
    
    scnd21:
    cmp bl,cl   ;bl>cl
    jge trd21   ;if bl big then jump trd21
    
    jmp trd22   ;else trd22
    
    scnd22:
    cmp bh,cl   ;bh>cl
    jge trd23   ;if bh big then jump trd23
    
    jmp trd24   ;else jump trd24
    
    trd21:
        ;printing big=bl value
    mov ah,2
    mov dl,bl
    int 21h
    cmp bh,cl   ;checking for medium value
    jge frt21   ;if bh is big that means medium then jump frt21
    
    mov ah,2
    mov dl,cl    ;printing cl=medium
    int 21h
    mov dl,bh    ;printing bh=small
    int 21h
    jmp exit2
        
    trd22:
    mov ah,2
    mov dl,cl  ;printing big=cl
    int 21h
    cmp bl,bh  ;comparing for medium bl>bh
    jge frt22  ;if bl big then jump frt22
    
    mov ah,2
    mov dl,bh  ;printing the medium
    int 21h
    mov dl,bl  ;printing the small
    int 21h
    jmp exit2   ;jump to another label exit
    
    trd23:
    mov ah,2
    mov dl,bh  ;printing big=bh
    int 21h
    cmp bl,cl  ;comparing for medium bl>cl
    jge frt23  ;if bl big then jump frt22
    
    mov ah,2
    mov dl,cl   ;medium value print
    int 21h
    mov dl,bl   ;small value printing
    int 21h
    jmp exit2
    
    trd24:
    mov ah,2
    mov dl,cl   ;printing big=cl
    int 21h
    cmp bl,bh  ;comparing for medium bl>bh
    jge frt24
    
    mov ah,2
    mov dl,bh   ;medium
    int 21h
    mov dl,bl   ;small
    int 21h
    jmp exit2
    
    frt21:
    mov ah,2
    mov dl,bh   ;medium
    int 21h
    mov dl,cl   ;small
    int 21h     
    jmp exit2
    
    frt22:
    mov ah,2
    mov dl,bl   ;medium
    int 21h
    mov dl,bh   ;small
    int 21h
    jmp exit2
    
    frt23:
    mov ah,2
    mov dl,bl    ;medium
    int 21h
    mov dl,cl    ;small
    int 21h
    jmp exit2
    
    frt24:
    mov ah,2
    mov dl,bl      ;medium
    int 21h
    mov dl,bh      ;small
    int 21h
    
    
    
    exit2:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    jmp again
    mov ah,4ch
    int 21h
    
main endp
 end main