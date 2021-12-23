org 100h
#start=Emulation_Kit.exe#


mov cx,8


getInput:
    MOV AH,01h
    INT 21H
    cmp al,0DH
    je secondPart
    mov bl,al
    lea SI,Letters
    mov dx,0     
    findLetter: 
        lodsb
        cmp bl,al
        jne exitLoop 
        push dx
        jmp a    
        exitLoop:
        add dx,1
    jmp findLetter
    a:
    
Loop getInput



secondPart:

sub cx,8
mov bl,-1
mov ax, cx
mul bl
mov cx, ax

mov bl,2
mul bl

mov ah,0h
add sp,ax
add sp, 2
mov ch,0h
push cx





MOV DX,2000h    ; first DOT MATRIX digit


MAINLOOP:
        MOV SI, 0
        MOV CX, 5
        sub sp, 2 
        pop ax 
        mov bl,5
        mul bl
        mov bx,ax
        
        

NEXT:
        MOV AL,Dots[BX][SI]
        out dx,al
        INC SI
        INC DX

        CMP SI, 5
        LOOPNE NEXT
        
        
        pop cx
        dec cx
        sub sp,2
        push cx
        cmp cl,0
        jne MAINLOOP


ret
Dots    DB      01111110b, 00010001b, 00010001b, 00010001b, 01111110b  ; A
        DB      01111111b, 01001001b, 01001001b, 01001001b, 00110110b  ; B
        DB      00111110b, 01000001b, 01000001b, 01000001b, 00100010b  ; C
        DB      01111111b, 01000001b, 01000001b, 00100010b, 00011100b  ; D
        DB      01111111b, 01001001b, 01001001b, 01001001b, 01000001b  ; E
        DB      01111111b, 00001001b, 00001001b, 00001001b, 00000001b  ; F
        DB      00111110b, 01000001b, 01001001b, 01001001b, 01111010b  ; G
        DB      01111111b, 00001000b, 00001000b, 00001000b, 01111111b  ; H
        DB      00000000b, 00000000b, 01111111b, 00000000b, 00000000b  ; I
        DB      00100000b, 01000000b, 01000000b, 01000000b, 00111111b  ; J
        DB      01111111b, 00001000b, 00010100b, 00100010b, 01000001b  ; K 
        DB      01111111b, 01000000b, 01000000b, 01000000b, 01000000b  ; L
        DB      01111111b, 00000010b, 00000100b, 00000010b, 01111111b  ; M
        DB      01111111b, 00000010b, 00001000b, 00100000b, 01111111b  ; N 
        DB      00111110b, 01000001b, 01000001b, 01000001b, 00111110b  ; O
        DB      01111111b, 00001001b, 00001001b, 00001001b, 00000110b  ; P
        DB      00111110b, 01000001b, 01000001b, 01100001b, 01111110b  ; Q     
        DB      01111111b, 00001001b, 00001001b, 00001001b, 01110110b  ; R
        DB      00100110b, 01001001b, 01001001b, 01001001b, 00110010b  ; S 
        DB      00000001b, 00000001b, 01111111b, 00000001b, 00000001b  ; T
        DB      00111111b, 01000000b, 01000000b, 01000000b, 00111111b  ; U
        DB      00011111b, 00100000b, 01000000b, 00100000b, 00011111b  ; V
        DB      01111111b, 00100000b, 00010000b, 00100000b, 01111111b  ; W                                          
        DB      01100011b, 00010100b, 00001000b, 00010100b, 01100011b  ; X 
        DB      00000001b, 00000010b, 01111100b, 00000010b, 00000001b  ; Y       
        DB      01100001b, 01010001b, 01001001b, 01000101b, 01000011b  ; Z   
        
Letters DB 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'            
