include "emu8086.inc"
.model small
.stack 100h
.data
str1 db 255
.code
main proc
    
    lea si,str1
    
  input:
    mov ah,1
    int 21h
    cmp al,13       ;gets(a)
    je print
    mov [si],al
    inc si
    
    jmp input
      
 print:
    printn
    inc si
    mov dl,'$'      ;setting a last finish indicator in the last of the string
    mov [si],dl
    
    lea dx,str1
    mov ah,9           ;printf("%s\n",a);
    int 21h
       
    printn
    
    jmp input
    
    main endp
end main 