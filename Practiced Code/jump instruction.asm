org 100h
.model small
.stack 100h
.data
.code
main proc
   l6:         ;labeling first
    mov dl,6   ;add numeric value to data registor
    add dl,48  ;as assemby print ascii number so for
                ;for getting numeric 6 we add 48
    mov ah,2   ;printing call for one character
    int 21h    ;printig the value
    jmp l7     ;jumping to the l7 label
   
   l7:
    mov dl,7
    add dl,48
    mov ah,2
    int 21h
    jmp l6     ;jumping to the l6 label
    
main endp
    end main