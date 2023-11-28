    // Start of text section           
    .text		## Text section contains code
    .set noreorder	## Disable instruction reordering
    .globl main		## Define main label as a global entity
    .ent main		##   and an entry point 
main:
    
    li	    $t1, 0x80000000	    ## 0x8000000
				    ##    2147483648 (unsigned)
				    ##	 -2147483648 (signed)
    li	    $t2, 2		    ## 0x2
    
    ## signed multiplication
    mult    $t1, $t2		    ## 0xFFFFFFFF00000000 (-4294967296)
				    ## hi=0xFFFFFFFF, lo=00000000
    mfhi    $t3			    ## load hi to $t3
    mflo    $t4			    ## load lo to $t4
		
    ## unsigned multiplication
    multu   $t1, $t2		    ## 0x0000000100000000 (4294967296)
				    ## hi=0x00000001, lo=00000000
    mfhi    $t3			    ## load hi to $t3
    mflo    $t4			    ## load lo to $t4
    
    ## 32-bit version
    li	    $t1, 8
    mul	    $t2, $t1, $t1	    ## 8*8=64 will be in $t2
    
    ## division 
    li	    $t1, 10
    li	    $t2, 3
    div	    $t1, $t2		    ## 8/3, 3=quotient (lo), 1=remainder (hi)
				    
    mflo    $t3			    ## load quotient to $t3
    mfhi    $t4			    ## load remainder to $t4
    addi    $t4, $t3, 2		    ## add quotient+2
    
    ## clz: couting leading zeros
    li	    $t1, 0x8		    ## 0x00000008
    clz	    $t5, $t1		    ## clo: counting leading ones
    
    ## clo: counting leading ones
    li	    $t1, 0xFFFF0000
    clo	    $t5, $t1
    
    ## negu
    li	    $t1, 5
    negu    $t1, $t1		    ## $t1 = -5 (0xFFFB)
    negu    $t1, $t1		    ## $t1 = 5
                
    ## seb/seh
    li	    $t1, 0x00008001
    seb	    $t2, $t1		    ## sign-extended LSB of $t1
    seh	    $t3, $t1		    ## sign-extended LSH of $t1

mainloop:
    j	    mainloop
    nop
    .end main
    
    // Start of data section
    .data
v1: .word 0xDEADBEEF
v2: .half 0x1234
v3: .byte 0xFF