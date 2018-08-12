.model small
.stack 100h
.data
prog db "Pizza Cutting.$"
about db 10,13,"A negative number terminates the input.$"
value db ?
result db ?
count db ?
.code
main proc 
        ;fetching the data
    mov ax,@data
    mov ds,ax
    
    ;loading the description of the program
    lea dx,prog
    mov ah,9
    int 21h
    
   again:  ;reprogrammable label
    lea dx,about
    mov ah,9
    int 21h 
    
    call line      ;new line
    
    mov value,0     ;making the storing variable value to zero
    
    input1:
            ;taking input untill new line
    mov ah,1
    int 21h
    mov bl,al
    sub bl,48
    
        ;comparing for negative number
    cmp al,45
    je exiting_input        
          
          ;comparing for new line 
    cmp al,13
    je result2
           
           ;else storing it as 10*value+bl
    mov bh,value
    mov al,10
    mul bh
    
    add al,bl
    mov value,al
    
    jmp input1
    
    result2:
        call line
                            
        mov result,1    ;taking the result value 1 initially
        mov cl,value    ;moving input value in the cl registor
        
        mov count,1    ;making the count value 1 as cutted pizza
        
        for:       
                ;changing the result value
          mov bh,result
          add bh,count
          mov result,bh
          
          inc count  ;increamenting the count value
               
               ;decreament the counter value untill it will appear to zero
          dec cl
          cmp cl,0
          je final     ;if zero then we got the final result
          
          jmp for
    final:
           ;making the two digit umber as 16 bit register number in ascii      
    mov al,1
    mov bl,result
    mul bl
    mov ah,0
    aam
        ;making the ascii to decimal
    add al,48
    add ah,48
    
    mov bx,ax
         
         ;printing the result
    mov ah,2
    mov dl,bh
    int 21h
    mov dl,bl
    int 21h
    
    jmp again  ; initialize the programme again  
    
          ;when we will get - input then untill new line appear we will take input
    exiting_input:
    mov ah,1
    int 21h
    
    cmp al,13
    je exit
    
    jmp exiting_input
    
       
       ;label for exiting the function
    exit:
    mov ah,4ch
    int 21h
    main endp
    
    ;function for a new line
proc line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    ret
    line endp

end main