/**
 * @file prog7_Name.c
 * @author Keegan Smith (keegan_smith1@student.uml.edu)
 * @brief Name.c performs a number of functions reguarding the name structure. Detailed descriptions listed before functions.
 * @version 0.1
 * @date 2022-04-28
 * 
 * @copyright Copyright (c) 2022
 * 
 */

/** Functions to be modified start on line 21 **/

#include "Name.h"
#define _CRT_SECURE_NO_WARNINGS     // Necessary on Visual Studio
#include <stdio.h>
#include <string.h>

// Print contents of Name struct
void printName(Name *n) {
	printf("%s %c. %s\n", n->first, n->middle, n->last);
}

// Prompt for and read information into existing Name
void readName(Name *n) {
	char dot;
	printf("Enter name: ");
	scanf("%s %c%c %s", n->first, &(n->middle), &dot, n->last);
}

/**************		NEW FUNCTIONS FOR PROGRAM 8 	*************************/

// Print contents of Name struct in form: last, first and middle
void printNameLFM(Name* n) {
	printf("%s, %s %c.\n", n->last, n->first, n->middle);
}

// Returns 1 if structure pointed to by n1 is "less than" 
//    (earlier in alphabetical order) struct pointed to by n2
// Should compare names in order: last, first, middle
int lessThan(Name* n1, Name* n2) {

	//checks last name. strcmp returns less than zero if 1 is less than 2
	if( strcmp(n1->last, n2->last) < 0 ){
		return 1;
	}
	// returns 1 if last is equal and the first name of n1 is less than the first of n2
	else if( (strcmp(n1->first, n2->first) < 0 ) && (strcmp(n1->last, n2->last) == 0) ){ 
		return 1;
	}
	//returns 1 if the last, middle, and first are identical
	else if( (n1->middle < n2->middle) && (strcmp(n1->first, n2->first) == 0 ) ){ 
		return 1;
	}

	//if last and first equal, checks if middle is
	else{
   		return 0;  
	}
}

// Returns 1 if structure pointed to by n1 is
//   equal to structure pointed to by n2 and
//   0 otherwise
int equal(Name* n1, Name* n2) {
   
   if ( (n1->middle == n2->middle) && (strcmp(n1->first, n2->first) == 0) && (strcmp(n1->last, n2->last) == 0) ){
	   return 1;
   }
   
	return 0;  
}

/*** END NEW FUNCTIONS FOR PROGRAM 8 ***/