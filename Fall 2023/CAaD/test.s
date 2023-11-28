#code sourced from online @: https://stackoverflow.com/questions/19212544/sorting-array-in-mips-assembly
#then changed to HW parameters

.text

.globl main

main:
    la  $t0, Array             # Copy the base address of your array into $t1
    add $t0, $t0, 20           # Length of array calculation, 4 bytes per int * 5 ints = 20 bytes     

outterLoop:                    # Used to determine when we are done iterating over the Array
    add $t1, $0, $0            # $t1 holds a flag to determine when the list is sorted
    la  $s6, Array             # Set $s6 to the base address of the Array

innerLoop:                     # The inner loop will iterate over the Array checking if a swap is needed
    lw  $t2, 0($s6)            # sets $t0 to the current element in array
    lw  $t3, 4($s6)            # sets $t1 to the next element in array
    slt $t5, $t2, $t3          # $t5 = 1 if $t0 < $t1
    beq $t5, $0, continue      # if $t5 = 1, then swap them
    add $t1, $0, 1             # if we need to swap, we need to check the list again
    sw  $t2, 4($s6)            # store the greater numbers contents in the higher position in array (swap)
    sw  $t3, 0($s6)            # store the lesser numbers contents in the lower position in array (swap)

continue:
    addi $s6, $s6, 4           # advance the array to start at the next location from last time
    bne  $s6, $t0, innerLoop   # If $s6 != the end of Array, jump back to innerLoop
    bne  $t1, $0, outterLoop   # $t1 = 1, another pass is needed, jump back to outterLoop

.data

Array:  .word   2, 4, 3, 6, 1