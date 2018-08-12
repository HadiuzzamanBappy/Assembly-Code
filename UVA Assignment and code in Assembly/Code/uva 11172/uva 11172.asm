org 100h
.model small
.stack 100h
.data
    a db "enter two digit number or 1 digit along 0 in the first case",10,13,"such as 12(two) or 01(one)$"
    b db 10,13,"for exit input two 0(zero)$"
    c db  "input number 2:   $"
    d db 10
    e db 10,13,"input number 1:   $"
 .code
 main proc 
    ;loading data into the data segment
    mov ax,@data
    mov ds,ax
       
       ;printing the hint message
    lea dx,a
    mov ah,9
    int 21h
    
    again:
    ;the label for re starting the code
    ;hint for exiting the code
    lea dx,b
    mov ah,9
    int 21h
        
        ;input message for input 1
    lea dx,e
    mov ah,9
    int 21h
         
         ;input frst digit of 2digits number
    mov ah,1
    int 21h
    sub al,48
    mov a,al  ;moving the  frst value to the a variable
         
         ;input the scnd number of 2digits number
    mov ah,1
    int 21h
    sub al,48
    mov b,al     ;moving the  scnd value to the b variable
           
           ;newline
    mov ah,2
    mov dl,10
    int 21h     
    mov dl,13
    int 21h
          
          ;hint for scnd two digit number
    lea dx,c
    mov ah,9
    int 21h
        
    mov al,a   ;moving the frst digit to al
    mul d       ;multiplicate the value of al by d=10
    mov ah,0   ;vacant the ah
    aam         ;adjusting after multiplication the ax
    add al,b   ;then adding the al with b which will compatible in ax
            
            ;getting the ascii value
    add ah,48  
    add al,48
    
    mov bx,ax   ;moving the ax to bx
            
            ;checking if the input is zero 
    cmp bh,48
    je zero1
    
    zero1:
    cmp bl,48
    je exit    ;if ax==00 then exit
                  ;else continue
                  
        ;input frst digit of 2digits number          
    mov ah,1
    int 21h
    sub al,48
    mov a,al     ;moving the  frst value to the a variable
          
          ;input the scnd number of 2digits number
    mov ah,1
    int 21h
    sub al,48
    mov b,al    ;moving the  scnd value to the b variable
          
          ;newline
    mov ah,2
    mov dl,10
    int 21h     
    mov dl,13
    int 21h
        
    mov al,a   ;moving the frst digit to al
    mul d       ;multiplicate the value of al by d=10
    mov ah,0   ;vacant the ah
    aam         ;adjusting after multiplication the ax
    add al,b   ;then adding the al with b which will compatible in ax
           
           ;getting the ascii value
    add ah,48
    add al,48
    
    mov cx,ax     ;moving the ax to cx
        
        ;comparing either 2 high byte is equal
    cmp bh,ch
    je equal
         
         ;comparing either frst high is big than 2nd
    cmp bh,ch
    jg greater
    
    jmp less
    
    
    equal:
    ;comparing either 2 low byte is equal
    cmp bl,cl
    je equal2
        
        ;comparing either last low is big than 2nd
    cmp bl,cl
    jg greater
    
    jmp less
    
    equal2:
    ;printing the equal message
    mov dl,"="
    mov ah,2
    int 21h
    jmp newline
    
    greater:
    ;printing the greater message
    mov dl,">"
    mov ah,2
    int 21h
    jmp newline
    
    less:
    ;printing the lesser message
    mov dl,"<"
    mov ah,2
    int 21h
    jmp newline
        
        ;newline
    newline:
    mov ah,2
    mov dl,10
    int 21h     
    mov dl,13
    int 21h
    jmp again
    
    exit:
    ;exiting the program
    mov ah,4ch
    int 21h
    
    main endp
 end main