/*
Keegan Smith
Application Programming
Program 3

This program will integer calculations 
using + - * / and %

*/

#include <stdio.h>

int main(void){

    int x; // input integer 1
    int y; // input integer 2
    char op; // place holder for arithmatic OPeration
    int nVals; //value check of input
    int sol; //solution

    printf("Please enter your integer arithmetic expression:");
    nVals = scanf("%d %c %d", &x, &op , &y);
    printf("\n"); //seperates the scanf print statement from the answer

    if( nVals == 3 ){ // checks if nVals is equal to 3 in order to continue to switch

            switch(op){ // selects operation based on op input
            
                case '+': //addition case
                    sol = x + y;
                    printf("Answer: %d + %d = %d", x, y, sol);
                    break;

                case '-': //subtraction case
                    sol = x - y;
                    printf("Answer: %d - %d = %d", x, y, sol);
                    break;

                case '*': //multiplication case
                    sol = x * y;
                    printf("Answer: %d * %d = %d", x, y, sol);
                    break;

                case '/': //division case
                    if( x == 0 || y == 0){
                        printf("Error: divide by zero!\n");
                        break;
                    }
                    else{
                        sol = x / y;
                        printf("Answer: %d / %d = %d", x, y, sol);
                        break;
                    }

                case '%': //modulo case
                    if( x == 0 || y == 0){
                        printf("Error: divide by zero!\n");
                        break;
                    }
                    else{
                        sol = x % y;
                        printf("Answer: %d %% %d = %d", x, y, sol);
                        break;
                    }
           
                default: //invalid operator error message
                    printf("Error: invalid operator %c!\n", op);
                    break;
            }//closes switch
    }// closes outside if statement

    else{ // Error message when nVals is not three
        printf("Error: only %d value(s) entered correctly!\n", nVals);
        }    

    return 0;
}//closes main
