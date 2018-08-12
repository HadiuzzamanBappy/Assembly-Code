include "emu8086.inc"
.model small
.stack 100h
.data
a db ?
b db ?
c db ?
case db 49
.code
main proc
        ;fetching data from data segment
    mov ax,@data
    mov ds,ax
        
        ;getting the test case
    mov ah,1
    int 21h
    sub al,48
    mov cl,al   ;count=testcase
    mov ch,0
    printn     ;\n
    
  all:
     mov ah,1
     int 21h
     sub al,48       ;taking input a
     mov a,al
     print " "
     
     int 21h
     sub al,48        ;taking input b
     mov b,al
     print " "
     
     int 21h
     sub al,48        ;taking input c
     mov c,al
     printn
     
     mov bl,a
     add bl,b        ;if((a+b)<=c))
     cmp bl,c
     jl invalid            ;jump invalid
     
     mov bl,b
     add bl,c
     cmp bl,a          ;if((c+b)<=a))
     jl invalid            ;jump invalid
     
     mov bl,a
     add bl,c
     cmp bl,b          ;if((a+c)<=b))
     jl invalid            ;jump invalid
     
     mov bl,a
     cmp bl,0         ;if(a==0)
     jl invalid         ;jump invalid
     
     mov bl,a
     cmp bl,0          ;if(b==0)
     jl invalid         ;jump invalid
     
     mov bl,a
     cmp bl,0          ;if(c==0)
     jl invalid         ;jump invalid
     
     mov bl,a
     cmp bl,b           ;if(a==b)
     je andtrue           ;jump and true
     
     mov bl,b
     cmp bl,c
     je Isosceles
     
     mov bl,a
     cmp bl,c
     je Isosceles
           
           ;printf("Case %ld: Scalene\n",i);
     print "Case "
     mov ah,2
     mov dl,case
     int 21h
     printn ": Scalene"
     
     jmp  again_start
     
  andtrue:
    mov bl,b
    cmp bl,c          ;if(a==b) && (b==c)
    je Equilateral        ;jump equilateral
        
        
        ;printf("Case %ld: Isosceles\n",i);
  Isosceles:
     print "Case "
     mov ah,2
     mov dl,case
     int 21h
     printn ": Isosceles"
     jmp  again_start
         
         
         ;printf("Case %ld: Equilateral\n",i);
  Equilateral:
    print "Case "
     mov ah,2
     mov dl,case
     int 21h
     printn ": Equilateral"
     jmp  again_start
       
       
       ;printf("Case %ld: Invalid\n",i);
  Invalid:
     print "Case "
     mov ah,2
     mov dl,case
     int 21h
     printn ": Invalid"
    
  again_start:
     mov al,case
     inc al       ;case++
     mov case,al    
     loop all      ;testcase++
     
     ;exiting the program
  exit:
    mov ah,4ch
    int 21h  
    main endp
end main