.data
array: .word 4, 23, 5, 1, 20, 25, 100, 420, 32, 450, 44
.text 
# Function that compares two elements and switches 
# their position if the first is greater than the second.
# Arguments: $a0 - first element, $a1 - second element
comparison:
move $s0, $a0     # temp = first element
bgt $a0, $a1 swap
j exitComparison
swap:
move $a0, $a1   # $a0 = second element
move $a1, $s0   # $a1 = temp
exitComparison:
jr $ra
# End of comparison function
# ===============================================

# Function that sorts elements by making use of the
# bubble sort algorithm
# Argument: $a0 - array to sort, $a1 - length of array
bubbleSort:
sub $sp, $sp, 16 # preserve registers
sw $a0, 0($sp)  # array to print
sw $a1, 4($sp)  # length of array
sw $fp, 8($sp)
sw $ra, 12($sp)

add $fp, $sp, 16 # set frame pointer to where stack pointer is

move $t0, $a0     # $t0 = array
move $t1, $a1     # $t1 = lenght of array
li $t2, 0       # index i = 0
li $t3, 0       # index j = 0
sub $t4, $a1, 1 # length - 1
li $t7, 0       # passes inside the array, used to return to the first element

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# Bubble sort logic:
loopI:
bnez $t2, arrange   # i != 0
j firstTime

# Make changes if an interation through the array occurred
arrange:
mul $s3, $t3, 4       # j * 4
sub $t0, $t0, $s3     # restore first position of array
li $t3, 0     # set j = 0 again

firstTime:
loopJ:
lw $a0, ($t0)   # first elememt
lw $a1, 4($t0)   # second element
jal comparison  # compare the previous two elements
# Store values after comparison
sw $a0, ($t0)
sw $a1, 4($t0)

add $t3, $t3, 1 # j++
add $t0, $t0, 4 # next element of array
blt $t3, $t4, loopJ

add $t2, $t2, 1 # i++
blt $t2, $t1, loopI

mul $s3, $t3, 4       # i * 4
sub $t0, $t0, $s3     # restore first position of array
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

lw $ra, 12($sp)
lw $fp, 8($sp)
lw $a1, 4($sp)
move $a0, $t0         # do not take from stack to not overwrite sorted array
add $sp, $sp, 16
jr $ra
# End of bubbleSort function
# ===============================================

# Function that will print array
# Arguments: $a0 - array to print, $a1 - length of array
printArray:
sub $sp, $sp, 16 # preserve registers
sw $a0, 0($sp)  # array to print
sw $a1, 4($sp)  # length of array
sw $fp, 8($sp)
sw $ra, 12($sp)

add $fp, $sp, 16 # set frame pointer to where stack pointer is

li $t0, 0     # index = 0
move $t2, $a0 # $t2 = array

loop:
lw $t3, ($t2) # $t3 = array[n]

li $v0, 1     # print element
move $a0, $t3
syscall 

add $t2, $t2, 4 # get next element
add $t0, $t0, 1 # index++
beq $t0, $a1 return

# Print Comma
li $v0, 11
la $a0, 44
syscall
# Print Space
li $v0, 11
la $a0, 32
syscall
j loop      # continue printing elements

return:
lw $ra, 12($sp)
lw $fp, 8($sp)
lw $a1, 4($sp)
lw $a0, 0($sp)
add $sp, $sp, 16

jr $ra
# End of printArray function
# ===============================================

# Start of program, main fuction
main:

la $a0, array
li $a1, 11
beqz $a1, PrintZero
jal bubbleSort
jal printArray
j exit

PrintZero:      # only if length is 0
li $v0, 1
move $a0, $a1
syscall
j exit

exit:
# Exit the Program
li $v0, 10
syscall
