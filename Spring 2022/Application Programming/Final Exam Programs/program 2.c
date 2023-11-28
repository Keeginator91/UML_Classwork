/*
* EECE.2160: ECE Application Programming
* Spring 2021 Final Exam
* 
* exam3_struct_main.c: main function for 
*    programming problem on structures
*/

#define _CRT_SECURE_NO_WARNINGS		// Necessary on Visual Studio
#include <stdio.h>
#include <string.h>
#include "LegoSet.h"

int main() {

	LegoSet sets[10] =			// Array of 10 LegoSet structures--DO NOT CHANGE
	{
		{ "Classic Large Creative Brick Box",
			10698, 790, 4, 99 },
		{ "Tree House Building Kit",
			21318, 3036, 16, 99 },
		{ "DUPLO My First Bricks",
			10848, 80, 1, 3 },
		{ "Disney Ariel's Celebration Boat",
			43191, 114, 4, 10 },
		{ "DUPLO Town Farm Tractor & Animal Care",
			10950, 27, 2, 5 },
		{ "City Space Mars Research Shuttle",
			60226, 273, 5, 12 },
		{ "Thor Mech Armor",
			76169, 139, 7, 14 },
		{ "Technic Jeep Wrangler",
			42122, 665, 9, 99 },
		{ "Nintendo Entertainment System",
			71374, 2646, 17, 99 },
		{ "Millennium Falcon",
			75105, 1329, 9, 14 }
	};

	char cmd[10];			// Input command
	unsigned flag = 0;	// Flag to end loop
   unsigned age;        // User input for age
   
   /***** ADD OTHER VARIABLES AS NEEDED *****/

	do {
		printf("\nEnter command: ");
		scanf("%s", cmd);

		if (strcmp(cmd, "age") == 0) {
			printf("Enter age: ");
			scanf("%u", &age);
			
			// ADD CALL TO findByAge() FUNCTION
		}

		else if (strcmp(cmd, "largest") == 0) {
			printf("Largest set:\n");

         // ADD CALL TO largestSet() FUNCTION AND ANY OTHER NECESSARY CODE
		}

		else if (strcmp(cmd, "exit") == 0)
			flag = 1;

		else
			printf("Invalid command %s\n", cmd);

	} while (flag == 0);

	return 0;
}