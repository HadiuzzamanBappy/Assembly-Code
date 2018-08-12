include 'emu8086.inc'     ;importing a header file
.model small
.stack 100h
.data
;variable declaration
a db ?
b db ?
c db ?

.code
main proc 
        ;fetching data into the data segment
    mov ax,@data
    mov ds,ax
        ;restarting the program
            ;outer while(true)
  again:  
    mov bl,1     ;for(int i=1)
        ;for loop start
  input_for:
    cmp bl,3       ;checking i<=3?
    jg operation
    mov ah,1       ;scanf
    int 21h
    sub al,48
    
    cmp bl,1
    je invoke_a    ;if(bl==1) then jumping tothe label invoke_a
    
    cmp bl,2
    je invoke_b    ;if(bl==2) then jumping tothe label invoke_b
    
    mov c,al          ;c=al
    inc bl
    jmp input_for    ;again for loop start with bl++
    
  invoke_a:
    mov a,al          ;a=al
    inc bl
    jmp input_for      ;again for loop start with bl++
    
  invoke_b:
    mov b,al            ;b=al
    inc bl
    jmp input_for      ;again for loop start with bl++
        
        ;after loop end ooperation will start
  operation:
    printn       ;new line
    mov bl,a
    cmp bl,0
    je a_zero    ;if a==0
    
    jmp a_one      ;else a==1
    
  a_zero:
    mov bl,b
    cmp bl,0
    je a_zero_b_zero  ;if a==0 and b==0
    
    jmp a_zero_b_one  ;else a==0 and b==1
    
  a_one:
    mov bl,b
    cmp bl,0
    je a_one_b_zero     ;if a==1 and b==0
    
    jmp a_one_b_one    ;else a==1 and b==1
  
  a_zero_b_one:  
    mov bl,c
    cmp bl,0
    je a_zero_b_one_c_zero     ;if a==0 and b==1 and c==0
    
    jmp a_zero_b_one_c_one     ;else a==0 and b==1 and c==1
    
  a_zero_b_zero:
    mov bl,c
    cmp bl,1
    je a_zero_b_zero_c_one      ;if a==0 and b==0 and c==1
    
    jmp last          ;else jump last
    
  a_one_b_zero:
    mov bl,c
    cmp bl,0
    je a_one_b_zero_c_zero    ;if a==1 and b==0 and c==0
    
    jmp a_one_b_zero_c_one     ;else a==1 and b==0 and c==1
  
  a_one_b_one:
    mov bl,c
    cmp bl,0
    je a_one_b_one_c_zero     ;if a==1 and b==1 and c==0
    
    jmp last                ;else jump last
    
  a_zero_b_zero_c_one:
    printn "C"            ;printf "C"
    jmp repro
    
  a_zero_b_one_c_zero:
    printn "B"            ;printf "B"
    jmp repro
    
  a_zero_b_one_c_one:
    printn "A"            ;printf "A"
    jmp repro
    
  a_one_b_zero_c_zero:
    printn "A"             ;printf "A"
    jmp repro
  
  a_one_b_zero_c_one:
    printn "B"             ;printf "B"
    jmp repro
  
  a_one_b_one_c_zero:
    printn "C"             ;printf "C"
    jmp repro
    
  last:
    printn "*"             ;printf "*"
      
      ;starting again that means while loop continue
  repro:
    jmp again        
    main endp
end main