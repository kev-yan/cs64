# print_array.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	array: .word 1 2 3 4 5 6 7 8 9 10
	cout: .asciiz "The contents of the array in reverse order are:\n"
	newLine: .asciiz "\n"

.text
printA:
    # TODO: Write your function code here
	beq $a1, $zero, exit
	addi $a1, $a1, -1 	# i = al-1
	sll $t0, $a1, 2 	# t0 = i*4
	add $t1, $a0, $t0 	# index = base address + i*4 = base address + indices

	# li $v0, 4
	# la $a0, cout
	# syscall
	li $v0, 1
	lw $a0, 0($t1)
	syscall

	li $v0, 4
	la $a0, newLine
	syscall

	la $a0, array
	j printA


main:  # DO NOT MODIFY THE MAIN SECTION
	li $v0, 4
	la $a0, cout
	syscall

	la $a0, array
	li $a1, 10

	jal printA

exit:
	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation

