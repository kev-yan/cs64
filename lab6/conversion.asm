# conversion.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
    li $t0, 0 # i
    li $t1, 8 # end condition
    addiu $sp, $sp, -4
    sw $ra, 0($sp)
    # li $v0, 0 # z
    j loop

main:  # DO NOT MODIFY THE MAIN SECTION
    li $a0, 5
    li $a1, 7

    jal conv

    move $a0, $v0
    li $v0, 1
    syscall

exit:
    li $v0, 10
    syscall
	# TODO: Write code to properly exit a SPIM simulation
loop:
    beq $t0, $t1, exitLoop  # if i==8, exit
    sll $t2, $a0, 3
    sub $v0, $v0, $t2   # z = z-8x
    add $v0, $v0, $a1   # z = z+y
    bge $a0, 2, function
    j function2
    
function:
    addi $a1, $a1, -1  # y--;
    j function2
function2:
    addi $a0, $a0, 1 # x++
    addi $t0, $t0, 1 # i++
    j loop
    

exitLoop:
    lw $ra, 0($sp)
    addiu $sp, $sp, 4
    jr $ra

