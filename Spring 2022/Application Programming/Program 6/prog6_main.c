/**** 
 * Keegan Smith
 * Application Programming
 * Program 6
 * 
 * This program will continually prompt the user to enter single word commands to perform certian actions on an array of integers. 
 * Certain commands will modify the array and print the changed array or print specified iformation from the array
 * ****/

/******************
 * MAIN FUNCTIONS *
*******************/
#include <stdio.h>
#include <string.h>
#include "prog6_fns.h"

int main() {   
    char cmd[10];                  //user command input

  while(1){
    
    printf("Enter command (type help for command list): "); 
    //fgets(cmd, 10, stdin);          //User command input

    scanf("%s", cmd);                  //user command input
    
    cmd[strcspn(cmd, "\n")] = '\0';                                     //cuts off \n of string for comparison. Found in https://stackoverflow.com/questions/2404794/strcmp-on-a-line-read-with-fgets
    cmd[strcspn(cmd, " ")] = '\0';                                      //cuts off spaces from the string

            /**** INVALID COMMAND ERROR ****/
    if( strcmp(cmd, "help") != 0 && strcmp(cmd, "add") != 0 && strcmp(cmd, "remove") != 0 && strcmp(cmd, "print") != 0 && strcmp(cmd, "stats") != 0 && strcmp(cmd, "sort") != 0 && strcmp(cmd, "exit") != 0 ){
        printf("Error: invalid command %s\n\n", cmd);
    }

            /**** COMMAND HELP ****/
    else if( strcmp(cmd, "help") == 0 ){
        printf("Commands:\nhelp:   print this command list\n");
        printf("add:    add a value at the end of the array\n");
        printf("remove: remove a value from the array\n");
        printf("print:  print the array contents\n");
        printf("stats:  generate array stats (min, max, avg, median)\n");
        printf("sort:   sort the array contents\n");
        printf("exit:   end the program\n");
    }
    
            /**** CHECKS IF ARRAY IS EMPTY ****/
    else if( (user_list1() == 0 && strcmp(cmd, "add") != 0) && strcmp(cmd, "exit") != 0){
        printf("\nArray is Empty!\n\n");                //Error message
    }
    
            /**** COMMAND ADD ****/
    else if( strcmp(cmd, "add") == 0) {             //calls add function
        fAdd();
    }
    
            /**** COMMAND REMOVE ****/
    else if( strcmp(cmd, "remove") == 0){           //calls remove function
        fRemove();
        ClearLine();
    }
    
            /**** COMMAND PRINT ****/
    else if( strcmp(cmd, "print") == 0) {           //calls print function
        fPrint();
        //printf("print case\n");
    }
    
            /**** COMMAND STATS ****/
    else if( strcmp(cmd, "stats") == 0) {           //calls stats function
        fStats();
        //printf("stats case\n");
    }
    
            /**** COMMAND SORT ****/
    else if( strcmp(cmd, "sort") == 0) {            //calls sort function
        fSort();
        //printf("sort case\n");
    }
    
            /**** COMMAND EXIT ****/
    else if( strcmp(cmd, "exit") == 0){             //exits program
        printf("\nBye!\n");
        return 0;
    }

    else{
        printf("How did you get all the way down here?\n");
    }
    
  }//close while loop
}//closes main
