/**** Keegan Smith
 * Application programming Program 2
 * This program will calculate the surface area and volume of a sphere, cone, and triangular prism ****/


#define _CRT_SECURE_NO_WARNINGS  // Necessary in Visual Studio (but not zyBooks) to remove scanf() warning
#include <stdio.h>

#define _USE_MATH_DEFINES		// Necessary in Visual Studio (but not zyBooks) for M_PI
#include <math.h>

int main() {
   
   //variable declarations
   double sphere_r; //sphere radius
   double cone_b; //cone base
   double cone_r; //cone radius
   double cone_h; //cone height
   double prism_w; // prism width
   double prism_l; //prism length
   double prism_h; //prims height
   double prism_c; // hypotanuse of triangle
   
   //sphere info
   printf("Enter radius of the sphere:");
   scanf("%lf", &sphere_r);

    //cone into
    printf("Enter base, radius, and height of the cone:");
    scanf("%lf %lf %lf", &cone_b, &cone_r, &cone_h);

    //prism info
    prinf("Enter width, length, and height of the cone:")

   
   
   prism_c = sqrt( pow(prism_h) + pow( 0.5 * prism_b));    //finding hypanuse of triangle

   
   
   
   
   return 0;
}