#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>

//Do not change function prototypes (it will break the unit tests)
void incString(char s[], int amt);
void getSwappedFullName(char f[], char l[], char out[]);


int main()
{
	/***Declare variables***/
    char first[20];
    char last[20];
    char out[40];
    int amt;

	printf("Type your first and last name: ");
	/***Get first and last name in separate variables ***/
   scanf("%s %s", first, last);
   
   /***Complete the following printf statements***/
	printf("First name: %s\n", first );
	printf("Last name: %s\n",  last );
	
	/***Determine and print the increment amount***/
    amt = strlen(first) - strlen(last);

	printf("Updating both names by %d...\n", amt );
    incString(first, amt);
    incString(last, amt);


   /***Call the incString function to increment both first and last names ***/
	printf("Updated first name: %s\n", first );
	printf("Updated last name: %s\n", last );

   /*** Call getSwappedFullName to create a new string with the swapped names***/
	getSwappedFullName(first, last, out);

	printf("Your new spy name is %s\n", out );

	return 0;
}

/*** Complete the following function definitions  ***/

//Increment string 1's characters by some amount 
//Exception: lower case vowels aeiou should not be incremented
void incString(char s[], int amt)
{
    int i;
    int cap = strlen(s);

    for(i = 0; i < cap; i++){
        if( s[i] != 97 && s[i] != 101 && s[i] != 105 && s[i] != 111 && s[i] != 117 ){
            s[i] = s[i] + amt;
        }
    }
}

//Swap first and last name and put them in the output string with a space between them
void getSwappedFullName(char f[], char l[], char out[])
{
    strcpy(out, l);
    strcat(out, " ");
    strcat(out, f);
}




