org 100h
.model small
.stack 100h
.data
date db "May 29, 2013 Wednesday",10,13,"$"
            ;defining the desired date
.code 
main proc
    
    ;fetching the data
    mov ax,@data
    mov ds,ax
    
    ;printing the result
    lea dx,date
    mov ah,9
    int 21h
    
      ;exiting the program
    mov ah,4ch
    int 21h
    
    main endp
end main