.model small
.stack 100h
.data
num1 dw 100 dup(0)
num2 dw 100 dup(0)
count1 dw ?
count2 dw ?
count1_index dw ?
count2_index dw ?

count1_1 dw ?
count2_1 dw ?
big dw ?
.code
main proc    
            ;fetching all data
    mov ax,@data
    mov ds,ax
  again:  
    mov count1,0    ;count1=0
    mov count2,0     ;count2=0
    
    xor si,si   ;initialize index
    xor cx,cx
    
  input1:
    mov ah,1
    int 21h
    cmp al,13          ;checking either it is new line
    je xor_si
    
    sub al,48
    mov ah,0
    
    mov num1[si],ax     ;store input in array
    
    inc count1
    add si,2           ;increasing array index by 2
      
    jmp input1
    
  xor_si:
    mov dl,10
    mov ah,2
    int 21h         ;new line
    mov dl,13            
    int 21h
    
    mov ax,count1
    mov count1_1,ax
    
    xor si,si  
  input2:
    mov ah,1
    int 21h
    cmp al,13
    je before_evaluate_last_index  ;checking either it is new line
    
    sub al,48
    mov ah,0
    
    mov num2[si],ax         ;store input in array
    
    inc count2
    add si,2              ;;increasing array index by 2
      
    jmp input2  
  before_evaluate_last_index:
    mov dl,10
    mov ah,2
    int 21h                  ;new line
    mov dl,13
    int 21h
  
    mov ax,count2
    mov count2_1,ax
    
    mov ax,count1
    dec ax                ;taking the last value index of number 1
    mov bx,2
    mul bx
    
    mov count1_index,ax
    
    mov ax,count2
    dec ax
    mov bx,2             ;;taking the last value index of number 2
    mul bx
    
    mov count2_index,ax
      
  evaluate:
    mov ax,count1
    cmp ax,0                  ;index checking length of number1>0 ?
    jg check_count2_greater
    
    cmp ax,0
    je check_count2_zero_greater  ;else number1==0
    
  check_count2_greater:
    mov ax,count2
    cmp ax,0                ;index checking length of number2>0 ?
    jg add_value
    
    jmp add_num1
    
  check_count2_zero_greater:
    mov ax,count2
    cmp ax,0
    je show_value        ;either number2>0?
    
    cmp ax,0
    jg add_num2           ;else number2==0
       
  add_value:    
    mov si,count1_index
    mov di,count2_index
    
    mov ax,num1[si]
    add ax,num2[di]        ;adding =number1[last index]+number2[last index]
    add ax,cx
    
    mov cx,0
    
    dec count1_index
    dec count1_index      ;index-=2
    dec count2_index
    dec count2_index       ;index2-=2
    
    cmp ax,9
    jg add_cx_one
    
    push ax
    
    jmp dec_counts 
                    
                    ;if carry occurs then mov the carry to cx
  add_cx_one:
    mov dx,0
    
    mov bx,10
    div bx
      
    mov cx,ax
    
    mov ax,dx
    
    push ax         ;push the reminder
    
  dec_counts:
    dec count1
    dec count2      ;number length decrease
    
    jmp evaluate
                ;if number1 length is although greater than zero then   
  add_num1:
    mov ax,count1
    cmp ax,0            ;checking either the lenght of number 1 is end
    je show_value
    
    mov si,count1_index
    
    mov ax,num1[si]       ;adding the number 1 digit in stack with extra value
    add ax,cx
    
    cmp ax,9
    jg add_cx_one2        ;if (result>9)
    
    mov cx,0
    
    push ax
    
    jmp dec_counts2
    
  add_cx_one2:
    mov dx,0
    
    mov bx,10
    div bx
      
    mov cx,ax
    
    mov ax,dx
    
    push ax         ;push the reminder
    
  dec_counts2:    
    dec count1_index
    dec count1_index
    
    dec count1
    
    jmp add_num1 
  add_num2:
    mov ax,count2
    cmp ax,0
    je show_value      ;checking either the lenght of number 1 is end
    
    mov si,count2_index
    
    mov ax,num2[si]     ;adding the number 1 digit in stack with extra value
    add ax,cx
    
    cmp ax,9
    jg add_cx_one3     ;if (result>9)
    
    mov cx,0
    
    push ax
    
    jmp dec_counts3
    
  add_cx_one3:
    mov dx,0
    
    mov bx,10
    div bx
      
    mov cx,ax
    
    mov ax,dx
    
    push ax         ;push the reminder
    
    
  dec_counts3:    
    dec count2_index
    dec count2_index
    
    dec count2
    
    jmp add_num2
  
  show_value:
    cmp cx,0
    je skip
    
    push cx        ;checking either there exist any extra value
    
  skip:  
    mov ax,count1_1
    cmp ax,count2_1
    
    jg count1_1_big
    
    mov ax,count2_1
    cmp cx,0           ;if there have any value in cx then length addition
    je skip2
    add ax,1

  skip2:
    mov big,ax  
    jmp show_value2
    
  count1_1_big:
    cmp cx,0
    je skip3
    add ax,1

  skip3:
    mov big,ax  
  
  show_value2:
    mov ax,big
    cmp ax,0
    je exit
    
    pop dx
    add dl,48      ;showing result by poping
    mov ah,2
    int 21h
    
    dec big
    
    jmp show_value2
    
  exit:  
    mov dl,10
    mov ah,2
    int 21h        ;new line
    mov dl,13
    int 21h
    
    jmp again  
    mov ah,4ch
    int 21h   
    main endp
end main