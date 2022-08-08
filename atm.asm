/*================================================================================
   ||                                                                          ||
   ||       __            __    __________    __________   __    __ (R)        ||
   ||      |  |          |  |  |  _____   |  |   ____   | |  \  |  |           ||
   ||      |  |          |  |  |  |    |  |  |  |    |  | |   \ |  |           ||
   ||      |  |          |  |  |  |____|  /  | Liron |  | |  \ \|  |           ||
   ||      |  |_______   |  |  |  |    \  \  |  |____|  | |  |__   |           ||
   ||      |__________|  | _|  |__|     \__\ |__________| |__|  | _|           ||
   ||          ------------------------------------------------                ||
   ||               ATM (automated teller machine) Program.                    ||
   ||  Developed in Assembly language (ASM), Development environment: EasyCPU  ||
   ||  created on 2015 as a school project for Computer-Science track          ||
================================================================================*/

.model small
.stack 100h
.data
.code
mov ax,@data
mov ds, ax

; here your program starts
call init

; MENU - the user type a number, the program compares the user-input with the existing actions and sent him to the choosen action.
; existing actions: [1: withdraw, 2: deposit, 3: balance, 4: exit]
menu:
     in al, 1
     cmp al, 1
     je func1
     cmp al, 2
     je func2
     cmp al, 3
     je func3
     cmp al, 4
     je exit

func1: call withd
       jmp menu

func2: call dep
       jmp menu

func3: call bal
       jmp menu


; here you program ends
exit:
     mov ah, 4ch
     int 21h

; LOGIN - the user type a credit-card number and the program search for this CCN in the pool
; If the CCN exists the user will get into his account, otherwise, the progarm outputs an error.
login:
     in al, 1 ; entering input
     mov bx, 10h ; moving to bx the address of 10h (the first credit-card code)
    logloop: ; creating loop
          mov cl, [bx] ; moving to cl the value of bx register (which points to the address 10h)
          mov dl, cl ; moving the content of cl to dl
          shl dl, 3 ; shifting the content of dl 3 times left (As example, 00110001 [10h] will be 10001000)
          shr dl, 3 ; shifting the content of dl 3 times right (As example, 10001000 will be 00010001)
          cmp al, dl ; comparing the content of al to dl (the input cc-code to cc-code from the stock)
          je btc ; if the above condition is true jump to btc (function that returns the user to the last act)
          add bl, 2h ; adding to bl 2 (register which holds address of the cc-code) to jump to another credit-card code
          cmp bl, 1ch ; comparing bl to 1ch (the cc-codes over at 1bh, this condition check if this isn't check all of the cc-codes)
          jne logloop ; if the condition is false continue the loop
          mov al, 10101010b ; output - 10101010 ('error')
          out 2,al ; shows it

btc:
     ret

dep:
	call login
	cmp bl, 1ch
	je btc1
	
	in al, 1
	inc bl
	
	add [bx], al
	sub [bx], [1fh]
	ret
	
bal:
	call login
	cmp bl, 1ch
	je btc1
	
	inc bl
	mov al, [bx]
	out 2, al
	ret
	
withd:
     call login ; calling login function
     cmp bl, 1ch ; comparing bl to 1ch - see above what it's do)
     je btc1 ; if the above condition is true jump to btc (function that returns the user to the last act (heres menu))
    
     in al, 1 ; entering input
     inc bl ; add bl + 1 (to point on the balance of the user - 1 address more)
     cmp al, [bx] ; comparing al to bx (al - the amount the user input, bx - the amount the user have)
     jnbe fail ; JUMP if NOT BELOW or EQUAL to fail (the user ask for amount that big than his balance)
 
		; this checks what's the type of the user (specific there it checks if the user is young)
     shr cl, 5h ; shifting the content of cl (which points to the address) 3 times right (As example, 00110001 [10h] will be 0010000)
	 shl cl, 4h ; shifting the content of cl (which points to the address) 3 times left (As example, 00100000 will be 00000001)
     cmp cl, 001b ; comparing cl to 001b (young)
     jne con ; JUMP if NOT EQUAL to con, else it will continue to 'young'
    
   young:
          sub [bx], al ; minus bx - al
		  sub [bx], [1ch] ; minus bx - 1ch (deposit fee of young)
          jmp btc1 ; return
con:
     cmp cl, 010b ; comparing cl to 010b (regular acc)
     jne con1 ; JUMP if NOT EQUAL to con1 (it's not regular acc also, in this step it must to be VIP acc), else it'll continue to 'reg'
     reg:
          sub [bx], al ; minus bx - al
		  sub [bx], [1dh] ; minus bx - 1dh (depoist fee of reg)
          jmp btc1 ; return

con1:
     vip:
          sub [bx], al ; minus bx - al
		  sub [bx], [1eh] ; minus bx - 1eh (deposit fee of vip)
          jmp btc1 ; ret
     ret

fail:
     mov al, 10101010b
     out 2, al
     
btc1: ret

init:
     ; credit cards
     mov [10h], 00110001b
     mov [11h], 00101000b
     mov [12h], 01010010b
     mov [13h], 01011010b
     mov [14h], 01110011b
     mov [15h], 01100100b
     mov [16h], 00110100b
     mov [17h], 01010000b
     mov [18h], 01010101b
     mov [19h], 10001100b
     mov [1ah], 01110110b
     mov [1bh], 11111111b

     ; settings
     mov [1ch], 00110010b
     mov [1dh], 01100100b
     mov [1eh], 11111111b
     mov [1fh], 00000010b

     ; reset registers
     mov al, 0
     mov ah, 0
     mov bl, 0
     mov bh, 0
     mov cl, 0
     mov ch, 0
     mov dl, 0
     mov dh, 0
     mov al, 0
     out 2, al
     ret
	 
end
