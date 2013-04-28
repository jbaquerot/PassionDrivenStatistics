
libname mydata "/courses/u_coursera.org1/i_1006328/c_5333" access=readonly;


DATA new; SET mydata.gapminder_pds;

/*Data Munging*/
/*Creating INTERNETSCORE tabulating INTERNETUSERATE*/

/*IF INTERNETUSERATE < 0 THEN INTERNETSCORE = .;
ELSE IF INTERNETUSERATE < 3 THEN INTERNETSCORE = 0;
ELSE IF INTERNETUSERATE < 7.5 THEN INTERNETSCORE = 1;
ELSE IF INTERNETUSERATE < 12.33 THEN INTERNETSCORE = 2;
ELSE IF INTERNETUSERATE < 20 THEN INTERNETSCORE = 3;
ELSE IF INTERNETUSERATE < 31.5 THEN INTERNETSCORE = 4;
ELSE IF INTERNETUSERATE < 40.6 THEN INTERNETSCORE = 5;
ELSE IF INTERNETUSERATE < 49 THEN INTERNETSCORE = 6;
ELSE IF INTERNETUSERATE < 65.2 THEN INTERNETSCORE = 7;
ELSE IF INTERNETUSERATE < 78 THEN INTERNETSCORE = 8;
ELSE IF INTERNETUSERATE < 100 THEN INTERNETSCORE = 9;*/

IF INTERNETUSERATE < 0 THEN INTERNETSCORE = .;
ELSE IF INTERNETUSERATE < 7.5 THEN INTERNETSCORE = 0;
ELSE IF INTERNETUSERATE < 20 THEN INTERNETSCORE = 1;
ELSE IF INTERNETUSERATE < 40.6 THEN INTERNETSCORE = 2;
ELSE IF INTERNETUSERATE < 65.2 THEN INTERNETSCORE = 3;
ELSE IF INTERNETUSERATE < 100 THEN INTERNETSCORE = 4;




/* To see the association of POLICYSCORE and  INTERNETSCORE */
IF POLITYSCORE = . THEN POLITYSCORE2 = .;
ELSE IF POLITYSCORE <= -5 THEN POLITYSCORE2=0;
ELSE IF POLITYSCORE <= 0 THEN POLITYSCORE2=1;
ELSE IF POLITYSCORE <= 5 THEN POLITYSCORE2=2;
ELSE POLITYSCORE2=3;

/* New variable INCOMEPERPERSONRATE from INCOMEPERPERSON to moderate the ANOVA*/

IF INCOMEPERPERSON = . THEN INCOMEPERPERSONRATE = .;
ELSE IF INCOMEPERPERSON <= 744 THEN INCOMEPERPERSONRATE=0;
ELSE IF INCOMEPERPERSON <= 2550 THEN INCOMEPERPERSONRATE=1;
ELSE IF INCOMEPERPERSON <= 9425 THEN INCOMEPERPERSONRATE=2;
ELSE INCOMEPERPERSONRATE=3;


/* CHI SQUARE between INTERNETSCORE (Explanatory) and POLITYSCORE2 (Response) with INCOMEPERPERSONRATE Moderation*/

PROC SORT; BY INCOMEPERPERSONRATE;


/* CHI Square between  InternetScore(Explanatory) and  PolityScore2(Response)*/
PROC FREQ; TABLES POLITYSCORE2*INTERNETSCORE /CHISQ; BY INCOMEPERPERSONRATE;

run;


/* CHI Square between  InternetScore(Explanatory) and  PolityScore2(Response)
SUBSET: INTERNETSCORE=0 OR INTERNETSCORE=1
*/

DATA COMPARISON1; SET NEW;
IF INTERNETSCORE=0 OR INTERNETSCORE=1;
PROC SORT; BY INCOMEPERPERSONRATE;

PROC FREQ; TABLES POLITYSCORE2*INTERNETSCORE /CHISQ; BY INCOMEPERPERSONRATE;

RUN;

/* CHI Square between  InternetScore(Explanatory) and  PolityScore2(Response)
SUBSET: INTERNETSCORE=0 OR INTERNETSCORE=2
*/
DATA COMPARISON2; SET NEW;
IF INTERNETSCORE=0 OR INTERNETSCORE=2;
PROC SORT; BY INCOMEPERPERSONRATE;

