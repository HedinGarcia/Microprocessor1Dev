.data
inputPrompt: .asciiz "Provide a positive integer: \n"

.text 
main:

###############################################
# Use syscall 5 to accept input from the test cases
# Your code here:
# Accept input from user
li $v0, 4
la $a0, inputPrompt
syscall

li $v0, 5
syscall 
 
move $t0, $v0
# Compute X * 10 - 2
mul $t1, $t0, 10
sub $t2, $t1 2

# Print result of arithmetic
li $v0, 1
move $a0, $t2
syscall

###############################################

# Exit the Program
li $v0, 10
syscall

