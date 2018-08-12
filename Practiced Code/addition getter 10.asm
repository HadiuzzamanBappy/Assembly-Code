org 100h
.model small
.stack 100h
.data
    str1 db "input first number: $"
    str2 db "input second number: $"
    str3 db "sum: $"
    a db ?
    b db ?
.code
main proc
    mov ax,@data   ;storing all variable to accumulator registor
    mov ds,ax      ;storing all variable to data segment
    
    mov ah,9
    lea dx,str1    ;lea=load effective address
    int 21h
    
    mov ah,1
    int 21h
    sub al,48      ; as we will get >10 value thats why have to less it for 
                    ;efficiently storing the data to registor
    mov a,al
             
    mov ah,2         
    mov dl,0ah
    int 21h
    
    mov dl,0dh
    int 21h
    
    mov ah,9
    lea dx,str2
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov b,al
    
    add al,a     ;in this addition we get the higher >10 value
                    ;which have a higher bit 1-9 and lower bit 0-9
    mov ah,0     ;for storing the higher bit we will use the higher part of ax
                    ;which we were keeping blank
    aaa          ;aaa=adjust after addition we are merge ah+al which is ax
    
    add ah,48    ;for getting the ascii value we are adding 48 with the al and ah value
    add al,48
    
    mov bx,ax    ;as we always use the accumulator for current operation thats
                    ;thats why we move the ax value to the another such as bx
             
    mov ah,2         
    mov dl,0ah
    int 21h
    
    mov dl,0dh
    int 21h
    
    mov ah,9
    lea dx,str3
    int 21h
        
        ;first we will print higher part bcz the msd is the higher part
        ;then the lower part for becaming the lsd
    mov ah,2
    mov dl,bh
    int 21h
    
    mov dl,bl
    int 21h
    
main endp
    end main