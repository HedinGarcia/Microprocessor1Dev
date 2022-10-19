.data

###############################################
# Define string here:
hello: .asciiz "Hello, World!"

###############################################

.text 
main:
###############################################
# Your code here:
 li $v0, 4
 la $a0, hello
 syscall
###############################################

# Exit the Program
li $v0, 10
syscall
