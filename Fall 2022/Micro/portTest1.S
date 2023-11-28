    .text		## Text section contains code
    .set noreorder	## Disable instruction reordering
    .globl main		## Define main label as a global entity
    .ent main		##   and an entry point    

// Including xc.h allows use of SFR names, bit masks, etc.
//   ... but defines register names without $ in front, annoyingly
#include <xc.h>
    
main:
    sw	    zero, TRISA		    ## TRISA = 0  --> all PORTA bits = output
    sw	    zero, ANSELA	    ## ANSELA = 0 --> all PORTA bits digital
    li	    t0, _PORTA_RA0_MASK	    ## $t0 = 0x00000001
    
    sw	    t0, LATASET		    ## Set Port A, bit 0 (turn LED1 on)

toggle:
    li	    t1, 0x003FFFFF	    ## Set delay counter
				    ##   Toggles LED about every 1.5 seconds
delay:
    addi    t1, t1, -1		    ## Decrement counter
    bne	    t1, zero, delay	    ##  and continue doing that until we hit 0
    nop
    
    sw	    t0, LATAINV
    
    j	    toggle		    ## Reset delay counter and start again
    nop
spin:
    j	spin
    nop

    .end main