.data 
h: .asciiz "Hello, "
.align 2
buffer: .space 64
.text
main:
###############################################
# Your code here:

#Take user input:
li $v0, 8
la $a0, buffer
la $a1, 60
move $t0, $a0
syscall

#Print message and user input
li $v0, 4
la $a0, h
syscall

li $v0, 4
move $a0, $t0
syscall

###############################################

# Exit the Program
li $v0, 10
syscall
