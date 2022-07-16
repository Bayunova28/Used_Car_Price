/*---------------------------------------------------------
  The options statement below should be placed
  before the data step when submitting this code.
---------------------------------------------------------*/
options VALIDMEMNAME=EXTEND VALIDVARNAME=ANY;
   /*------------------------------------------
   Generated SAS Scoring Code
     Date             : 16Jul2022:15:58:26
     Locale           : en_US
     Model Type       : Generalized Linear Model
     Interval variable: price
     Interval variable: horsepower
     Interval variable: boreratio
     Interval variable: car_ID
     Interval variable: carheight
     Interval variable: carlength
     Interval variable: carwidth
     Interval variable: citympg
     Interval variable: compressionratio
     Interval variable: curbweight
     Interval variable: enginesize
     Interval variable: highwaympg
     Interval variable: peakrpm
     Interval variable: stroke
     Interval variable: symboling
     Interval variable: wheelbase
     Class variable   : fueltype
     Response variable: price
     Distribution     : Normal
     Link Function    : Identity
     ------------------------------------------*/
   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 16Jul2022:15:58:26
     -------------------------------------------------------*/

   /*---------------------------------------------------------
   Defining temporary arrays and variables   
     -------------------------------------------------------*/
   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;
   drop MACLOGBIG;
   MACLOGBIG= 7.0978271289338392e+02;

   array _xrow_50_0_{18} _temporary_;
   array _beta_50_0_{18} _temporary_ (   -59304.6864719686
           5826.67798975351
                          0
           52.1242987066177
           281.787887357358
          -19.8119731940329
           290.644789642663
          -47.0167460705048
           461.776447372511
          -187.134909554866
          -152.555713987607
           3.49687659143562
            92.389628008577
           264.195414172949
           2.33950649129393
          -3339.21338537372
           88.4270453683075
           59.9972340308175);

   length _fueltype_ $6; drop _fueltype_;
   _fueltype_ = left(trim(put(fueltype,$6.)));
   /*------------------------------------------*/
   /*Missing values in model variables result  */
   /*in missing values for the prediction.     */
   if missing(car_ID) 
      or missing(carheight) 
      or missing(compressionratio) 
      or missing(symboling) 
      or missing(highwaympg) 
      or missing(enginesize) 
      or missing(carwidth) 
      or missing(citympg) 
      or missing(horsepower) 
      or missing(peakrpm) 
      or missing(curbweight) 
      or missing(stroke) 
      or missing(carlength) 
      or missing(boreratio) 
      or missing(wheelbase) 
      then do;
         _badval_ = 1;
         goto skip_50_0;
   end;
   /*------------------------------------------*/

   do _i_=1 to 18; _xrow_50_0_{_i_} = 0; end;

   _xrow_50_0_[1] = 1;

   _temp_ = 1;
   select (_fueltype_);
      when ('diesel') _xrow_50_0_[2] = _temp_;
      when ('gas') _xrow_50_0_[3] = _temp_;
      otherwise do; _badval_ = 1; goto skip_50_0; end;
   end;

   _xrow_50_0_[4] = horsepower;

   _xrow_50_0_[5] = boreratio;

   _xrow_50_0_[6] = car_ID;

   _xrow_50_0_[7] = carheight;

   _xrow_50_0_[8] = carlength;

   _xrow_50_0_[9] = carwidth;

   _xrow_50_0_[10] = citympg;

   _xrow_50_0_[11] = compressionratio;

   _xrow_50_0_[12] = curbweight;

   _xrow_50_0_[13] = enginesize;

   _xrow_50_0_[14] = highwaympg;

   _xrow_50_0_[15] = peakrpm;

   _xrow_50_0_[16] = stroke;

   _xrow_50_0_[17] = symboling;

   _xrow_50_0_[18] = wheelbase;

   do _i_=1 to 18;
      _linp_ + _xrow_50_0_{_i_} * _beta_50_0_{_i_};
   end;

   skip_50_0:
   label P_price = 'Predicted: price';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      P_price = _linp_;
   end; else do;
      _linp_ = .;
      P_price = .;
   end;
   /*------------------------------------------*/
   /*_VA_DROP*/ drop 'P_price'n;
      'P_price_50'n='P_price'n;
   /*------------------------------------------*/