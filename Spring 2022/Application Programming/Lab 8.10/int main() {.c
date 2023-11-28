int main() {

   //Defining loop index and list of cars
	int i;	
	CarInfo cars[NUMCARS]; 

   //Reading list of cars
	for (i = 0; i < NUMCARS; i++)
	{
		printf("\nNow reading info for car #%d...\n", i);
		/**Call readCarInfo function here*/
		readCarInfo(cars[i]);
	}

   //Printing list of cars and the total/raw weight of each
	for (i = 0; i < NUMCARS; i++)
	{
		/**Uncomment and complete the following line with the make and model of the car*/
		printf("\n\nCar #%d (%s %s) info:\n", i, cars[i].make, cars[i].model);
		printf("Passengers:\n");
		
		/**Call printPassengerList function here */
		printPassengerList(CarInfo.people[i]);

      /**Uncomment and complete the following two lines*/
      
		printf("\nCar #%d total weight (with passengers) is %.2lf lbs.\n",i,  getTotalCarWeight(cars[i])   );
		printf("Car #%d raw weight is %.2lf lbs.\n", i, car[i].weight );
	}
	
	return 0;
}
