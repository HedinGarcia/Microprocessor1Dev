.data
array: .word 10, 25, 1, 4206, 5, 100, 20, 2
sum: .word 0
length: .word 8
.text 
main:

# Read integer value
li $v0, 5
syscall
move $s0, $v0	# $s0 = Multiplier

###############################################
# Your code here:
la $t0, array
li $t1, 0           # index = 0
li $t2, 0           # sumValues = 0
lw $t3, length

loop:
lw $s1, ($t0)
mul $t4, $s1, $s0   # (value * multiplier)
add $t2, $t2, $t4

add $t1, $t1, 1     # index += 1
add $t0, $t0, 4   # change to the next element in the array
blt $t1, $t3, loop

sw $t2, sum
###############################################

# Print sum
li $v0, 1
lw $a0, sum
syscall

# Exit the Program
li $v0, 10
syscall
