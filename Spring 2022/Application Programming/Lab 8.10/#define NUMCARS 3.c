#define NUMCARS 3

typedef struct {
	char first[50];
	char last[50];
	double weight;
}Person;

typedef struct {
	char make[50];
	char model[50];
	double weight;
	int numPeople;
	Person people[10];
}CarInfo;

//Function prototypes
void readCarInfo(CarInfo* c); //Prompt user for car info and read it in
void readPassengerInfo(Person* p); //Prompt user for info on a single person
double getTotalCarWeight(CarInfo* c); //Returns the weight of the car + the weight of all passengers
void printPassengerList(CarInfo* c); //Prints a list of all passengers in a car
