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
    
/* Repeatedly read (poll) switches; turn on LED if button pressed;
    turn off LED if button released */
    
// Start with state of S1
pollS1:
    lw	    t2, PORTB		    ## Read Port B
    andi    t3, t2, _PORTB_RB7_MASK ## Check S1 (_PORTB_RB7_MASK = 0x00000080)
    bne	    t3, zero, clrLED1	    ## If button not pressed (RB7 = 1), 
    nop				    ##    clear LED1
    sw	    t0, LATASET		    ## Turn on LED1 if S1 pressed
    j	    pollS2		    ## Check S2
    nop
    
clrLED1:    // If you get here, S1 isn't pressed--turn LED1 off
    sw	    t0, LATACLR
    
// Check state of S2
pollS2:
    andi    t4, t2, _PORTB_RB13_MASK ## Check S2
    bne	    t4, zero, clrLED2	    ## If button not pressed (RB13 = 1), 
    nop				    ##    clear LED2
    sw	    t1, LATCSET		    ## Turn on LED2 if S2 pressed
    j	    pollS1		    ## Return to test S1
    nop
    
clrLED2:    // If you get here, S2 isn't pressed--turn LED2 off
    sw	    t1, LATCCLR
    j	    pollS1		    ## Return to test S1
    nop
    
spin:
    j	spin
    nop

    .end main