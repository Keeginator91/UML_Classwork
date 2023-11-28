## EECE.3170: Microprocessors I
## UMass Lowell
## Original Author: M. Geiger
## ADCTest2.S: in-class example to demonstrate PIC ADC basics
##   Automatic sampling example

// Including xc.h allows use of SFR names, bit masks, etc.
#include <xc.h>

    // Interrupt vector setup    
    .globl  __vector_dispatch_15    ## ADC interrupt = vector #15
    .section .vector_15, code, keep
    .align 2
    .set nomips16
    .ent __vector_dispatch_15
__vector_dispatch_15:
    j  isrvector15	    ## Jump to actual ISR code, which is in text section
    nop
    .end __vector_dispatch_15
    .size __vector_dispatch_15, .-__vector_dispatch_15
    
    // Start of text section           
    .text		## Text section contains code
    .set noreorder	## Disable instruction reordering
    .globl main		## Define main label as a global entity
    .ent main		##   and an entry point 
    
main:
    /* Configure I/O ports--LEDs on Port A & C; analog input on Port B, pin 3*/
    sw	    zero, TRISA		    ## TRISA = 0  --> all PORTA bits = output
    sw	    zero, ANSELA	    ## ANSELA = 0 --> all PORTA bits digital
    li	    t0, _PORTB_RB3_MASK
    sw	    t0, TRISB		    ## TRISB = 0x00000008 --> pin 3 input
    sw	    t0, ANSELB		    ## ANSELB = 0x00000008 --> pin 3 analog
    sw	    zero, TRISC		    ## TRISC = 0  --> all PORTC bits = output
    sw	    zero, ANSELC	    ## ANSELC = 0 --> all PORTC bits digital
    
    /*****************************
     ADC setup from PIC32MM out of box demo (adc.c) modified for autosampling: 
        AD1CON1bits.FORM = 0b00;
        AD1CON1bits.SSRC = 0x7;	    (Internal counter ends sampling & starts conversion)
	AD1CON1bits.ASAM = 1;	    (Automatically start sampling once conversion done)
        AD1CON2bits.VCFG = 0x0 ;
        AD1CON2bits.SMPI = 0x0;     
        AD1CON3bits.ADCS = 0xFF ;   (T_AD = 510 * T_SRC (slowest possible A/D conversion clock)
        AD1CON3bits.SAMC = 0b10000; (auto-sample time = 16 * T_AD)
        AD1CON1bits.ON = 1 ;
    ******************************/
    li	    s0, _AD1CON1_ASAM_MASK  ## Set automatic sampling bit
    ori	    s0, s0, 0x70	    ## Set SSRC field = 0x7 for autoconversion after internal timer
    sw	    s0, AD1CON1		    ## Still using 10-bit conversion mode
				    ##   but now using autosampling

    sw	    zero, AD1CON2	    ## Clear all bits (key bits: VCFG for Vdd/Vss as reference
				    ##    SMPI for 1 sample/interrupt)
    li	    s0, _AD1CON3_ADCS_MASK  ## ADCS = 0xFF --> T_AD = 510 * T_SRC (slowest possible A/D conversion clock)
    ori	    s0, s0, 0x1000	    ## SAMC = 0b10000 --> auto-sample time = 16 * T_AD = 8,160 * T_SRC
				    ##   T_SRC = peripheral bus clock
    sw	    s0, AD1CON3

    li	    s0, 11		    ## Potentiometer is connected to AN11
    sw	    s0, AD1CHS		    ##   so set AD1CHS = 11

    // Configure interrupts
    lui	    t3, 0x0001			## Want INTCON bit 16 (VS<0>) = 1
					##   so vectors 8 bytes apart
    ori	    t3, t3, _INTCON_MVEC_MASK   ## Enable multivectored interrupt mode
    sw	    t3, INTCON
    
    li	    t3, _IPC3_AD1IP_MASK    ## Set ADC interrupt priority level to 7
    sw	    t3, IPC3		    ## Implicitly sets subpriority level to 0
    
    li	    t2, _IEC0_AD1IE_MASK    ## Enable ADC interrupts
    sw	    t2, IEC0		    
				    
    ei				    ## Enable interrupts globally
    
    // Enable ADC once interrupts set up
    li	    s0, _AD1CON1_ON_MASK
    sw	    s0, AD1CON1SET	    ## Enable ADC
        
    // Main loop does nothing, since ADC auto-samples
