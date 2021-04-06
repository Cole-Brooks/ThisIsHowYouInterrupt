;
; InterruptExample.asm
;
; Created: 4/6/2021 11:39:10 AM
; Author : Cole Brooks
;

;;;;;;;;;;;; Vector Table ;;;;;;;;;;;;;;;
; Tells the arduino what to do when interrupts happen
.org 0
rjmp RESET ; You need this one.  Just jump to outside of the vector table
.org INT0addr ; this is the external interrupt vector. It's connected to pin 2
rjmp External_Interrupt_Handler_1 ; this is the subroutine called when the pin 2 external interrupt happens
.org 0x00A ; this is the internal interrupt vector for pins 0:7
rjmp Internal_Interrupt_Handler_1 ; this is the subroutine called when your internal interrupts occur
.org 0x34 ; this is something I found online. No idea what it does but it works

RESET:
.def temp = r16

	; Set interrupt to trigger when input is low
	ldi temp, (1<<ISC01)|(1<<ISC00)
	sts EICRA, temp

	ldi temp, (1<<INT0)
	out EIMSK, temp

	ldi temp, (1<<INTF0)
	out EIFR, temp

	clr temp
	out DDRD, temp

	// Enable internal interrupt vector for pins 0:7
	ldi temp, 0b00000100
	sts PCICR, temp

	// Enable pins 4 and 7 for internal interrupt
	// Note that I couldn't get it to work for pin 3 for some reason, and I haven't tried any others
	ldi temp, 0b10010000
	sts PCMSK2, temp

	; Global interrupt enable
	sei

	// infinite loop
	loop:
	nop			// put a break here
	rjmp loop

External_Interrupt_Handler_1:
	// do your pushbutton stuff here?
	nop			// put a break here
	reti
Internal_Interrupt_Handler_1:
	// do your rpg stuff here?
	nop			// put a break here
	reti
