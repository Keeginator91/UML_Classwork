
void readCarInfo(CarInfo* c)
{
   //This function requests and reads the info on a single car from the user
	int i;
	
   /**Uncomment and complete the following scanf() lines*/
	printf("Enter car make: ");
	scanf("%s", &c->make);

	printf("Enter car model: ");	
	scanf("%s", &c->model);

	printf("Enter car weight: ");
   scanf("%lf", &c->weight);

	printf("How many passengers? ");
	scanf("%d",&c->numPeople);

   /**Uncomment and complete the loop condition to loop through all the people in the car*/
	for (i = 0;  i < numPeople; i++)
	{
		printf("For passenger #%d...\n", i);
		/**Call readPassengerInfo here*/
		readPassengerInfo(people[i]);
	}

}

void readPassengerInfo(Person* p)
{
   //This function prompts for and reads information on a single person from the user

	
	/**Uncomment and fill scanf statements to read in the passenger info. You may assume the names have no whitespace*/
	printf("Enter first name: ");
	scanf("%s", &p->first);

	printf("Enter last name: ");
    scanf("%s", &p->last);

	printf("Enter weight: ");
	scanf("%lf", &p->weight);

}

double getTotalCarWeight(CarInfo* c)
{
   //This function returns the weight of a single car plus the weight of all people in the car 
   //Note that it should NOT modify the weight of the car itself, but should merely return the total
	
	double totW;
	int i;

   /**Add the car's weight to the total */
   totW = c.weight ;
	
	/*Uncomment the loop condition and complete to loop through all the people*/
	for (i = 0; i < c.numPeople ; i++)
	{
	   /**Sum each passenger's weight here*/
		totW += people[i].weight ;
	}
	return totW;
}

void printPassengerList(CarInfo* c)
{
   //This function lists the name and weight of all passengers in a single car
	int i;

	/**Uncomment the loop condition and complete to loop through all the people*/
	for (i = 0; i < c.numPeople; i++)
	{
		/**Uncomment and complete the following printf statement with the first name, last name, and weight*/
		printf("Passenger #%d: %s %s, %.2lf lbs.\n", i, people[i].first, people[i].last, people[i].weight );
	}
}