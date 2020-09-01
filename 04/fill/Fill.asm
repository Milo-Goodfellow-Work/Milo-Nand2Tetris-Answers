// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@8192
D=A
@n
M=D

@SCREEN
D=A
@addr
M=D

@i
M=0

(LOOP_WHITE_INIT)
	@i
	M=0

	@LOOP_WHITE
	0;JMP

(LOOP_WHITE)
	@i
	D=M
	@n
	D=D-M
	@LOOP_WHITE_INIT
	D;JGT

	@addr
	D=M
	@i
	A=D+M
	M=0
	
	@i
	M=M+1

	@KBD
	D=M
	@LOOP_BLACK_INIT
	D;JGT //If D is not 0, goto loop black initializer

	@LOOP_WHITE
	0;JMP //Goto Loop white

(LOOP_BLACK_INIT)
	@i
	M=0

	@LOOP_BLACK
	0;JMP

(LOOP_BLACK)
	@i
	D=M
	@n
	D=D-M
	@LOOP_BLACK_INIT
	D;JGT

	@addr
	D=M
	@i
	A=D+M
	M=-1
	
	@i
	M=M+1

	@KBD
	D=M
	@LOOP_WHITE_INIT
	D;JEQ

	@LOOP_BLACK
	0;JMP