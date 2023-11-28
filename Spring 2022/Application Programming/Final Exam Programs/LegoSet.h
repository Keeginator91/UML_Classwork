/*
* EECE.2160: ECE Application Programming
* Spring 2021 Final Exam
*
* LegoSet.h: structure definition and function prototypes
*/

#ifndef LEGOSET_H
#define LEGOSET_H

typedef struct {
	char name[50];		// Name of set
	unsigned num;		// Set number
	unsigned pieces;	// Number of pieces in set
	unsigned minAge;	// Minimum recommended age
	unsigned maxAge;	// Maximum recommended age
} LegoSet;

void printSet(LegoSet* ls);
void findByAge(LegoSet list[], unsigned n, unsigned a);
unsigned largestSet(LegoSet list[], unsigned n);

#endif	// LEGOSET_H