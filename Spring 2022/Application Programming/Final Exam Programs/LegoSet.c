/*
* EECE.2160: ECE Application Programming
* Spring 2021 Final Exam
*
* LegoSet.c: function definitions
*/

#define _CRT_SECURE_NO_WARNINGS     // Necessary for Visual Studio
#include <stdio.h>
#include "LegoSet.h"

// Print set pointed to by ls
void printSet(LegoSet* ls) {

    printf("\n%s (#%u)\n", ls->name, ls->num);
    printf("%u pieces\n", ls->pieces);
    printf("Ages %u", ls->minAge);
    if(ls->maxAge == 99)
    {
        printf(" and up\n\n");
    }
    else
    {
        printf("-%u\n\n", ls->maxAge);
    }

}

// Finds and prints all age-appropriate sets in array list
//   (which contains n elements) for someone with given age
void findByAge(LegoSet list[], unsigned n, unsigned a) {
    int i;
    int count = 0;

    for(i = 0; i < n; i++){
        if (a >= list[i].minAge && a <= list[i].maxAge)
        {
            printSet(&list[i]);
            count++;
        }
    }
    printf("Total sets for age %u: %d\n\n", a, count);
}

// Find largest set in list
unsigned largestSet(LegoSet list[], unsigned n) {
    int mostest = 0;
    int max_index;
    int i;

    for ( i = 0; i < n; i++)
    {
        if (list[i].pieces > mostest)
        {
            mostest = list[i].pieces;
            max_index = i;
        }
    }
    printSet(&list[max_index]);
   
   return mostest;      // EDIT RETURN STATEMENT TO RETURN APPROPRIATE VALUE
}
