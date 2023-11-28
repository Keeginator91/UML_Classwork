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
    ##	 a[1] = f(x, y, a[2]);
    ##	 a[0] = f(x, y, a[1]);
    ##   return a[0];
    ## }
    .ent g
g:
    addiu   $sp, $sp, (-160)	## 32*4 = a[32] + $ra + three saved registers
    sw	    $ra, 28($sp)
    #sw	    $s0, 16($sp)
    #sw	    $s1, 20($sp)
    #sw	    $s3, 24($sp)
    
    li	    $t2, 10
    sw	    $t2, 0($sp)		## a[0] = 10;
				## calculate using $a0, $a1...
    lw	    $t2, 0($sp)
    
    lw	    $v0, 0($sp)		## a[0]
    
    ## first call to f
    #lw	    $a0, 160 ($sp)
    #lw	    $a1, 164 ($sp)
    #lw	    $a2, 40 ($sp)
    jal	    f			
    nop
   
    sw	    $v0, 36 ($sp)	## a[1] = return value from f()
    
    ## second call to f
    #lw	    $a0, 160 ($sp)
    #lw	    $a1, 164 ($sp)
    #lw	    $a2, 36 ($sp)
    jal	    f			## first call to f
    nop
   
    sw	    $v0, 32 ($sp)	## a[0] = return value from f()
    
    ## start of epilogue
    lw	    $ra, 28($sp)
    #lw	    $s0, 16($sp)
    #lw	    $s1, 20($sp)
    #lw	    $s2, 24($sp)
    addiu    $sp, $sp, 160
    jr	    $ra			## return
    nop
    .end g
    
    .ent f
f:
    nop
    jr	    $ra
    nop
    .end f
    // Start of data section
    .data
x: .word 0xA
y: .space 4
z: .space 4
