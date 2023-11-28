/********************
 *                  *
 * prog_functions.h *
 *                  *
 * *****************/

/**********************************************
	EECE.2160: ECE Application Programming
	UMass Lowell
	Header file for Prog 5
	Tests ability to write and use functions
 ***********************************************/

// Lines used for conditional compilation--ensures header isn't included multiple times
#ifndef prog5_functions_h
#define prog5_functions_h

double GetPiggyBankMoney();

double GetNewAmount(double principal, double rate, int years);

void ClearLine();

#endif /* More conditional compilation--end of prog5_functions_h */