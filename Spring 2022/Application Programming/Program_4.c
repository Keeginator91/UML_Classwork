/*
Keegan Smith
Application Programming
Program 4
This is a guessing game that loops and will repeat the loop if there is an error
*/

#define _CRT_SECURE_NO_WARNINGS     // Necessary on Visual Studio, not zyBooks
#include <stdio.h>

#include <stdlib.h>                 // Necessary for rand(), srand() functions

void ClearLine();

int main() {
	int seed;	// RNG seed (you can remove the initial value once you get your first input loop working)
	
	/*** DECLARE OTHER VARIABLES HERE ***/
    int max_range, min_range;                   //max and min values of range
    int num_guess;                              //number of guesses
    int num_rounds;                             //number of rounds
    int user_guess;                             //user's guess
    int number;                                 //number chosen by random number generator
    int seedVal;                                //value of seed scanf call
    int guessVal;                               //value of guess scanf call
    int roundsVal;                              //value of rounds scanf call
    int rangeVal;                               //value of range scanf call
    int guess = 1;                              //counting number of guess for guessing loop
    double wins = 0.0;                          //Number of wins
    double losses = 0.0;                        //number of losses


	// Input loops
	// Read RNG seed until error-free
    while( seed <= 0 || seedVal != 1){
       printf("Enter seed for random number generator:\n"); 
       seedVal = scanf(" %d", &seed);
       if(seedVal != 1) ClearLine();
       else if(seed <= 0) printf("ERROR: Seed value should be > 0\n");                                           //Error if seed value is negative
    }
    printf("Seed: %d\n", seed);                                                                                  //Prints seed value

	// Read range endpoints until error-free
 //   printf("Enter range endpoints: Max, Min\n");                 //shows user entry format
    while( max_range <= 0 || max_range < (min_range + 4) || min_range <= 0 || rangeVal != 2){
        printf("Enter range endpoints:\n");
        rangeVal = scanf(" %d %d", &min_range, &max_range); 
        if(rangeVal != 2) ClearLine();
        if(rangeVal == 2){                                                                                          //Only checks for other errors if format input is correct
          if( (max_range - 4) < min_range ) printf("ERROR: Max value should be at least 4 more than min value\n");  //Error if max is not at least 4 more than min 
          if(max_range < 0) printf("ERROR: Max value should be positive\n");                                        //Error if max range is negative
          if(min_range < 0) printf("ERROR: Min value should be positive\n");                                              //Error if min range is negative
        } 
    }
    printf("Range endpoints: %d %d\n", min_range, max_range);                                                  //Prints endpoint range
    
	// Read number of guesses allowed until error-free
    do{
        printf("Enter number of guesses per round:\n");
        guessVal = scanf(" %d", &num_guess);
        if(guessVal != 1) ClearLine();
        else if(num_guess < 2) printf("ERROR: Must allow at least 2 guesses\n");                               //Error if guesses < 2        
    }while(num_guess < 2 || guessVal != 1);
    printf("Number of guesses: %d\n", num_guess);                                                              //prints final number of guesses

	// Read number of rounds until error-free
    while(num_rounds < 1 || roundsVal != 1){
        printf("Enter number of rounds for game:\n");
        roundsVal = scanf(" %d", &num_rounds); 
        if(roundsVal != 1) ClearLine();
        else if(num_rounds < 1) printf("ERROR: Must allow at least 1 round\n");                                  //Error if rounds is < 1
    }
    printf("Number of rounds: %d\n", num_rounds);                                                                //prints final number of rounds

	srand(seed);	                                                                                             //Seed random number generator--DO NOT CHANGE THIS LINE

	// Loop to control number of rounds--uncomment and fix
	for( int round = 1; round <= num_rounds ; round++ ) {
	
	    // Print round number
        printf("ROUND %d\n", round);
	   
	    // Choose new random value within range
        number = (rand() % (max_range - min_range + 1) ) + min_range;                                            //Random number choses for round
	    guess = 1;                                                                                               //Guess is set to 1 at start of each round
	    // Loop until maximum number of guesses is reached or user correctly guesses number
        while (guess <= num_guess) {

         // Prompt user to enter a guess until error-free (no formatting errors)
            do{
                printf("Enter guess #%d: ", guess);
                int guessVal = scanf(" %d", &user_guess);
                if(guessVal != 1) ClearLine();
            }while(user_guess < 0  || guessVal != 1);

         // If guess matches, user wins!
            if(user_guess == number ){
                    printf("Correct guess!\n");
                    ++wins;
                    break;
            }

         // Otherwise, tell them if it's too high or low and go on to next guess
            else if(user_guess > number) {
                printf("%d is too high!\n", user_guess);
            }
            else if(user_guess < number){
                printf("%d is too low!\n", user_guess);
            }
         // If user reaches max number of guesses without winning, tell them they lost
            if(guess == num_guess){
                printf("No more guesses--the correct answer was %d\n", number);
                ++losses;
            }

            guess++;                                                                                             //guess count variable incrementor
        }

        if (wins == num_rounds){
            break;
        }
        printf("Current wins: %.0lf\nCurrent losses: %.0lf\n\n", wins, losses);                                    //Current stats at end of round   
	}

   // Print final statistics
    printf("FINAL STATS\n");
    printf("Wins: %.0lf\nLosses: %.0lf\nWinning percentage: %.2lf%%", wins, losses, (wins / (wins + losses)) * 100 );

	return 0;
}

//Clear line function
void ClearLine() {
    char junk = 0;                                        
    printf("ERROR: Incorrectly formatted input\n");           
    while(junk != '\n'){
        scanf("%c", &junk);
    }
}   

