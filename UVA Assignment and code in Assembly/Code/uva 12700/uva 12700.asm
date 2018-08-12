include 'emu8086.inc'
.model small
.stack 100h
.data
        ;making all the variable
testout db ?
b db ?
w db ?
t db ?
a db ?
i db ?
j db ?
testin db ?
casestring db "Case $"
abandoned db ": ABANDONED$"
whitewash db ": WHITEWASH$"
banglawash db ": BANGLAWASH$"
draw db ": DRAW $"
bangladesh db ": BANGLADESH $"
www db ": WWW $"
case db ?
about db "These letters will be either `B' or `W' or `T' or `A'.",10,13,"$"
about_2 db "here B=Bangladesh W=WWW , T=Tie and A=Abandoned",10,13,"$"
.code
main proc
;fetching the data variable
mov ax,@data
mov ds,ax

;about string output
lea dx,about
mov ah,9
int 21h
lea dx,about_2
int 21h
    
    ;taking the testcase input
xor dl,dl
call input   ;scanf called(function)
mov testout,dl    ;testout=scanf(dl)
mov i,0     ;int i=0
mov case,49    ;int case=1(49 in ascii) 
        ;initial outer for loop
testcaseout:
printn       ;new line
        ;i<=testout
mov bl,testout
cmp i,bl
je exit
inc i     ;i++
      
      ;initializing all variable 0
mov b,0
mov w,0
mov t,0
mov a,0
      
      ;scanf
xor dl,dl
call input
printn   ;new line
mov testin,dl  ;testin=scanf(dl)
mov j,0    ;int j=0  
        ;for loop 2
testcasein:
        ;checking j<=testin
mov bl,testin
cmp j,bl
je next_phase    ;after loop ending ->next phase
inc j     ;j++
     
     ;getting another input
mov ah,1
int 21h
       ;dl=got input
mov dl,al
      
      ;checking the input either =A
cmp dl,65
je aplus
       ;checking the input either =B
cmp dl,66
je bplus
       ;checking the input either =T
cmp dl,84
je tplus
         ;checking the input either =W
cmp dl,87
je wplus
       
       ;if all are false then jumping testcasein for taking again input
jmp testcasein
     
     ;label for a++
aplus:
inc a
jmp testcasein 
     ;label for b++
bplus:
inc b
jmp testcasein 
     ;label for t++
tplus:
inc t
jmp testcasein  
    ;label for w++
wplus:
inc w
jmp testcasein
         
next_phase:
mov bl,b
cmp bl,0
je b_zero    ;checking if b==0
                  ;else checking if w==0
mov bl,w
cmp w,0
je w_zero

jmp others        ;or to the others label
      
      ;if(b==0)
b_zero:
mov bl,w
cmp bl,0
je b_zero_w_zero      ;if b==0 and w==0

mov bl,t
cmp bl,0
je whitewash_final      ;if(b==0 and t==0)
                            ;then whitewash label

jmp others

w_zero:
mov bl,t
cmp bl,0
je banglawash_final       ;if(w==0 and t==0)
                                ;then banglawash label

jmp others

b_zero_w_zero:
mov bl,testin
cmp bl,a
je abandoned_final        ;if(b==0 and w==0 and a==testin)
                               ;then abandoned label

others:
mov bl,b
cmp bl,w
je draw_final      ;if(b==w)
                       ;then draw final label
cmp bl,w
jg bangladesh_final     ;else if(b>w)
                             ;then bangladesh final label
jmp www_final      ;else
                      ;then www final
            ;printing the whitewash string
whitewash_final:
printn
call casing
lea dx,whitewash
mov ah,9
int 21h
jmp last
          ;printing the banglawash string
banglawash_final:
printn
call casing
lea dx,banglawash
mov ah,9
int 21h
jmp last
          ;printing the abandoned string
abandoned_final:
printn
call casing
lea dx,abandoned
mov ah,9
int 21h
jmp last
       ;printing the draw with score string
draw_final:
printn
call casing
lea dx,draw
mov ah,9
int 21h

mov ah,2
mov bl,b
add bl,48
mov dl,bl
int 21h
mov dl,"-"
int 21h
mov bl,t
add bl,48
mov dl,bl
int 21h
jmp last
           ;printing the bangladesh_final with score string
bangladesh_final:
printn
call casing
lea dx,bangladesh
mov ah,9
int 21h

mov ah,2
mov bl,b
add bl,48
mov dl,bl
int 21h
mov dl,"-"
int 21h
mov bl,w
add bl,48
mov dl,bl
int 21h
jmp last
      ;printing the www_final with score string
www_final:
printn
call casing
lea dx,www
mov ah,9
int 21h

mov ah,2
mov bl,w
add bl,48
mov dl,bl
int 21h
mov dl,"-"
int 21h
mov bl,b
add bl,48
mov dl,bl
int 21h

last:
jmp testcaseout
;exit
exit:
mov ah,4ch
int 21h
main endp
     ;procedure for printing the case string with number
casing proc
lea dx,casestring
mov ah,9
int 21h
mov dl,case
mov ah,2
int 21h

inc case
ret
casing endp
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