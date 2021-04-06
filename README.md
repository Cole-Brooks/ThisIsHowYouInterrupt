# ThisIsHowYouInterrupt

I couldn't find any good examples of interrupts using AVR assembly.

Here's a really simple one.

### To Use with Atmel Studio
1) Download the project

2) Put breaks where the comments note you should put breaks

3) Run debug with the simulator tool

4) Open up the I/O Window in the debugger tool

5) Toggle bits 2 or 7 in PORTD

6) Click the play button again to see where the program counter goes.

Note that pin 2 is an external interrupt and pin 7 is an internal interrupt. If you set pin 2, you'll go to the external interrupt function. If you toggle pin 7 you'll go to the internal 
interrupt function
