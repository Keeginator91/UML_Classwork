#include <stdio.h>

int main(void) {
   int arrowBaseHeight;
   int arrowBaseWidth = 1;
   int arrowHeadWidth = 0;
   

    printf("Enter arrow base height:\n");
    scanf("%d", &arrowBaseHeight);
        
    printf("Enter arrow base width:\n");
    scanf("%d", &arrowBaseWidth);
       
    while( arrowHeadWidth <= arrowBaseWidth ){
    
        printf("Enter arrow head width:\n");
        scanf("%d", &arrowHeadWidth);
    }
    
    printf("\n");
   
   for(int i = 1; i <= arrowBaseHeight; i++){
        for (int i = 0; i < arrowBaseWidth; i++)
        {
             printf("*");    
        }
        printf("\n");
        }

    while( arrowHeadWidth > 0){

        for (int j = arrowHeadWidth; j > 0 ; j--){
            printf("*");
        }

        printf("\n");
        arrowHeadWidth -= 1;
    }

   return 0;
}