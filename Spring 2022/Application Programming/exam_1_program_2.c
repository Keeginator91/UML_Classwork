/*** Keegan Smith ***/

/*** 
 * FOLLOW THE DIRECTIONS IN THE COMMENTS BELOW. 
 * YOU MAY MODIFY THE PROGRAM FURTHER IF YOU WANT, BUT
 * I'VE (HOPEFULLY) PROVIDED YOU WITH A GOOD STARTING POINT 
 ***/

#include <stdio.h>

int main() {
	int n;				// scanf() return value
	int v1, v2, v3;	// Inputs
	int min, max;		// Minimum and maximum values

	printf("Enter 3 integers: ");
	n = scanf("%d %d %d", &v1, &v2, &v3 );

	if ( n != 3 ) {
        if (n == 0){
		printf("Formatting error with input #1\n" ); 
        } 
        else if (n == 1){
            printf("Formatting error with input #2\n" );
        }
        else {
            printf("Formatting error with input #3\n" );
        }
	}
	
    else {
        if ( v1 < v2 && v1 < v3 ){
            min = v1;
            if( v2 < v3) max = v3;
            else max = v2;
        }
        else if( v2 < v1 && v2 < v3 ){
            min = v2; 
            if(v1 < v3) max = v3;
            else max = v1;
        }
        else if( v3 < v1 && v3 < v2){
            min = v3;
            if(v2 < v1) max = v1;
            else max = v3;
        }
    
		printf("Original values: %d %d %d \n", v1, v2, v3);
		printf("Max: %d\n", max);
		printf("Min: %d\n", min);
	}
	
	return 0;
}