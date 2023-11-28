#include <stdio.h>
#include <lab_8_10.c>


int main() {

   //Defining loop index and list of cars
	int i;	
	CarInfo cars[NUMCARS]; 

   //Reading list of cars
	for (i = 0; i < NUMCARS; i++)
	{
		printf("\nNow reading info for car #%d...\n", i);
		/**Call readCarInfo function here*/
		readCarInfo( &cars[i] );
	}

   //Printing list of cars and the total/raw weight of each
	for (i = 0; i < NUMCARS; i++)
	{
		/**Uncomment and complete the following line with the make and model of the car*/
		printf("\n\nCar #%d (%s %s) info:\n", i, cars[i].make, cars[i].model );
		printf("Passengers:\n");
		
		/**Call printPassengerList function here */
		printPassengerList( cars[i]->people[numPeople.CarInfo] );

      /**Uncomment and complete the following two lines*/
		printf("\nCar #%d total weight (with passengers) is %.2lf lbs.\n", i, getTotalCarWeight( cars[i] ) );
		printf("Car #%d raw weight is %.2lf lbs.\n", i, cars[i].weight );
	}
	return 0;
}



/***

CarInfo[ Car[0] , car[1] , car[2] ]
car[1] = [ make, model, weight, numPeople , people[numPeople] ]
people[] = [ first name , last name , weight ]


Car1 = [ make , model , weight , numPeople, { first1 , last1 , weight1 }
											{ first2 , last2 , weight2 }
											so on...
]

so,




***/