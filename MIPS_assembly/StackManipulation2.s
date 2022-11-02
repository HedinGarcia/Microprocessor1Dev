.data
array: .word 13, 22, 15, 71, 29, 1, 3, 35, 57, 13
.word 21, 23, 25, 27, 29, 31, 33, 35, 37, 39
.word 19, 17, 15, 13, 11, 9, 7, 5, 3, 1
length: .word 30
error: .asciiz "\nWrong input. Good bye\n"

.text
main:
# Your code here

# Take input from user
li $v0, 5
syscall
move $a0, $v0

bltz $a0, errorMessage
beqz $a0, printZero

la $t0, array
li $t1, 0           # index = 0
lw $t2, length 

# Push all items of the array to the stack
pushArrayToStack:
lw $t4, ($t0)       # $t4 = array[n]
subu $sp, $sp, 4
sw $t4, ($sp)       # push array[n] to stack    

add $t1, $t1, 1     # index++
add $t0, $t0, 4     # next element of array

blt $t1, $t2, pushArrayToStack

# Pop and print the first n numbers (input of user) of the array.
# Argument: $a0 - number of items to pop and print from stack
jal popAndPrint
j exit

# Display error message
errorMessage:
la $t9, error
li $v0, 4
move $a0, $t9
syscall
j exit

printZero:
li $v0, 1
la $a0, 0
syscall
j exit

# Exit the Program
exit:
li $v0, 10
syscall
#==================================================================

# Function that will print a specific number of elements
popAndPrint:
move $t3, $a0       # number of elements to pop
li $t4, 0           # index
lw $t5, length      # length of array

blt $t3, $t5, updateLength
j unchangelength
updateLength:
move $t5, $t3       # length = number to pop (will be less than 30)

unchangelength:
popLoop:
lw $t6, ($sp)
addu $sp, $sp, 4    # pop of stack

# Print element
li $v0, 1
move $a0, $t6
syscall

add $t4, $t4, 1     # index++
beq $t4, $t5 return # check if the last number has been reached

# Print Comma
li $v0, 11
la $a0, 44
syscall
# Print Space
li $v0, 11
la $a0, 32
syscall
j popLoop           # continue popping elements from stack

return:
jr $ra