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
        li $t2, 0 #number of spaces
    loop:
        lb $t5, 0($t1) #get i'th character of string
        li $v0, 11 #load
        move $a0, $t0 #move the content of t0, to the arguement parameter $a0




