libname mydata "/courses/u_coursera.org1/i_1006328/c_5333" access=readonly;

DATA new; SET mydata.nesarc_pds;

LABEL tab12mdx="Tabacco Dependence in the last 12 months"
	CHECK321="Smoked Cigarettes in the past 12 months"
	S3AQ3B1="Usual Smoking Frequency"
	S3AQ3C1="Usual Smoking Quantity";

IF S3AQ3B1 = 9 THEN S3AQ3B1 = .;
IF S3AQ3C1 = 99 THEN S3AQ3C1 = .;

IF S3AQ3B1 = 1 THEN USFREQMO = 30;
ELSE IF S3AQ3B1 = 2 THEN USFREQMO = 22;
ELSE IF S3AQ3B1 = 3 THEN USFREQMO = 14;
ELSE IF S3AQ3B1 = 4 THEN USFREQMO = 5;
ELSE IF S3AQ3B1 = 5 THEN USFREQMO = 2.5;
ELSE IF S3AQ3B1 = 6 THEN USFREQMO = 1;

NUMCIGMO_EST = USFREQMO * S3AQ3C1;

/*Subsetting the data to include only past 12 month smokers, age 18-25*/
IF CHECK321 = 1;
IF AGE LE 25;

PROC SORT; BY IDNUM;

PROC UNIVARIATE; VAR NUMCIGMO_EST;

/*PROC PRINT; VAR USFREQMO S3AQ3C1 NUMCIGMO_EST;*/

PROC FREQ; TABLES NUMCIGMO_EST /*USFREQMO*/ tab12mdx /*CHECK321 S3AQ3B1 S3AQ3C1 /*AGE*/;

run;