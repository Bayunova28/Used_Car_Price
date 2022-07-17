/* Read folder file */
libname mydata base "/home/u60033390/Retail";

/* Load & import dataset */
filename refile "/home/u60033390/Retail/CarPrice_Assignment.csv";

proc import datafile=refile
	dbms=csv
	out=mydata.car_price;
	getnames=yes;
run;

/* Show 5 rows ahead of dataset */
title "Car Price Dataset";
proc print data=mydata.car_price(obs=5);
run;

/* Describe the dataset */
title "Dataset Description";
proc contents data=mydata.car_price;
run;

/* Set dataset name original to new dataset storage */
data work.test;
	set mydata.car_price;
run;

data test;
	set mydata.car_price;
run;
