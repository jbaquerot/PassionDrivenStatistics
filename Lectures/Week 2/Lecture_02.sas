
libname mydata "/courses/u_coursera.org1/i_1006328/c_5333" access=readonly;

DATA new; SET mydata.addhealth_pds;
/*
DATA new; SET mydata.gapminder_pds;
*/

/*recode missing data*/
IF H1GI4 gt 1 then H1GI4 = .;
IF H1GI6A gt 1 then H1GI6A = .;
IF H1GI6B gt 1 then H1GI6B = .;
IF H1GI6C gt 1 then H1GI6C = .;
IF H1GI6D gt 1 then H1GI6D = .;

NUMETMNIC = SUM ( of M1GI4 H1GI6A H1GI6B H1GI6C H1GI6D );

IF NUMETMIC GE 2 THEN ETHNICITY = 1; /*Multiple race/ethinity endorsed*/
ELSE IF H1GI4 = 1 THEN ETHNICITY = 2; /*Hispanic o Latino*/
ELSE IF H1GI6B = 1 THEN ETHNICITY = 3; /*Black or African American*/
ELSE IF H1GI6C = 1 THEN ETHNICITY = 4; /*American Indian or Native American*/
ELSE IF H1GI6D = 1 THEN ETHNICITY = 5; /*Asian or Pacific Islander*/
ELSE IF H1GI6A = 1 THEN ETHNICITY = 6; /*White*/



PROC SORT; BY AID;
/*
PROC SORT; BY country;
*/

PROC PRINT; VAR H1GI4 H1GI6A H1GI6B H1GI6C H1GI6D NUMETMIC ETHNICITY;

PROC FREQ; TABLES H1GI4 H1GI6A H1GI6B H1GI6C H1GI6D NUMETMIC ETHNICITY;

run;