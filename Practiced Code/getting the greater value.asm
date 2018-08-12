org 100h
.model small
.stack 100h
.code
main proc
          ;accepting the first input
     mov ah,1
     int 21h
     mov cl,al  ;moving data of al to cl
            
            ;creating a new line
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
            
            ;accepting the 2nd input
     mov ah,1
     int 21h
     mov bl,al ; moving data from al to bl
            
            ;creating a new line
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
            
            ;comparing the bl and cl number which is big
     cmp bl,cl   ;if bl is big we are comparing
     jg al_is_big   ;if bl is big jump to the al_is_big label
             
             ;else section
     mov dl,cl
     mov ah,2  ;printing the other value if not true compare
     int 21h
     jmp exit
     
     al_is_big: ;label start for true compare
     mov dl,bl
     mov ah,2
     int 21h
                
             ;exit section   
     exit:
     mov ah,4ch
     int 21h
     
    
    main endp
end main