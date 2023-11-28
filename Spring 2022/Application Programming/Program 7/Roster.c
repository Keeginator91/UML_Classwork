/**
 * @file prog7_Roster.c 
 * @author Keegan Smith (keegan_smith1@student.uml.edu)
 * @brief This file contians three functions that prints information regarding the roster.
 *        addStudent adds said studen then sorts the student structured array. printRoster();
 *        prints the entire, sorted roster. If findStudent(); finds said student, it returns 1.
 * @version 0.1
 * @date 2022-04-28
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#include "Roster.h"
#define _CRT_SECURE_NO_WARNINGS     // Necessary on Visual Studio
#include <stdio.h>
#include <string.h>

// Add student to roster; returns 1 if successful or 0 if roster full
int addStudent(Roster* r, Name* n) {

   int i = 0;
   int j = 0;
   Name temp[100];                  //temporary name structure for sorting

   if(  r->ns < r->cap ){           //makes sure roster is not full
      r->students[r->ns] = *n;      //appends new student to roster
      r->ns++;                      //number of students incrementor. Sets student appending index

      //sorting loop
      for( i = 0; i < r->ns ; ++i){ //look into sorting agian. Make sure everything is iterating
         for(j = 0; j < r->ns - i - 1; ++j){
            if( lessThan(  &r->students[j] , &r->students[j + 1] ) == 0 ){
               temp[j] = r->students[j];            
               r->students[j] = r->students[j + 1];  
               r->students[j + 1] = temp[j];
            }
         }
      } 
      return 1; 
   }
   return 0;
}

// Print contents of roster
void printRoster(Roster* r) {

   printf("%s\n", r->course);                                              //Prints course
   printf("Instructor: ");                                                 //instructor setup for printNameLFM(); call
   printNameLFM(&r->instructor);                                           //prints instructors name
   printf("Course meetings: %s %s in %s\n", r->days, r->time, r->room);    //prints course day, time and room
   printf("Enrollment cap: %d\n", r->cap);                                 //prints enrollment cap from course
   printf("Number enrolled: %d\n", r->ns);                                 //prints number entrolled in course. Number is updated in addStudent();

   if( r->ns != 0){                                                        //conditional for roster print if no students in class, not printed
      printf("Class roster:\n");
      for(int i = 0; i < r->ns; i++){    //prints every student in student array
         printNameLFM(&r->students[i]);
      }
   }
}

// Find student in roster; returns 1 if successful or 0 if student not found
int findStudent(Roster* r, Name* n) {

   for(int i = 0; i < r->ns; i++){
      if( equal( &r->students[i] , &*n) == 1 ){
         return 1;
      }
   }
   return 0;  
}