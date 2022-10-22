.data
pi: .double 3.14	# Pi
r:  .double 0.00	# Radius
four: .double 4.00
three: .double 3.00

.text
main:
# Input R
li $v0, 7
syscall
sdc1 $f0, r

###############################################
# Your code here:
# Volume of sphere: 4/3*pi*r^3

l.d $f2, pi
l.d $f4, r 
l.d $f6, four
l.d $f8, three

mul.d $f10, $f4, $f4
mul.d $f10, $f10, $f4

div.d $f14, $f6, $f8
mul.d $f16, $f14, $f2
mul.d $f16, $f16, $f10

li $v0, 3
mov.d $f12, $f16
syscall

###############################################

# Exit the program
li $v0, 10
syscall