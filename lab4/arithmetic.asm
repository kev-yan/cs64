# arithmetic.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 32*(a - 4*b) + 7*c using only one mult instruction
# 3. Print out the result

.text
main:
	# TODO: Write your code here
	li $v0, 5
	syscall
	# addi $t0, $v0, 0
	move $t0, $v0

	li $v0, 5
	syscall
	move $t1, $v0
	sll $t1, $t1, 2

	li $v0, 5
	li $t7, 7
	syscall
	move $t2, $v0
	mult $t2, $t7
	mflo $t2

	sub $t3, $t0, $t1
	sll $t3, $t3, 5
	add $t4, $t3, $t2

	li $v0, 1
	move $a0, $t4
	syscall

exit:
	# Exit SPIM: Write your code here!
	li $v0, 10
	syscall
