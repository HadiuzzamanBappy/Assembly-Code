org 100h
.model small
.stack 100h
.code
main proc
    mov ah,2
    mov cx,9
    mov dl,'1'   ;if we will write '1' then it will take it as ascii number
                    ;but if it will 1 then it will take as ascii number of it decimal value
    
  top:
    int 21h
    inc dl
    
    loop top
    
    mov ah,4ch
    int 21h
    
    main endp
end main