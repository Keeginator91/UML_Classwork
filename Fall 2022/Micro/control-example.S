    // Start of text section           
    .text		## Text section contains code
    .set noreorder	## Disable instruction reordering
    .globl main		## Define main label as a global entity
    .ent main		##   and an entry point 
main:
    li	    $t0, 6		## i
    li	    $t1, 5		## j
    
    ## movn, movz
    ## move    $t2, $t1		## $t2 = $t1, psedo instruction
				## add $t2, $t1, $zero
    movn    $t2, $t1, $t0	## $t2 = $t1, if $t0 != 0
    movz    $t2, $t1, $t0	## $t2 = $t1, if $t0 == 0
 
    ## if (i < j) 
    ##    i++; 
    ## else 
    ##    j++;
    slt	    $t2, $t0, $t1	## $t2 = 1 only if $t0 < $t1
    bne	    $t2, $zero, L1
    nop				## fill branch delay slot with nop
    addi    $t0, $t0, 1		## i++
    j	    L2			## exit if-else construct 
    nop				## fill branch delay slot with nop
L1: addi    $t1, $t1, 1		## j++
				## fall through if-else construct
L2:
    nop				
    
    ## 1st func call
    jal	    f1
    nop				## branch delay slot
    
    addi    $t2, $t2, 1		## dummy operation
    addi    $t2, $t2, 1		## dummy operation
    
    ## 2nd func call
    jal	    f1	    
    nop
    
    nop				## place holder for return from f1
    
mainloop:
    j	    mainloop
    nop
    .end main

    .ent f1
f1: addi    $t1, $t1, 0		## dummy
    jr	    $ra
    nop
    .end f1
    
    // Start of data section
    .data