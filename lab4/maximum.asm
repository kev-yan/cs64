# maximum.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum value
# See assignment description for details

.data

	# TODO: Complete these declarations / initializations

	intro: 		.asciiz "Enter the next number:\n"
	max: 		.asciiz "Maximum: "
    newline:	.asciiz "\n"

#Text Area (i.e. instructions)
.text

main:
	li $t0, 2


	li $v0, 4
	la $a0, intro
	syscall

	li $v0, 5
	syscall
	move $t1, $v0
	
loop:
	beq $t0, $zero, exitloop

	la $a0, intro
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	slt $t7, $t1, $v0
	bne $t7, $zero, swap 

	addi $t0, $t0, -1

	j loop

	# TODO: Write your code here
    # You can have other labels expressed here, if you need to
swap:
	move $t1, $v0
exitloop:
	li $v0, 4
	la $a0, max
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	la $a0, newline
	li $v0, 4
	syscall

	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation
