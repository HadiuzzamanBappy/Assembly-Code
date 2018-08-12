include 'emu8086.inc'
.model small
.stack 100h
.data
    ;variable and data section
testcase db ?
first db ?
scnd db ?
test1 db ?
test2 db ?
        ;string for declaring the result
divisa db "divisa",10,13,"$"
ne db "NE",10,13,"$"
se db "SE",10,13,"$"
no db "NO",10,13,"$"
so db "SO",10,13,"$"
.code
    ;code section
main proc
    ;main procedure start
    mov ax,@data
    mov ds,ax 
 ;             |
 ;             |
 ;       NO    |    NE
 ;             |
 ;   --------divisa---------
 ;             |
 ;       SO    |    SE
 ;             |
 ;             |
     
     ;label for restarting the program
  again:
    xor dl,dl   ;making the dl registor value initially zero
    call input   ;calling the input fuction for taking input
    mov testcase,dl
              
              ;comparing the input test case if zero
    cmp testcase,0
    je exit   ;if zero then the program will terminate
    
    printn    ;printing a new line 
            ;again taking the input and moving it to the first variable
    xor dl,dl
    call input
    mov first,dl

    printn  
            ;taking the input and moving it to the scnd variable
    xor dl,dl
    call input   
    mov scnd,dl
    
    mov cl,testcase     ;taking the testcase to the counter register for making the loop length
    printn
            
            ;now taking the two number for testcase length to check
  testing_input:
           ;checking the counter value whether zero or not 
    cmp cl,0
    je last   ;if zero then terminate to the restarting program
    dec cl
          
          ;taking the first input for divisia checking
    xor dl,dl
    call input
    mov test1,dl
    
    printn
    
            ;taking the scnd input
    xor dl,dl
    call input
    mov test2,dl
            
            ;moving to the another register for checking
    mov bh,test1
    mov bl,test2
             
             ;comparing the first input to the first fixed divisia value
    cmp bh,first
    jg first_greater  ;if greater then go to label first greater
    jl first_less           ;else go to the first_less label
               ;if all above are wrong then given and exist must be equal
 equal:
    printn 
            ;if equal then priting the divisia string  
    lea dx,divisa
    mov ah,9
    int 21h
    loop testing_input
    
  first_greater:
    cmp bl,scnd
    jg firstgreater_scndgreater  ;if bl>scnd then jump to the label firstgreater_scndgreater
    jl firstgreater_scndless            ;else to the label firstgreater_scndless
    
    jmp equal      ;if all above are wrong then it must be equal
    
  first_less:  
    cmp bl,scnd
    jg firstless_scndgreater  ;if bl>scnd then jump to the label firstless_scndgreater
    jl firstless_scndless        ;;else to the label firstless_scndless
    
    jmp equal       ;if all above are wrong then it must be equal
    
  firstgreater_scndgreater:
    printn 
            ;if bh>first and bl>scnd then it will print NE
    lea dx,ne
    mov ah,9
    int 21h
    loop testing_input
  
  firstgreater_scndless:
    printn 
            ;if bh>first and bl<scnd then it will print NE
    lea dx,se
    mov ah,9
    int 21h
    jmp last
  
  firstless_scndgreater:
    printn  
            ;if bh<first and bl>scnd then it will print NE
    lea dx,no
    mov ah,9
    int 21h
    loop testing_input
  
  firstless_scndless:
    printn  
            ;if bh<first and bl<scnd then it will print NE
    lea dx,so
    mov ah,9
    int 21h
    loop testing_input
    
  last: 
        ;when loop will end then the last label will be called 
    jmp again
            
            ;the exiting label
  exit:  
    mov ah,4ch
    int 21h
    main endp
     
     ;procedure for taking input
input proc
    for:  
    mov ah,1
    int 21h
    cmp al,13     ;if input is new line the it will refused to take input
    je exit_for
    sub al,48   ;taking the ascii value
    mov bh,10      ;bh=10
    mov bl,al        ;bl=input value al
    mov al,dl    ;stored value dl to the al 
    mul bh           ;al=al*bh
    add al,bl         ;al=al+bl
    mov dl,al       ;dl=al final
    jmp for     ;again taking input
       
       ;when exit for called then it will return the ascii value store in dl
 exit_for:
    ret
    input endp
end main