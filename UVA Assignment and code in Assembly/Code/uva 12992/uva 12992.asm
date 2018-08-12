org 100h
.model small
.stack 100h
.data
;defining the hint mesagge
about db "what's the minimal number of bottles needed",10,13,"if he want to bring N types of medicine.$"
test_case db 10,13,"give the test case number:",10,13,"$"
nth_value db 10,13,"give the desired n'th value: ",10,13,"$"
minimal_number db 10,13,"the minimal number of bottles Huatuo needed: ",10,13,"$"
case_print db 10,13,"Case %$"

case db ?
sum db ?
i db ?

.code
main proc
        
        ;load the data value to the data segment
        mov ax,@data
        mov ds,ax
        
        ;load the about of the programme
        lea dx,about
        mov ah,9
        int 21h
               
               ;loading the program again
    again_programme:
        ;showing the message for getting the input test case
        lea dx,test_case
        mov ah,9
        int 21h
        
        ;getting the input
        mov ah,1
        int 21h
        mov case,al
        
        mov i,49    ;moving case value as 1 
                 
                 ;making the value of bx zero
        mov bh,0    
        mov bl,0
        
    input:
        
        ;showing the message for getting the nth value case
        lea dx,nth_value
        mov ah,9
        int 21h
        
        ;getting the input which nth value we need
        mov ah,1
        int 21h
        mov cl,al
        
        mov sum,1   ;making the value of sum initially 1
    
    getting_sum:    
        dec cl   ;for calculating nth value decreasing it
        
        cmp cl,48   ;comparing either the nth is zero or not
        je print       ;if true then print the sum
                
                ;checking either the value of sum is greater than 9 or not
        mov ch,sum
        cmp ch,9
        jg  greater_nine  ;if true then only increament the lower part of bx as bl
               
               ;else increasing the sum value
               ;increamenting value of sum by 2 in every cases
        inc ch
        inc ch
        mov sum,ch
             
             ;storing the sum value in ax registor not bothering about 2 digits
        mov al,0
        add al,sum
        mov ah,0
        aaa
        
        add ah,48   ;making ascii the higher part
        add al,48   ;making ascii the higher part
        
        mov bx,ax    ;storing the ax value to the bx
        
        jmp getting_sum     ;again checking the loop getting_sum
        
    greater_nine:     ;if greater nine then increament only lower part
        inc bl       ;once
        inc bl         ;twice
        
        jmp getting_sum     ;again checking the loop getting_sum
   
   print: 
            ;printing the case message    
        mov ah,9
        lea dx,case_print
        int 21h
              ;printing the case number                    
        mov ah,2
        mov dl,i
        int 21h
        mov dl,":"
        int 21h 
        
        cmp sum,9
        jle print_less
             
             ;priniting the sum value from bx registor
        mov ah,2
        mov dl,bh
        int 21h
        mov dl,bl
        int 21h
    
    inc_case:         
             ;increamenting the case value
        mov bh,i
        inc bh
        mov i,bh
             
             ;if case value is lesser than input test case then again get input
        cmp bh,case
        jle input
                  ;else programme restarting
        jmp again_programme
        
    print_less:
            ;printing the value less or equal 9
        add sum,48
        mov ah,2
        mov dl,sum
        int 21h
        
        jmp inc_case    ;jumping to the increment case
        
        ;programme exit
    exit:
        mov ah,4ch
        int 21h
    
    main endp
end main