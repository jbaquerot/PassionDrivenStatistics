
libname mydata "/courses/u_coursera.org1/i_1006328/c_5333" access=readonly;

DATA new; SET mydata.nesarc_pds;
/*
DATA new; SET mydata.gapminder_pds;
*/
LABEL tab12mdx="Tabacco Dependence in the last 12 months"
	CHECK321="Smoked Cigarettes in the past 12 months"
	S3AQ3B1="Usual Smoking Frequency"
	S3AQ3C1="Usual Smoking Quantity";

/*Subsetting the data to include only past 12 month smokers, age 18-25*/
IF CHECK321 = 1;
IF AGE LE 25;

PROC SORT; BY IDNUM;
/*
PROC SORT; BY country;
*/

PROC FREQ; TABLES tab12mdx CHECK321 S3AQ3B1 S3AQ3C1 AGE;

run;