.text
main:
###############################################
# Your code here:
# Use add function to compute the sum of 5 and 11
li $t0, 5
li $t1, 11
add $t2, $t0, $t1
# Print the computed result
li $v0, 1
move $a0, $t2 # the argument register ($a0) will now contain the output
syscall
###############################################

# Exit the Program
li $v0, 10
syscall
