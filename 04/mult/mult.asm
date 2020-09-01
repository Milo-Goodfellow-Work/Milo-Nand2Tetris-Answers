// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@i
M=1

@out
M=0

@0
D=M
@j
M=D

@1
D=M
@k
M=D

(LOOP)
	@out
	D=M
	@2
	M=D

	@i
	D=M
	@j
	D=D-M
	
	@END
	D;JGT //If i is > j, goto END

	@i
	M=M+1 //i = i + 1

	@k
	D=M
	@out
	M = M + D //OUT = OUT + Ram[1]

	@LOOP
	0;JMP //Goto loop

(END)
	@END
	0;JMP