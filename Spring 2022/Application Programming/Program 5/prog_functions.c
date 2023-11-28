#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <math.h>
#include "prog5_functions.h"

/********************
 * prog_functions.c *
 * ******************/

//Prompt the user for the number of each type of coin from the piggy bank
//Perform input validation as necessary (must all be integers and >=0), then calculate and return the amount in dollars
double GetPiggyBankMoney(){
    double total;
    int pennies, nickels, dimes, quarters;
    int scanVal;
    int loop_enable = 1;                      //While loop condition
    int error;                                //if there is an error set this high

    while( loop_enable == 1 ) {
       error = 0;                             //Clears previous errors.

       printf("\nPlease enter the number of quarters, dimes, nickels, and pennies, separated by spaces: ");
       scanVal = scanf("%d %d %d %d", &quarters, &dimes, &nickels, &pennies);                    //user input for amounts
        
       if(scanVal != 4){                                                                         //if that checks all inputs are integers
         ClearLine();
         error = 1;
       }

       //condition to check for negative inputs
       else if( quarters < 0 || dimes < 0 || nickels < 0 || pennies < 0 ) {
            printf("All values must be >= 0!\n");
            error = 1;
       }
       else if( error == 0){
           loop_enable = 0;         //disables loop
       }                                    
    }//closes while loop
   
    total = ( pennies * 0.01 ) + ( nickels * 0.05) + ( dimes * 0.10 ) + ( quarters * 0.25 );

   return total;
}

//Given the principal amount in the bank account and the yearly rate, calculate and return the new amount after the given number of years has passed
double GetNewAmount(double principal, double rate, int years){

     principal = principal * pow( ( 1 + rate), years);

   return principal; // returns new amount after wait
}

//Print a generic error message about bad format, then clear all characters from input until a newline is found
void ClearLine(){
    char junk = 0;                                        
    printf("Bad format!\n");           
    while(junk != '\n'){
        scanf("%c", &junk);
    }
}
