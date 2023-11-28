    .data
A:  .byte 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
B:  .space 10
N:  .word 10
    #.half 
    #.byte
    
    .text
    .set noreorder
    .globl main
    .ent main
main:
    la		$s0, A		# base address of A
    la		$s2, B
    li		$s1, 0		# loop index
    lw		$s4, N
loop:
   slt	$t3, $s1, $s4	# if (index < 10)
    beq		$t3, $zero, exit
    nop
    #sll		$t0, $s1, 1	# $t0 = $s1 << 2 = $s1 * 4 = 						#   offset into array
    add	$t1, $s0, $s1 # $t1 = address of A[i]
    add	   $t3, $s2, $s1
    lb		$t2, 4($t1)	# $t2 = A[i]
    sb		$t2, 0($t3)
    addi	$s1, $s1, 1
    j		loop
    nop

exit:
    nop
    .end main