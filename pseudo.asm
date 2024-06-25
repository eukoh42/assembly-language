.data
    hello: .asciiz "Hello World"
    newline: .asciiz "\n"
    buffer: .word 0  # Add a word-aligned buffer for memory operations

.text
.globl main

main:
    # a. t3 = t4 + t5 - t6
    li $t4, 10
    li $t5, 20
    li $t6, 5
    add $t3, $t4, $t5
    sub $t3, $t3, $t6

    # b. s3 = t2 / (s1 - 54321)
    li $t2, 100
    li $s1, 54421
    sub $t8, $s1, 54321
    beqz $t8, skip_div  # Avoid division by zero
    div $t2, $t8
    mflo $s3
skip_div:

    # c. cout << t3;
    move $a0, $t3
    li $v0, 1
    syscall

    # Print newline
    la $a0, newline
    li $v0, 4
    syscall

    # d. t8 = Mem(a0)
    la $a0, buffer
    lw $t8, 0($a0)

    # e. Mem(a0 + 16) = 32768
    li $t9, 32768
    sw $t9, 16($a0)

    # f. cout << "Hello World";
    la $a0, hello
    li $v0, 4
    syscall

    # Exit program
    li $v0, 10
    syscall
