org 100h
.model small
.stack 100h
.data
number1 db ?
number2 db ?
number3 db ?
hint1 db "enter the two number:$"
hint2 db "the result is: $"

.code
main proc
        ;loading all data to the data segment
    mov ax,@data
    mov ds,ax
    
    new:
      ;displaying the program hint what it is about
    mov ah,9
    lea dx,hint1
    int 21h
        
        ;printing a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
        
        ;getting user input
    mov ah,1
    int 21h
         
         ;moving the data from al to number1 variable
    mov number1,al
        
        ;creating a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
        
        ;getting the 2nd input
    mov ah,1
    int 21h
         
         ;moving the data from al to number2 variable
    mov number2,al
         
         ;creating a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov al,number2   ;moving the number2 value to the al
    mov cl,number1   ;moving the number1 value to the cl
    cmp cl,al
    jg exchange      ;if first is big than 2nd then exchange label called
                            ;else continue
                            
    mov al,0                ;moving 0 to the al registor
    add al,number2          ;add number2 to the al as al=al+number2
    sub al,number1          ;then subtract number1 from al that is al=number2-number1
    add al,48               ;making the ascii value from the pure value
    mov number2,al           ;moving the value of al to number2
    
    print:
        ;initialize the print label
            ;printing result message
    mov ah,9
    lea dx,hint2
    int 21h
           
           ;printing the number2 that means the result
    mov dl,number2
    mov ah,2
    int 21h
          
          ;prtinting a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    loop new  ;again re initialize the code
           
           ;exchanging the values
           ;that means number1-number2=result
    exchange:
    mov al,0
    add al,number1
    sub al,number2
    add al,48
    mov number2,al
    jmp print  ;jumping to the print label
       
       ;ending the program
    mov ah,4ch
    int 21h
    main endp
end main