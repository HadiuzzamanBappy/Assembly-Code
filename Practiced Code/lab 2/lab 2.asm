include "emu8086.inc"
.model small
.stack 100h
.data
main_value db ?
value2 db ?
temp_value db ?

armstrong_value db ?

count db ?
count2 db ?

mul_value db ?
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov main_value,0
    mov count,0
    mov count2,0
    mov armstrong_value,0
    
    for_loop:
    mov ah,1
    int 21h
    
    cmp al,13
    je next_step
    inc count
    inc count2
    
    mov ah,0
    sub al,48
    cbw
    push ax
    
    mov bl,al
    
    mov al,main_value
    mov cl,10
    mul cl
    
    add al,bl
    
    mov main_value,al
    
    jmp for_loop
  next_step:
    printn
    
    mov bl,main_value
    mov temp_value,bl
    
    mov value2,0
    
  main_work:
    mov bh,armstrong_value
    add bh,value2
    mov armstrong_value,bh
    
    mov value2,1
    
    cmp count,0
    je evaluate
    
    dec count
    
    mov ah,0
    mov al,temp_value
    mov bl,10
    div bl
    mov temp_value,al
    mov mul_value,ah
    
    mov cl,count2
    
  multiplication:  
    cmp cl,0
    je main_work
    
    dec cl
    
    mov al,value2
    mov bl,mul_value
    mul bl
    
    mov value2,al
    jmp multiplication
    
  evaluate:  
    mov dl,armstrong_value
    mov al,main_value
    
    cmp al,dl
    je armstrong
    
    printn "this is not armstrong"
    jmp ok_done
    
  armstrong:
    printn "this is armstrong"  
    
  ok_done:
    mov ah,4ch
    int 21h 
    
    main endp 
    
end main