.data
array: .word 1, 2, 5, 10, 20, 25, 100, 4206
.text 
main:

# Read integer value
li $v0, 5
syscall

move $s0, $v0	# $s0 = Multiplier
li $s1, 0	    # $s1 = counter
la $t0, array
loop:
	# if ($s1 == 8) exit
	beq $s1, 8, exit
	lw $t1, ($t0)	# array[i]

	move $a0, $s0	# Multiplier
	move $a1, $s1	# Counter
	jal modifyArr
	move $s2, $v0	# Address of new item
	
	# Print the new array item
	li $v0, 1
	la $a0, ($s2)
	syscall
	li $v0, 11
	li $a0, 10
	syscall
	
	add $s1, $s1, 1		# $s1++
	add $t0, $t0, 4
	j loop
	
exit:
# Exit the Program
li $v0, 10
syscall

# Input:  $a0 = Multiplier
#	      $a1 = Counter 
# Output: $v0 = Address of new item
modifyArr:
	###############################################
	# Your code here:
	# Calculate array[i] * multiplier + counter
	mul $t2, $t1, $a0
	add $t2, $t2, $a1

	# Replace old value with new one
	sw $t2, ($t0)
	
	# Return address of new value
	move $v0, $t2
	###############################################
	jr $ra