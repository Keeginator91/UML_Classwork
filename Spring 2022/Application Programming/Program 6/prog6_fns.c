
/****************** 
 * FUNCTIONS FILE *
 * ****************/

// Here are the functions

/*** ADD OTHER NECESSARY #INCLUDE DIRECTIVES, FUNCTION DEFINITIONS ***/

#include "prog6_fns.h"
#include <stdio.h>
#include <string.h>

int user_list[10] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }; //globally passing arrayi so functions can access it easily
  //                  1  2  3  4  5  6  7  8  9  10

        /**     Function to return first integer of user array      **/
int user_list1(){
    return user_list[0];
}

        /**     ADD FUNCTION    **/
void fAdd(){
    int to_add;
    int f = 0; 

    for(int i = 0; user_list[i] != '\0'; i++){ //gets index
        ++f;
    }

    if(f == 10){
        printf("\nArray is full!\n\n");
    }
    else{
        printf("\nEnter value to add: ");
        scanf("%d", &to_add);               //input value to add

        user_list[f] = to_add;         //appends array with to_add
        printf("\nNew array state:\n");
        fPrint();
        ClearLine();
    }
}//closes add function

        /**     REMOVE FUNCTION   **/
void fRemove(){
    int to_remove;      //number to remove
    int i, j;
    int f = 0;
    int test;
    
    printf("\nEnter value to remove: ");
    scanf("%d", &to_remove);

    for(int i = 0; user_list[i] != '\0'; i++){ //gets index
        ++f;
    }
    
    for(i = 0; user_list[i] != '\0'; ++i){
        test = user_list[i];
        if( test == to_remove){
            break;
        } 
    }
    
    if(test != to_remove){
        printf("\n%d not found in array!\n\n", to_remove);
    }
    else{
        for(j = i; user_list[j] != '\0'; j++){     //shifts array after to_remove down one
            user_list[j] = user_list[j + 1];
        }
    
        user_list[f - 1] = 0;   //sets last index equal to 0
    
        printf("\nNew array state:\n");
        fPrint();
    }
    
}//closes remove function

        /**     PRINT FUNCTION    **/
void fPrint(){
    for(int i = 0; user_list[i] != '\0'; i++){
        printf("%d ", user_list[i] );
    }
    printf("\n\n");
}

        /**     STATS FUNCTION    **/
void fStats(){
    int i, j, index, temp2;
    int max = user_list[0];
    int min = user_list[0];
    int mid_low, mid_high, mid;   //low and high median for even index, and mid for odd index 
    double sum = 0.0;                     //sum off array
    
    for(j = 0; user_list[j] != '\0'; j++);
    index = j;

    int temp_array[index];              //initializing after finding length of array

    for(i = 0; i < index; ++i){     
        if(user_list[i] < min ) min = user_list[i]; //finds the min in the array
        if(user_list[i] > max) max = user_list[i];                     //finds the max in the array
        sum += user_list[i];                                           //finds the sum of the array for average calculation
        temp_array[i] = user_list[i];                                  //copies user_list to temp_array to manipulate temp_array to find median
    }
    
    for(int i = 0; i < index; i++){                   //sorts temp_array for median calculation
        for(int j = i + 1; j < index; j++){
            if(temp_array[i] > temp_array[j]){
                temp2 = temp_array[i];
                temp_array[i] = temp_array[j];
                temp_array[j] = temp2;
            }
        }
    }

   /**
    for(int i = 0; i < index; i++){
        printf("%d ", temp_array[i] );
    }
    printf("index = %d\n", index);
   **/

    if( index % 2 == 0){        //if index is even number, find the median here
        mid_low = (index - 1) / 2;
        mid_high = mid_low + 1;
        double median = ( temp_array[mid_high] + temp_array[mid_low] ) / 2.0;
        //printf("mid_low = %d\nmid_high = %d\n", temp_array[mid_low], temp_array[mid_high]);
        printf("\nMin = %d\nMax = %d\nAverage = %.2lf\nMedian = %.1lf\n\n", min, max, sum / index, median);    //results printout w/ median is double data type
    }
    else{                       //if the index is odd, the median is the middle number of the sorted temp_array
        mid = index / 2;
        int median = temp_array[mid];
        printf("\nMin = %d\nMax = %d\nAverage = %.2lf\nMedian = %d\n\n", min, max, sum / index, median);    //results printout w/ median is an int data type
    }
}

        /**     SORT FUNCTION    **/
void fSort(){
    int i, j, temp1;
    int f = 0;

    for(int i = 0; user_list[i] != '\0'; i++){
        ++f;
        //printf("f = %d\nuser_list[%d] = %d\n------\n", f, i, user_list[i]);
    }

    for(i = 0; i < f; i++){
        for(j = i + 1; j < f; j++){
            if(user_list[i] > user_list[j]){
                temp1 = user_list[i];
                user_list[i] = user_list[j];
                user_list[j] = temp1;
            }
        }
    }
    printf("\nNew array state:\n");
    fPrint();
}

void ClearLine(){
    char junk = 0;                                        
    while(junk != '\n'){
        scanf("%c", &junk);
    }
}
