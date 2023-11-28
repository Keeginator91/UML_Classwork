#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>


/***STEP 1: Prototype your GetCandF() function here***/
double GetCandF( double* k, double* c, double* f);

int main()
{
	double c, k, f;
	printf("Please enter a number in Kelvin: ");
	scanf("%lf", &k);

	/***STEP 2: call your GetCandF() function here***/
    GetCandF(&k, &c, &f);

	printf("%.2lf in Kelvin is %.2lf in Celsius and %.2lf in Fahrenheit.\n", k,c,f);
	return 0;
}


/***STEP 3: Define your GetCandF() function here***/
double GetCandF( double* k, double* c, double* f){
    *c = *k - 273.15;
    *f = (*k * 1.8) - 459.67;

    return 0; 
}