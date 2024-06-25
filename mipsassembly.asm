.data
    prompt_s0: .asciiz "Enter value for s0: "
    prompt_s1: .asciiz "Enter value for s1: "
    prompt_s2: .asciiz "Enter value for s2: "
    result_msg: .asciiz "Result (t0): "
    newline: .asciiz "\n"

.text
.globl main

main:
    # Prompt and read s0
    li $v0, 4
    la $a0, prompt_s0
    syscall
    li $v0, 5
    syscall
    move $s0, $v0

    # Prompt and read s1
    li $v0, 4
    la $a0, prompt_s1
    syscall
    li $v0, 5
    syscall
    move $s1, $v0

    # Prompt and read s2
    li $v0, 4
    la $a0, prompt_s2
    syscall
    li $v0, 5
    syscall
    move $s2, $v0

    # Efficient calculation: $t0 = $s0 / 8 - 2 * $s1 + $s2
    sra $t0, $s0, 3      # Divide s0 by 8 using right shift
    sll $t1, $s1, 1      # Multiply s1 by 2 using left shift
    sub $t0, $t0, $t1    # Subtract 2*s1 from s0/8
    add $t0, $t0, $s2    # Add s2 to the result

    # Print result
    li $v0, 4
    la $a0, result_msg
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall
