    .text		## Text section contains code
    .set noreorder	## Disable instruction reordering
    .globl main		## Define main label as a global entity
    .ent main		##   and an entry point    

// Including xc.h allows use of SFR names, bit masks, etc.
#include <xc.h>
    
main:
    /* Configure I/O ports--LEDs on Port A & C; switches on Port B */
    sw	    zero, TRISA		    ## TRISA = 0  --> all PORTA bits = output
    sw	    zero, ANSELA	    ## ANSELA = 0 --> all PORTA bits digital
    not	    t0, zero		    
    sw	    t0, TRISB		    ## TRISB = 0xFFFFFFFF --> all PORTB bits = input
    sw	    zero, ANSELB	    ## ANSELB = 0 --> all PORTB bits digital  
    sw	    zero, TRISC		    ## TRISC = 0  --> all PORTC bits = output
    sw	    zero, ANSELC	    ## ANSELC = 0 --> all PORTC bits digital

    li	    t0, _PORTA_RA0_MASK	    ## t0 = 0x00000001 --> control LED1
    li	    t1, _PORTC_RC9_MASK	    ## t1 = 0x00000200 --> control LED2
    li	    t5, _PORTB_RB7_MASK	    ## t5 = 0x00000080 --> saved state of S1
    li	    t6, _PORTB_RB13_MASK    ## t6 = 0x00002000 --> saved state of S2
    
/* Repeatedly read (poll) switches; turn on LED if button pressed;
    turn off LED if button released */
    
// Start with state of S1
pollS1:
    lw	    t2, PORTB		    ## Read Port B
    
    andi    t3, t2, _PORTB_RB7_MASK ## Check S1
				    ## If button isn't pressed, t3 = 0x00000080
				    ##  If button is pressed, t3 = 0x00000000
				 
    bne	    t3, zero, copyS1	    ## If button not pressed (RB7 = 1), 
    nop				    ##    copy state and check S2
    beq	    t3, t5, pollS2	    ## If button pressed but hasn't changed
    nop				    ##    check state of S2
    
    ## Must be a new button press--wait ~0.009 sec and check it again
    jal	    delay		    ## Call debounce function for delay
    nop
    
    ## Check if button still pressed
    lw	    t2, PORTB		    
    andi    t3, t2, _PORTB_RB7_MASK 
    bne	    t3, zero, copyS1
    nop
    
    sw	    t0, LATAINV		    ## Toggle LED1 if this is a new button press
        
copyS1:
    add	    t5, t3, zero	    ## t5 = saved state of S1
    
// Check state of S2
pollS2:
    andi    t4, t2, _PORTB_RB13_MASK ## Check S2
    bne	    t4, zero, copyS2	    ## If button not pressed (RB13 = 1), 
    nop				    ##    copy state and go back to checking S1
    beq	    t4, t6, pollS1	    ## If button pressed but hasn't changed
    nop				    ##    check state of S1

    ## Must be a new button press--wait ~0.01 sec and check it again
    jal	    delay		    ## Call debounce function for delay
    nop
    
    ## Check if button still pressed
    lw	    t2, PORTB		    
    andi    t4, t2, _PORTB_RB13_MASK 
    bne	    t4, zero, copyS2
    nop
    
    sw	    t1, LATCINV		    ## Toggle LED2 if this is a new button press

copyS2:
    add	    t6, t4, zero	    ## t6 = saved state of S2
    
    j	    pollS1		    ## Return to test S1
    nop
    
spin:
    j	spin
    nop

    .end main
    
    .ent delay
delay:
    li	    t7, 0x61A8		    ## Set delay counter to 0x61A8 = 25,000
				    ## Since loop body has 3 instructions,
				    ##   loop takes 25,000 * 3 = 75,000
				    ##   cycles
				    ## Remaining 3 instructions take 3 cycles
				    ##  ~75,000 cycles / 8 MHz clock ~ 0.009375 sec delay
loop:
    addi    t7, t7, -1		    ## Decrement counter
    bne	    t7, zero, loop	    ##  and continue doing that until we hit 0
    nop				    ## NOTE: This function originally branched
				    ##   to "done" if t7 != zero, which means
				    ##   the delay loop was really no loop at all!
    jr	    ra
    nop

    .end delay