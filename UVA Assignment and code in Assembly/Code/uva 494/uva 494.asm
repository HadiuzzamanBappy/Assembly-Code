org 100h
.model small
.stack 100h
.data
hint db "it is the code for counting the length of string with space",10,13,"input the character and space for count",10,13,"input zero(0) for terminating the code",10,13,"$"
length db "the length is:  ",10,13,"$"
.code
main proc
       
       ;loading the data into data segment
    mov ax,@data
    mov ds,ax
       
       ;printing the hint message
    lea dx,hint
    mov ah,9
    int 21h
        
        ;working procedure start
    first:
    mov bl,30h   ;moving the initial count value 0 to the bl as counter
    
    again:
        ;prompt the user input
    mov ah,1
    int 21h
     
    ;comparing either the input is zero the exit otherwise continue
    cmp al,48
    je exit2
    
    ;comparing the input is either a new line then printing the count and re initialize the code
    cmp al,13
    je exit
    
    inc bl    ;increamenting the value of bl which was counter by 1 as ++
    loop again    ;calling the label again
    
    
    exit:
       ;describing the exit loop
       
       ;printing a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
       
       ;printing the result message
    lea dx,length
    mov ah,9
    int 21h
    
       ;printing the result count value from bl
    mov dl,bl
    mov ah,2
    int 21h
        
        ;printing a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
         
         ;re-initialize the code for input
    jmp first
    
    exit2:
        ;exiting the program
    mov ah,4ch
    int 21h
    main endp
end main