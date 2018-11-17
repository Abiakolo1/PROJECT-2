.data
userStr:    .space 2000
tooLongErrorMsg:    .asciiz "Input is too long." # use this if the length of the string starting from the first letter to the next letter is longer than the input of 4 digits
wrongCharErrorMsg:    .asciiz "Invalid base-36 number."#we use this for numbers that have spaces inbetween them and numbers and for numbers that have invalid characters such as the @ symbol in them
emptyErrorMsg: .asciiz "Input is empty." #we use this for numbers where the input is only filled with spaces and if there is a null character, therefore I will need to check if it is a null string
.text
.globl main
main:
    li $v0, 8       #takes user input
    la $a0, userStr
    syscall
    la $s5, userStr      #  the address of the string
    li $t5, 0       #initialized i= 0
    li $t1, 32      #  space here
    li $s0, 0       #initialized previous character to 0
    li $s7, 0       #initialized numofchracters
    li $t6, 0x0A    #  new line here
    li $s6, 0       #num Spaces
    loop:
    lb $t7, 0($s5) #got a character of the string
    beq $t7, $t6, breakloop #break when newline
    beq $t7, $t1, noCharError #if the character is not a space and
    bne $s0, $t1, noCharError #if the previous character is a space and
    beq $s7, $0, noCharError          #if the num of previously seen characters is not zero and
    beq $t7, $0, noCharError          #if the chLaracter is not null and
    beq $t7, $t6, noCharError         #if the character is not new line then print invalid
