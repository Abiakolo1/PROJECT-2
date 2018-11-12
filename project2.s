.data
    char array: .space 4 #allocates space for characters
    new_line: .asciiz "\n" #used to seperate 4 characters from extra ones
    invalid_base_36: .asciiz "Invalid base-36 number." #needed to output if a string is an invalid base-36 number
    empty_string: .asciiz "Input is Empty" #needed to output if a string is empty
    too_long_string: .asciiz "Input is too Long." #needed to output if a string is more than the 4 characters that it is meant to output
.text
    main:
        li $v0, 4 #receives input
        la $a0, char_array #loads buffer into address
        li $a1, 1000 #allocates space for string
        syscall
        la $a0, new_line #loads new line
        li $v0, 4 #prints new line for string
        syscall



