.data
x: .float 1.50
y: .float 9.99
z: .float 0.00
six: .float 6.00
ten: .float 10.00
one: .float 1.00

.text
main:
# Input Z
li $v0, 6
syscall
swc1 $f0, z

###############################################
# Your code here:
# Perform (X + Y) * 6 / (10 * Z - 1)
lwc1 $f0, x
lwc1 $f1, y 
lwc1 $f2, z

lwc1 $f20, six
lwc1 $f21, ten
lwc1 $f22, one

# Operations before the quotient
add.s $f3, $f0, $f1
mul.s $f4, $f3, $f20

# Operations after the quotient
mul.s $f5, $f21, $f2
sub.s $f6, $f5, $f22

# Division
div.s $f7, $f4,$f6

# Print output of operation
li $v0, 2
mov.s $f12, $f7 
syscall
###############################################

# Exit the program
li $v0, 10
syscall