mainloop:
    j	    mainloop
    nop
    
    .end main
    
    // Handle ADC interrupt--clear interrupt flag and update LEDs based on conversion result
    .global isrvector15
    .ent isrvector15
isrvector15:
    li	    t2, _IFS0_AD1IF_MASK    
    sw	    t2, IFS0CLR		    ## Clear AD1IF in software!
    
    lw	    a0, ADC1BUF0	    ## Read ADC result into a0
    
    jal	    setLEDs		    ## Call function below to modify LEDs
    nop

    eret		    ## Return from interrupt
    .end isrvector15        
    
    /* 
    setLEDs: use upper 5 bits of result to determine which LEDs to turn on
     10-bit result, so bit 9 = MSB
     If result is of form (x = don't care):
       xxxx1xxxxx --> turn LED1 on
       xxx1xxxxxx --> turn LED2 on
       xx1xxxxxxx --> turn LED3 (red) on
       x1xxxxxxxx --> turn LED3 (green) on
       1xxxxxxxxx --> turn LED3 (blue) on
    */
    .globl setLEDs
    .ent setLEDs
setLEDs:
    li	    t1, _PORTA_RA0_MASK	    ## $s1 = 0x00000001 (control LED1)
    li	    t2, _PORTC_RC9_MASK	    ## $s2 = 0x00000200 (control LED2)
    li	    t3, _PORTA_RA3_MASK	    ## $s3 = 0x00000008 (control LED3 - red)
    li	    t4, _PORTB_RB12_MASK    ## $s4 = 0x00001000 (control LED3 - green)
    li	    t5, _PORTA_RA2_MASK	    ## $s5 = 0x00000004 (control LED3 - blue)
    
    andi    t9, a0, 0x0020	    ## Check bit 5
    beq	    t9, zero, clrL1	    ## If 0, clear LED1, otherwise set it
    nop
    sw	    t1, LATASET		    ## LED1 on
    j	    chkL2
    nop
clrL1:
    sw	    t1, LATACLR		    ## LED1 off
    
chkL2:
    andi    t9, a0, 0x0040	    ## Check bit 6
    beq	    t9, zero, clrL2	    ## If 0, clear LED2, otherwise set it
    nop
    sw	    t2, LATCSET		    ## LED2 on
    j	    chkL3R
    nop
clrL2:
    sw	    t2, LATCCLR		    ## LED2 off
    
chkL3R:
    andi    t9, a0, 0x0080	    ## Check bit 7
    beq	    t9, zero, clrL3R	    ## If 0, clear LED3 (red), otherwise set it
    nop
    sw	    t3, LATASET		    ## LED3 (red) on
    j	    chkL3G
    nop
clrL3R:
    sw	    t3, LATACLR		    ## LED3 (red) off

chkL3G:
    andi    t9, a0, 0x0100	    ## Check bit 8
    beq	    t9, zero, clrL3G	    ## If 0, clear LED3 (green), otherwise set it
    nop
    sw	    t4, LATBSET		    ## LED3 (green) on
    j	    chkL3B
    nop
clrL3G:
    sw	    t4, LATBCLR		    ## LED3 (green) off

chkL3B:
    andi    t9, a0, 0x0200	    ## Check bit 9
    beq	    t9, zero, clrL3B	    ## If 0, clear LED3 (blue), otherwise set it
    nop
    sw	    t5, LATASET		    ## LED3 (blue) on
    j	    ledsDone
    nop
clrL3B:
    sw	    t5, LATACLR		    ## LED3 (blue) off
    
ledsDone:
    jr	    ra
    nop
    
    .end setLEDs
