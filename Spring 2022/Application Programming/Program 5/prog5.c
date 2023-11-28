
/*************************************************************
This contains the main function and includes necessary headers
*************************************************************/
#include <stdio.h>
#include "prog5_functions.h"
   
/******************************
 * main function
 * ***************************/
   
int main()
{
/*******************************
Variable definition and initialization
*******************************/

   char cmd;                        //User input command vairable
   double account_amount = 0.0;     //account amount..
   double rate = 0.0;               //rate...
   double total = 0.0;              //sum amount of GetPiggyBankMoney();
   int years_waited = 0;            //total years waited
   int wait;                        //How long user wants to wait
   int loop_enable = 1;             //loop control for user input loop also ends program if set to 0
   int int_cmd;						//Sets cmd value as an integer for error checking
   
   //Loop scanf values, first letter is the loop it is in
   int wait_scanVal;                
   int rate_scanVal;
   
   //Main program loop
   do{

        printf("Year %d:\n", years_waited );
        printf(" There is $%.2lf in your bank account with an annual rate of %.3lf.", account_amount, rate);

        //Initial prompt/scan loop
        printf(" What do you wish to do? (Wait, Invest, Quit): ");
        scanf(" %c", &cmd);	//cmd as a char
		int_cmd = cmd;
		
        //error checking condictions and command executions
        switch(cmd){
               
            case 'W': case 'w':   //user inputs wait command
            
                //set wait and wait_scanVal to zero to force into while loop
                wait = 0;           
                wait_scanVal = 0;  
               
                //user input loop for wait command
                while( wait_scanVal != 1 || wait < 1 ){
                    printf("\nHow many years do you want to wait? ");
                    wait_scanVal = scanf(" %d", &wait);
                       
                    //ERROR statements
                    if( wait_scanVal != 1) ClearLine();
					else if( wait < 0) printf("\nNeed a positive amount!\n");
                    else if( wait < 1) printf("ERROR: Must wait longer than 1 year\n");
                    else{
                        printf("\nWaiting %d year(s)...\n\n", wait);
                        account_amount = GetNewAmount(account_amount, rate, wait);  //function call to GetNewAmount() for compounded account value and ssigns it to account_amount
                        years_waited += wait;                                       //add current how long user waited to current year
					}
                }//closes while loop for wait input
                break;
               
            case 'I': case 'i':   //user inputs invest command

                total = GetPiggyBankMoney();
                account_amount += total;
               
                printf("\nYou got $%.2lf from your piggy bank and added it to your account! Your total is now $%.2lf\n", total, account_amount);
               
                 do{
                        printf("What is the new yearly rate? ");
                        rate_scanVal = scanf("%lf", &rate);
                        //Rate error conditions
                        if(rate_scanVal != 1) ClearLine();
                        else if( rate < 0) printf("Need a positive amount!\n");
						printf("\n");
                    }while( rate < 0 || rate_scanVal != 1);

					//Vests the amount for 1 year automatically after setting rate
						wait = 1;
						account_amount = GetNewAmount(account_amount, rate, wait); //function call to GetNewAmount() for compounded account value and ssigns it to account_amount
						years_waited += wait;									   //Increases years waited by 1 year			

                break;
           
            case 'Q': case 'q':   //user inputs quit command
                printf("\nBye!");    
                loop_enable = 0;        //disables loop to leave
                break;
           
            default:    //Tells user what error happend
                if( int_cmd < 65 ){
					ClearLine();
				}
                else if ( int_cmd != 119 || int_cmd != 87 || int_cmd != 113 || int_cmd != 81 || int_cmd != 105 || int_cmd != 73){
					printf("\nInvalid command %c!\n\n", cmd); 
					}
                break;
           
        }//closses switch
 
   } while (loop_enable == 1);

return 0;
}