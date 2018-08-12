org 100h
.model small
.stack 100h
.code 
main proc
    mov ah,2    ;set display parameter
    mov dl,48   ;set dl value to 48 that means 0
    mov cl,10   ;set cl 10 as a length to we want to print
    
 display:       ;creating a label where we can jump
    int 21h     ;displaying the dl value that means 0
    inc dl      ;increamenting the dl value
    dec cl      ;decreamenting the cl value to cl--
    jnz display ;jumping again to display label if last data
                    ;that means value of cl is not zero
    
    mov ah,4ch ;calling the exit function
    int 21h
main endp
end main