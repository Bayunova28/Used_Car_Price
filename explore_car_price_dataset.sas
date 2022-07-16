/* Descriptive statistics of dataset */
title "Descriptive Statistics";
proc means data=mydata.car_price mean median mode std var min max;
run;

/* Check univariate of price values */
proc univariate data=mydata.car_price;
	var price;
run;

/* Check missing values */
title "Missing of Numeric Values";
proc means data=mydata.car_price nmiss;
run;

/* Check correlation of each variables */
proc corr data=mydata.car_price;
	var symboling wheelbase carlength carwidth carheight curbweight enginesize boreratio stroke compressionratio horsepower peakrpm citympg highwaympg price;
	title "Correlation Matrix";
run;

/* Check count variable unique of each columns */
title "Variable Uniques";
proc sql;
	select count(distinct 'CarName'n) as 'Car Name'n,
		   count(distinct 'fueltype'n) as 'Fuel Type'n,
		   count(distinct 'aspiration'n) as 'Aspiration'n,
		   count(distinct 'doornumber'n) as 'Door Number'n,
		   count(distinct 'carbody'n) as 'Car Body'n,
		   count(distinct 'drivewheel'n) as 'Drive Wheel'n,
		   count(distinct 'enginelocation'n) as 'Engine Location'n,
		   count(distinct 'enginetype'n) as 'Engine Type'n,
		   count(distinct 'cylindernumber'n) as 'Cylinder Number'n,
		   count(distinct 'fuelsystem'n) as 'Fuel System'n
	from mydata.car_price;
quit;

/* Visualize fuel type by price */
title "Fuel Type by Price";
proc gchart data=mydata.car_price;
	pie fueltype / type=sum sumvar=price detail_percent=best detail_value=none detail_slice=best;
run;
quit;

/* Visualize aspiration by price */
title "Aspiration by Price";
proc gchart data=mydata.car_price;
	pie aspiration / type=sum sumvar=price detail_percent=best detail_value=none detail_slice=best;
run;
quit;

/* Visualize door number by price */
title "Door Number by Price";
proc gchart data=mydata.car_price;
	pie doornumber / type=sum sumvar=price detail_percent=best detail_value=none detail_slice=best;
run;
quit;

/* Visualize car body by price */
title "Car Body by Price";
proc gchart data=mydata.car_price;
	vbar carbody / type=sum sumvar=price descending outside=sum width=15;
run;
quit;

/* Visualize drive wheel by price */
title "Drive Wheel by Price";
proc gchart data=mydata.car_price;
	pie drivewheel / type=sum sumvar=price detail_percent=best detail_value=none detail_slice=best;
run;
quit;

/* Visualize engine location by price */
title "Engine Location by Price";
proc gchart data=mydata.car_price;
	pie enginelocation / type=sum sumvar=price detail_percent=best detail_value=none detail_slice=best;
run;
quit;

/* Visualize engine type by price */
title "Engine Type by Price";
proc gchart data=mydata.car_price;
	hbar enginetype / type=sum sumvar=price descending outside=sum;
run;
quit;

/* Visualize cylinder number by price */
title "Cylinder Number by Price";
proc gchart data=mydata.car_price;
	hbar cylindernumber / type=sum sumvar=price descending outside=sum;
run;
quit;

/* Visualize fuel system by price */
title "Fuel System by Price";
proc gchart data=mydata.car_price;
	hbar fuelsystem / type=sum sumvar=price descending outside=sum;
run;
quit;