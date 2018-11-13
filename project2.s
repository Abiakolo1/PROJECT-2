.data
    string_use: .space 2000 #allocates space for characters
    new_line: .asciiz "\n" #used to seperate 4 characters from extra ones
    invalid_base_36: .asciiz "Invalid base-36 number." #needed to output if a string is an invalid base-36 number
    empty_string: .asciiz "Input is Empty" #needed to output if a string is empty
    too_long_string: .asciiz "Input is too Long." #needed to output if a string is more than the 4 characters that it is meant to output
.text
    main:
        li $v0, 8 #receives input
        la $a0, string_use #loads buffer into address
        syscall
        la $t1, string_use #loads space here
        li $t3, 0 #initialized i as zero
        li $t4, 32 #allocate space here
        li $s0, 0 #initialize previous char to be 0
        li $t2, 0x0A #loaded a new line
        li $t6, 0 #initialized the num_characters to be 0.
        li $t7, 0 #number of spaces
    loop:
        lb $t5, 0($t1) #get i'th character of string
        li $v0, 11 #load
        move $a0, $t0 #move the content of t0, to the arguement parameter $a0
    is_increment:
        bne $t0, $t4, is_space #if current character is a space and
        bne $t6, $0, is_space #if num of previous character is equal to 0 then count space
        addi $t7, $t7, 1
    is_space:
        move $s0, $t0    #set previous character with current one
        addi $t1, $t1, 1    #incremented the address
        addi $t3, $t3, 1    #incremented i
        lb $t0, 0($t1)        #fetch the next character
        bne $t1, $t2, loop    #loops when the next char is not a new line
        li $t0, 4
        bne $t6, $t1, is_empty_string    #checks if user input is greater than 4
        li $v0, 4
        la $a0, too_long_string
        syscall
        jr $ra
    is_empty_too_long: #statements to check if number of characters is empty ot not
        bne $t6, $zero, base_36  #if user input is am series of null string , print empty string statement
        li $v0, 4
        la $a0, empty_string #loads the empty string comment
        syscall
        jr $ra #goes to return address
    is_empty_string_error:
        li $t1, 0 #initialize i
        addi $t1, $t6, -1 #initialize j's length
        la $s0, string_use #fetch string address
        add $s0, $s0, $t2    #got the address of the start of the number
        add $s0,$s0, $t0   #add length -1 to the address(starts from the end)
        li $t8, 1     #initialized power of 36
        li $t9, 0    #initialized sum of decimal value
        li $s3, 36    #constant of 36
    convert_next:
        lb $s1, 0($s0)
        li $t2, 65    #smallest ascii value for capital letters
        li $t3, 90    #biggest ascii value for capital letters
        blt $s1, $t2, dont_convert_capital_letter_to_digit     #if ascii[j] >= 65 and
`   is_capital_digit:
    is_lower_digit:
    is_digit_digit:

