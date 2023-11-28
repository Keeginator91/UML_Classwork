/*******************************************************
 * EECE.2160: ECE Application Programming
 * Keegan Smith
 * Student solution to Spring 2021 Exam 1, Program 1
 * Tests knowledge of basic I/O and formatting by asking
 *    users to enter some simple stats and weights and
 *    calculate a weighted average based on those data
 *******************************************************/

#include <stdio.h>

int main() {
	double examAvg, actAvg, labAvg, progAvg;	   // Averages for each category (exams, activities, labs, programs)
	double eWeight, aWeight, lWeight, pWeight;	// Weights assigned to each category (in %)
    double total_weight = -1;

	printf("Enter averages for exams, activities, labs, and programs: ");
	scanf("%lf %lf %lf %lf", &examAvg, &actAvg, &labAvg, &progAvg);

	printf("\nEnter weights assigned to each category (as a percentage): ");
	scanf("%lf %lf %lf %lf", &eWeight, &aWeight, &lWeight, &pWeight);

    total_weight = ( (eWeight / 100) * examAvg) + ( (aWeight / 100) * actAvg) + ( (lWeight / 100) * labAvg) + ( (pWeight / 100) * progAvg); 

	printf("\nClass statistics:\n");
   /* COMPLETE EACH LINE BELOW SO THAT:
        1. Each string includes the appropriate format specifiers and missing characters
        2. Add a list of values to be printed */
	printf("Exam average (%.0lf%%): %.2lf\n", eWeight, examAvg);
	printf("Activities average (%.0lf%%): %.2lf\n", aWeight, actAvg);
	printf("Labs average (%.0lf%%): %.2lf\n", lWeight, labAvg);
	printf("Program average (%.0lf%%): %.2lf\n", pWeight, progAvg);
	printf("Overall weighted average: %.2lf\n", total_weight );
	return 0;
}