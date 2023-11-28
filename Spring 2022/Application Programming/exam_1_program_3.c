#include <stdio.h>

int main() {

    double snickers = 0.75;
    double chips = 0.50;
    double mnms  = 1.00;
    double cookies = 1.25;

    int userVal1;
    double userDough;
   
	// Display contents and costs
	printf("Vending machine contents:\n");
	printf("1 - Snickers ($0.75)\n");
	printf("2 - Chips ($0.50)\n");
	printf("3 - M & Ms ($1.00)\n");
	printf("4 - Cookies ($1.25)\n");

   // Prompt for and read inputs
	printf("Enter amount of money (without $ symbol) and item number\n");
	scanf("%lf %d", &userDough, &userVal1 );

    switch(userVal1){
        case(1):
            if(userDough < snickers){
                printf("You paid %.2lf, but you needed to pay $%.2lf", userDough, snickers);
            }
            else{
                printf("Purchase successful; change = $%.2lf", userDough - snickers);
            }
            break;

        case(2):
         if(userDough < chips){
                printf("You paid $%.2lf, but you needed to pay $%.2lf", userDough, chips);
            }
            else{
                printf("Purchase successful; change = $%.2lf", userDough - chips);
            }
            break;

        case(3):
             if(userDough < mnms){
                printf("You paid $%.2lf, but you needed to pay $%.2lf", userDough, mnms);
            }
            else{
                printf("Purchase successful; change = $%.2lf", userDough - mnms);
            }
            break;

        case(4):
             if(userDough < cookies){
                printf("You paid $%.2lf, but you needed to pay $%.2lf", userDough, cookies);
            }
            else{
                printf("Purchase successful; change = $%.2lf", userDough - cookies);
            }
            break;

        default:
            printf("Invalid item number %d", userVal1);
            break;
    }
	
	return 0;
}