PROC FREQ; TABLES POLITYSCORE2*INTERNETSCORE /CHISQ; BY INCOMEPERPERSONRATE;

RUN;


/* CHI Square between  InternetScore(Explanatory) and  PolityScore2(Response)
SUBSET: INTERNETSCORE=0 OR INTERNETSCORE=3
*/
DATA COMPARISON3; SET NEW;
IF INTERNETSCORE=0 OR INTERNETSCORE=3;
PROC SORT; BY INCOMEPERPERSONRATE;

PROC FREQ; TABLES POLITYSCORE2*INTERNETSCORE /CHISQ; BY INCOMEPERPERSONRATE;

RUN;


/* CHI Square between  InternetScore(Explanatory) and  PolityScore2(Response)
SUBSET: INTERNETSCORE=0 OR INTERNETSCORE=4
*/
DATA COMPARISON4; SET NEW;
IF INTERNETSCORE=0 OR INTERNETSCORE=4;
PROC SORT; BY INCOMEPERPERSONRATE;

PROC FREQ; TABLES POLITYSCORE2*INTERNETSCORE /CHISQ; BY INCOMEPERPERSONRATE;

RUN;

/* CHI Square between  InternetScore(Explanatory) and  PolityScore2(Response)
SUBSET: INTERNETSCORE=1 OR INTERNETSCORE=2
*/
DATA COMPARISON5; SET NEW;
IF INTERNETSCORE=1 OR INTERNETSCORE=2;
PROC SORT; BY INCOMEPERPERSONRATE;

PROC FREQ; TABLES POLITYSCORE2*INTERNETSCORE /CHISQ; BY INCOMEPERPERSONRATE;

RUN;

/* CHI Square between  InternetScore(Explanatory) and  PolityScore2(Response)
SUBSET: INTERNETSCORE=1 OR INTERNETSCORE=3
*/
DATA COMPARISON6; SET NEW;
IF INTERNETSCORE=1 OR INTERNETSCORE=3;
PROC SORT; BY INCOMEPERPERSONRATE;

PROC FREQ; TABLES POLITYSCORE2*INTERNETSCORE /CHISQ; BY INCOMEPERPERSONRATE;

RUN;

/* CHI Square between  InternetScore(Explanatory) and  PolityScore2(Response)
SUBSET: INTERNETSCORE=1 OR INTERNETSCORE=2
*/
DATA COMPARISON7; SET NEW;
IF INTERNETSCORE=1 OR INTERNETSCORE=4;
PROC SORT; BY INCOMEPERPERSONRATE;

PROC FREQ; TABLES POLITYSCORE2*INTERNETSCORE /CHISQ; BY INCOMEPERPERSONRATE;

RUN;

/* CHI Square between  InternetScore(Explanatory) and  PolityScore2(Response)
SUBSET: INTERNETSCORE=2 OR INTERNETSCORE=3
*/
DATA COMPARISON8; SET NEW;
IF INTERNETSCORE=2 OR INTERNETSCORE=3;
PROC SORT; BY INCOMEPERPERSONRATE;

PROC FREQ; TABLES POLITYSCORE2*INTERNETSCORE /CHISQ; BY INCOMEPERPERSONRATE;

RUN;


/* CHI Square between  InternetScore(Explanatory) and  PolityScore2(Response)
SUBSET: INTERNETSCORE=2 OR INTERNETSCORE=4
*/
DATA COMPARISON9; SET NEW;
IF INTERNETSCORE=2 OR INTERNETSCORE=4;
PROC SORT; BY INCOMEPERPERSONRATE;

PROC FREQ; TABLES POLITYSCORE2*INTERNETSCORE /CHISQ; BY INCOMEPERPERSONRATE;

RUN;

/* CHI Square between  InternetScore(Explanatory) and  PolityScore2(Response)
SUBSET: INTERNETSCORE=3 OR INTERNETSCORE=4
*/
DATA COMPARISON10; SET NEW;
IF INTERNETSCORE=3 OR INTERNETSCORE=4;
PROC SORT; BY INCOMEPERPERSONRATE;

PROC FREQ; TABLES POLITYSCORE2*INTERNETSCORE /CHISQ; BY INCOMEPERPERSONRATE;

RUN;
