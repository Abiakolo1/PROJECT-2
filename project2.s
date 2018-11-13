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





