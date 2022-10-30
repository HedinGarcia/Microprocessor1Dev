.data
array: .word 1, 2, 5, 10, 20, 25, 100, 4206
.text 
main:
# Replace first and last value with new number
li $v0, 5
syscall
sw $v0, array($t0)
li $t0, 28
mul $t1, $v0, 5
sw $t1, array($t0)

###############################################
# Your code here:
li $t2, 0 # index = 0
la $s2, array
lw $t3, ($s2) # min = array[0]
lw $t4, ($s2) # max = array[0]
li $t5, 0 # sum = 0

startLoop:
    lw $t6, ($s2)
    blt $t6, $t3, min
    bgt $t6, $t4, max
    j continue  # current element is neither greater nor smaller 
    min:
        move $t3, $t6
        j continue
    max:
        move $t4, $t6
        j continue
    continue:
        add $s2, $s2, 4
        add $t2, $t2, 1
        blt $t2, 8, startLoop

# Sum min and max of array
add $t7, $t3, $t4
li $v0, 1
move $a0, $t7
syscall
###############################################

# Exit the Program
li $v0, 10
syscall