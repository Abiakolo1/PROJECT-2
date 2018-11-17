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
    li $v0, 4
    la $a0, wrongCharErrorMsg
    syscall         #print invalid spaces
    jr $ra
    noCharError:
    beq $t7, $t1, NoIncrement      #if character is not equal to a space, increment numofcharacters
    addi $s7, $s7, 1
    NoIncrement:
        bne $t7, $t1, NoCount        #if space and
        bne $s7, $0, NoCount         #if prevNum is equal to 0 then count space
        addi $s6, $s6, 1
    NoCount:
        move $s0, $t7           #set prev char to current one
        addi $s5, $s5, 1        #incremented the address
        addi $t5, $t5, 1        #incremented i
        j loop
        breakloop:
        li $t7, 4
        ble $s7, $t7, OutputnotLong #checks if user input is greater than 4
