    // Start of text section           
    .text		## Text section contains code
    .set noreorder	## Disable instruction reordering
    .globl main		## Define main label as a global entity
    .ent main		##   and an entry point 
main:
#    li	    $s0, 4
    
    li	    $a0, 4	## x
    li	    $a1, 5	## y
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
    ##   int a[32];
    ##	 a[0] = 10+x+y;
    ##   return a[0];
    ## }
    .ent g
g:
    addiu   $sp, $sp, (-128)	## 32*4 = a[32]
    li	    $t2, 10
    sw	    $t2, 0($sp)		## a[0] = 10;
				## calculate using $a0, $a1...
    lw	    $t2, 0($sp)
    add	    $t2, $t2, $a0	## a[0]+x
    add	    $t2, $t2, $a1	## a[0]+x+y
    sw	    $t2, 0($sp)
    lw	    $v0, 0($sp)		## a[0]
    
    ## start of epilogue
    addiu    $sp, $sp, 128
    jr	    $ra			## return
    nop
    .end g
    
    // Start of data section
    .data
x: .word 0xA
y: .space 4
z: .space 4
