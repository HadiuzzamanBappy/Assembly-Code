include 'emu8086.inc'
.model small
.stack 100h
.data
hint db "`Props win!' if the props survive, otherwise print `Hunters win!'.$"
hunters db "Hunters win!$"
props db "Props win!$"
a db ?
b db ?
c db ?
.code
main proc
        ;fetching the data
    mov ax,@data
    mov ds,ax
    
    ;printing the hint data
    lea dx,hint
    mov ah,9
    int 21h
    printn
     
      ;restarting the program again
  again:
          ;getting the first input
    xor dl,dl      
    call input
    mov a,dl
    printn
           ;getting the second input
    xor dl,dl
    call input
    mov b,dl
    printn
           ;getting the third input
    xor dl,dl
    call input
    mov c,dl
    printn           
           ;moving the 3 data to the registor
    mov bl,a
    mov bh,b
    mov cl,c
          
          ;adding the first 2 data
    add bl,bh
          ;comparing the adding the data to the 3rd data
    cmp bl,cl
    jg hunter    ;if 1+2>3 then jump to the hunter label
          ;else  
            ;printing the props wining string
    lea dx,props
    mov ah,9
    int 21h
    printn
    jmp again  ;jumping to the again label
    
  hunter:   
            ;printing the props wining string
    lea dx,hunters
    mov ah,9
    int 21h
    printn  
    jmp again
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
    ret     ;returning the input value
    input endp
end main