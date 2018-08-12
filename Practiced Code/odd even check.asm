org 100h
.model small
.stack 100h
.data 
    oddmsg db 13,10,"this is an odd number.$"
    evnmsg db 13,10,"this is an even number.$"
    
.code 
main proc
    
    ;storing all msg in data segment
    mov ax,@data
    mov ds,ax
    
    ;getting an input
    mov ah,1
    int 21h
    
    ;mov 2 in dl ensuring
    mov dl,2
    div dl
    
    ;the input value stored in al and remainder in ah
    ;so moving the ah value to al
    mov al,ah
    
    ;check if the remainder is zero
    cmp al,0
    jg odd    ;jumping to the odd label
        
        ;printing the the even message
    lea dx,evnmsg
    mov ah,9
    int 21h
    jmp exit
         
         ;starting the label for odd msg section
    odd:
    lea dx,oddmsg
    mov ah,9
    int 21h
    
    ;ending program
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main