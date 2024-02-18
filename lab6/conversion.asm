# conversion.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
    li $s0, 0 # i
    li $s1, 8 # end condition
    li $v0, 0 # z
    j loop

main:  # DO NOT MODIFY THE MAIN SECTION
    li $a0, 5
    li $a1, 7

    jal conv

    move $a0, $v0
    li $v0, 1
    syscall

loop:
    beq $s0, $s1, exitLoop  # if i==8, exit
    sll $t0, $a0, 3
    sub $v0, $v0, $t0   # z = z-8x
    add $v0, $v0, $a1   # z = z+y
    bge $a0, 2, function
    j function2
    
function:
    addi $a1, $a1, -1  # y--;
    j function2
function2:
    addi $a0, $a0, 1 # x++
    addi $s0, $s0, 1 #i++
    j loop

exitLoop:
    jr $ra

exit:
    li $v0, 10
    syscall
	# TODO: Write code to properly exit a SPIM simulation
