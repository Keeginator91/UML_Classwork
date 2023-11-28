    // Start of text section           
    .text		## Text section contains code
    .set noreorder	## Disable instruction reordering
    .globl main		## Define main label as a global entity
    .ent main		##   and an entry point 
main:
#    li	    $s0, 4
    
    li	    $a0, 4
    li	    $a1, 5
    jal	    g		## z = g (4, 5)
    nop
    move    $t0, $v0
    addi    $t0, $t0, 1	## z = z+1;
    nop

mainloop:
    j	    mainloop
    nop
    
    .end main
    
    ## int g (int x, int y) {
    ##   return (x+y);
    ## }
    .ent g
g:
    #addiu   $sp, $sp, -4
    #sw	    $s0, 0($sp)
    #addi    $s0, $s0, 1
    #nop
    
    #lw	    $s0, 0($sp)
    #addiu    $sp, $sp, 4
    add	    $v0, $a0, $a1	# 
    jr	    $ra
    nop
    .end g
    
    // Start of data section
    .data
