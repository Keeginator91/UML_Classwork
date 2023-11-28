# timerTes.S: in-class example to demonstrate timers
           
    .text		## Text section contains code
    .set noreorder	## Disable instruction reordering
    .globl main		## Define main label as a global entity
    .ent main		##   and an entry point    

#include <xc.h>
    
main:
    // Configure port A for output (LED1)
    sw	    zero, TRISA		    ## TRISA = 0  --> all PORTA bits = output
    sw	    zero, ANSELA	    ## ANSELA = 0 --> all PORTA bits digital
    li	    t0, _PORTA_RA0_MASK	    ## $t0 = 0x00000001
    sw	    t0, LATASET		    ## Set Port A, bit 0 (turn LED1 on)
    
    // Configure port C for output (LED2)
    sw	    zero, TRISC
    sw	    zero, ANSELC
    li	    t8, _PORTC_RC9_MASK
    sw	    t8, LATCSET

    // Configure Timer 1
    sw	    zero, T1CON		    ## Clear T1Con -- including ON=0, 
    
    ori	    t1, zero,65535          # 65535 (0xFFFF) => 2.097 sec, 31250 = 1 sec
    sw	    t1, PR1		    ## maximum possible clock period -- 65,535 
    
    li	    t2, _IFS0_T1IF_MASK	    ## t2 = bit mask for checking T1IF 
    sw	    t2, IFS0CLR		    ## Clear T1IF 

    // Setting prescaler
    li	    t3, _T1CON_TCKPS_MASK   ## Prescale by factor of 256 (TCKPS=11) 
    sw	    t3, T1CONSET
    
    // following is setting prescale of 1:64
    //lw	    s1, T1CON
    //li	    s2, 0x00000020	    ## mask for TCKPS (bits 5, 4)
    //or	    s3, s1, s2
    //sw	    s3, T1CON

    li	    t5, _T1CON_TON_MASK	    ## enable timer 1 by setting ON=1
    sw	    t5, T1CONSET
toggle:
				    ##   Toggles LED about every 1.5 seconds
delay:
    //addi    t1, t1, -1		    ## Decrement counter
    //bne	    t1, zero, delay	    ##  and continue doing that until we hit 0
    lw	    t4, IFS0
    li	    t6, 0x00000800
    and	    t7, t4, t6
    beq	    t7, zero, delay
    nop

    //li	    t2, _IFS0_T1IF_MASK	    ## t2 = bit mask for checking T1IF 
    sw	    t2, IFS0CLR		    ## Clear T1IF 

    sw	    t0, LATAINV		    ## toggles LED1
    sw	    t8, LATCINV
  
    j	    toggle		    ## Reset delay counter and start again
    nop
spin:
    j	spin
    nop

    .end main