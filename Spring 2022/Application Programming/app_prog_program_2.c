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
 
   double sphere_sa; //sphere surface area
   double sphere_v; //sphere volume

   double cone_br; //cone base radius
   double cone_h; //cone height
  
   double cone_sa; //cone surface area
   double cone_v; //cone volume

   double prism_w; // prism width
   double prism_l; //prism length
   double prism_h; //prims height
   double prism_c; // hypotanuse of triangle
  
   double prism_sa; //prism surface area
   double prism_v; //prism volume
   
   //sphere info
   printf("Enter sphere radius (cm):\n");
   scanf("%lf", &sphere_r);

    //cone into
    printf("Enter base radius and height of cone (cm):\n");
    scanf("%lf %lf", &cone_br, &cone_h);

    //prism info
    printf("Enter base width, length, and height of triangular prism (cm):\n");
    scanf("%lf %lf %lf", &prism_w, &prism_l, &prism_h);
    prism_c = sqrt( pow(prism_h, 2) + pow( (0.5 * prism_w) , 2) );    //finding hypanuse of triangle
    
    //sphere calculations
    sphere_sa = 4 * M_PI * pow(sphere_r, 2); //surface area of sphere
    sphere_v = (4.0/3) * M_PI * pow(sphere_r, 3); //volume of sphere

    //cone calculations
    cone_sa = M_PI * cone_br * (cone_br + sqrt( pow(cone_h, 2) + pow(cone_br, 2)  ) ); //cone surface area
    cone_v = M_PI * pow(cone_br, 2) * ( cone_h / 3); //cone volume

    //prism calculations
    
    prism_sa = (prism_w * prism_h ) + (prism_w + prism_c + prism_c )  * prism_l ; //prism surface area
   
    prism_v = ( (1.0/4) * prism_l ) * sqrt( - ( pow(prism_w, 4) ) + ( 2 * pow( (prism_w * prism_c) , 2) ) + ( 2 * pow( (prism_c * prism_w) , 2) ) - pow( prism_c , 4) + ( 2 * pow( (prism_c * prism_c) , 2) ) - pow( prism_c, 4)  ); // prism volume
    //volume= (  1/4    * length  ) * sqrt( -    base width^4     +   2 *  (base width * hypotanuse)^2    + ( 2 * (base width * hypotanuse)^2   ) -    hypotanuse^4   +   2 * ( hypotanuse * hypotanuse)^2    - hypotanuse^4 )    )


   //printing out all the information all pretty like
    printf("\nSphere information:\nRadius = %.2lf cm\nSurface area = %.4lf square cm\nVolume = %.4lf cubic cm\n", sphere_r, sphere_sa, sphere_v); //sphere information printout

    printf("\nCone information:\nBase radius = %.2lf cm\nHeight = %.2lf cm\nSurface area = %.4lf square cm\nVolume = %.4lf cubic cm\n", cone_br, cone_h, cone_sa, cone_v); //cone information printout

    printf("\nPrism information:\nBase width = %.2lf cm\nLength = %.2lf cm\nHeight = %.2lf cm\nSurface area = %.4lf square cm\nVolume =  %.4lf cubic cm\n", prism_w, prism_l, prism_h, prism_sa, prism_v);
   
   return 0;
}