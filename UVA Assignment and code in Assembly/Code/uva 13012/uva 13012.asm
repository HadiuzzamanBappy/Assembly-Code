org 100h
.model small
.stack 100h
.data
about db ":it is about priniting how many number",10,13,"are containing in below 5 extra answer:(for 1 digit 1 only)",10,13,"$"
correct_ans db 10,13,"enter the correct answer:(with 1 digit)",10,13,"$"
student_ans db "give the 5 ans in 1 digit with space or not:",10,13,"$"
how_correct db 10,13,"the correct ans are: ",10,13,"$"
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,about
    mov ah,9
    int 21h
    
  program_start:
         ;correct ans input hint
    lea dx,correct_ans
    mov ah,9
    int 21h
    
        ;taking the first correct answer input
    mov ah,1
    int 21h
    mov bh,al
       
       ;printing a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
        
    mov bl,48  ;moving the flag value how many are correct value 0 as 48 ascii
    mov cl,48   ;moving the loop length value 0 as 48 ascii
    
    ;Student 5 ans input hint
    lea dx,correct_ans
    mov ah,9
    int 21h
    
  input:    
        ;taking the input
    mov ah,1
    int 21h
        
        ;space checking as ascii value of space is 32
    cmp al,32
    je input      ;if true then again taking the input
        
        ;comparing either the given ans either correct or not
    cmp bh,al
    je increament   ;if true then it will increament the flag and loop length
    inc cl                 ;else it will only increase the loop length
    
    cmp cl,52     ;checking either the length is end or not
    jg print         ;if true then jmp to print how many are right
    jmp input        ;jumping to the input label to take next input 
    
  increament:
        ;label for increamenting the flag and loop length
    inc bl
    inc cl
    
    cmp cl,52     ;checking either the length is end or not
    jg print         ;if true then jmp to print how many are right
    jmp input             ;else again taking input
    
  print:
    ;Student correct ans number means flag
    lea dx,how_correct
    mov ah,9
    int 21h
            ;prtinting the flag value bl
    mov ah,2
    mov dl,bl
    int 21h
    
    jmp program_start     ;again starting the programme to take input
    
    
    exit:
        ;exiting the programme
    mov ah,4ch
    int 21h
    
    main endp
end main