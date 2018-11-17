.data
userStr:    .space 2000
tooLongErrorMsg:    .asciiz "Input is too long." # use this if the length of the string starting from the first letter to the next letter is longer than the input of 4 digits
wrongCharErrorMsg:    .asciiz "Invalid base-36 number."#we use this for numbers that have spaces inbetween them and numbers and for numbers that have invalid characters such as the @ symbol in them
emptyErrorMsg: .asciiz "Input is empty." #we use this for numbers where the input is only filled with spaces and if there is a null character, therefore I will need to check if it is a null string
.text
.globl main
main:
    la $s5, userStr      #  the address of the string
    li $t5, 0       #initialized i= 0
    li $t1, 32      #  space here
    li $s0, 0       #initialized previous character to 0
    li $s1, 0       #initialized previous character to 0
    li $t7, 32      #space
    li $t8, 0       #address of loop variable
    li $t6, 0       #initialized num_of_chracters
    li $t5, 0x0A    #new line
    li $t4, 0       #get num of spaces before the first character
    loop:
        lb $t0, 0($t9)  #got a character of the string
        beq $t0, $t5, break #if char is a newline break
        beq $t0, $t7, dontOutputSpaces #if char is not null,
        bne $s1, $t7, dontOutputSpaces #if char is not a new line, then output the invalid statement
