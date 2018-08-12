org 100h
.model small
.stack 100h
.code
main proc
        
        mov bl,49
        mov cl,49
        
        l1:
        
        cmp bl,57
        jg exit
        cmp cl,52
        je newline
        
        mov ah,2
        mov dl,bl
        int 21h
        
        inc bl
        inc cl
        
        jmp l1          
                  
        newline:
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        mov cl,49
        jmp l1
        
                  
        exit:
        mov ah,4ch
        int 21h
    main endp
end main