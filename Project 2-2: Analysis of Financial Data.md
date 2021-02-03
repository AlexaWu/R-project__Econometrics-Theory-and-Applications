## Project Contents

>use 5% level when determining significance

**_1. Linear Model Analysis of Vanguard Total Stock Market Index Fund_**

A. Test monthly log returns for autocorrelation
- Use a t-test to check whether lag 1 is significant 
- Use a t-test to check whether lag 2 is significant 
- Use Ljung-Box Q(m) statistics to test whether ACF is significant
    - Apply m = 12
    - Apply m = ln(T)

B. Autoregressive model
- Use PACF to determine AR order
- Run appropriate AR model
    > Reasonable people can disagree on the best order of these models – just make sure to justify your choice
- Check AR model for stationarity

C. Moving average model
- Use ACF to determine appropriate MA order
- Fit the appropriate MA model
    > Reasonable people can disagree on the best order of these models – just make sure to justify your choice

**_2. Modeling Volatility for Amazon, Inc._**

A. Test log returns for autocorrelation
- Check ACF for significance
- Apply Ljung-Box Q(12) statistic to test whether ACF is significant

B. Test absolute value of log returns for dependence 
- Check ACF for significant lags
- Apply Ljung-Box Q(12) statistic to test whether ACF is significant

C. Test squared series of log returns for dependence 
- Check ACF for significant lags
- Apply Ljung-Box Q(12) statistic to test whether ACF is significant
  
D. Test for ARCH effects
- Calculate mean-adjusted log returns
- Apply Ljung-Box Q(12) statistic to test whether ACF for the square of mean-adjusted log returns is significant
- Apply Lagrange Multiplier test (12 lags) 

E. Build an ARCH model 
- Compute the PACF of the square of mean-adjusted log returns – check for significant lags
- Compute the ACF of the square of mean-adjusted log returns – check for significant lags
- Fit an ARCH(1) model (normally-distributed innovations)
- Fit an ARCH(1) model (Student’s T-distributed innovations)


## R Code and Output

Explore in table: [Project 2-2.xlsx](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/tables/Project%202-2.xlsx)

Part I.A Test monthly log returns for autocorrelation
```javascript
> getwd()							
[1] "C:/Users/Alexa~Chutian/Documents"							
> setwd("C:/#Baruch/Econometrics/Projects")							
> Monthly=read.csv("Monthly.csv")							
> attach(Monthly)							
#Test monthly log returns for autocorrelation							
> names(Monthly)							
[1] "X"     "VTSMX" "AMZN" 							
> acf(VTSMX)							
> acf(VTSMX, lag=10)							
> f1=acf(VTSMX)	

#Use a t-test to check whether lag 1 is significant 							
> t1=f1$acf[2]*sqrt(length(VTSMX))							
> t1							
[1] 1.700604

#Use a t-test to check whether lag 2 is significant 							
> t2= f1$acf[3]*sqrt(length(VTSMX))							
> t2							
[1] -0.3979368

#Use Ljung-Box Q(m) statistics to test whether ACF is significant							
#Apply m=12							
> Box.test(VTSMX, lag=12, type='Ljung')							
							
	Box-Ljung test						
							
data:  VTSMX							
X-squared = 24.202, df = 12, p-value = 0.01909							
#Apply m = ln(T)							
> Box.test(VTSMX, lag=log(length(VTSMX)), type='Ljung')							
							
	Box-Ljung test						
							
data:  VTSMX							
X-squared = 10.961, df = 4.5643, p-value = 0.0398							
```

Part I.B Autoregressive model
```javascript			
#Use PACF to determine AR order				
> pacf(VTSMX, lag=12)				
> pacf(VTSMX, lag=12, plot=FALSE)				
				
Partial autocorrelations of series ‘VTSMX’, by lag				
				
     1      2      3      4      5      6      7      8      9     10     11 				
 0.174 -0.073  0.206  0.147 -0.092 -0.262 -0.072  0.133 -0.063  0.030 -0.014 				
12				
-0.004

#Run appropriate AR model				
> mm1=ar(VTSMX,method='mle')				
> mm1$order				
[1] 6				
> install.packages("FitAR")				
--- Please select a CRAN mirror for use in this session ---				
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/el-capitan/contrib/3.4/FitAR_1.94.tgz'				
Content type 'application/x-gzip' length 1294162 bytes (1.2 MB)				
==================================================				
downloaded 1.2 MB				
				
				
The downloaded binary packages are in				
	/var/folders/24/1d3l64796nq2rnpx1pm58n140000gn/T//RtmpA1pbWC/downloaded_packages			
> library(FitAR)				
Loading required package: lattice				
Loading required package: leaps				
Loading required package: ltsa				
Loading required package: bestglm				
> SelectModel(VTSMX,lag.max=12,ARModel="AR",Best=1, Criterion="AIC")				
[1] 6				
> SelectModel(VTSMX,lag.max=12,ARModel="AR",Best=12, Criterion="AIC")				
    p AIC-Exact  AIC-Approx				
1   6 -582.9613 -3.64221136				
2   8 -581.9454 -2.65597963				
3   7 -581.4726 -4.33896388				
4   9 -580.2386 -0.66381827				
5   4 -578.3488  1.08596530				
6   3 -578.2617  0.05446215				
7  10 -578.2441  1.33450447				
8   1 -577.6194  2.50663305				
9   5 -577.2662 -5.09587006				
10  0 -576.6666  1.01611472				
11 11 -576.2458  3.26462001				
12  2 -576.1184  0.23096097				
> SelectModel(VTSMX,lag.max=12,ARModel="AR",Best=1, Criterion="BIC")				
[1] 0				
> SelectModel(VTSMX,lag.max=12,ARModel="AR",Best=12, Criterion="BIC")				
    p BIC-Exact BIC-Approx				
1   0 -574.1022   6.144811				
2   1 -572.4907  10.199678				
3   2 -568.4253  10.488354				
4   3 -568.0043  12.876203				
5   4 -565.5271  16.472054				
6   6 -565.0109  16.872574				
7   5 -561.8801  12.854567				
8   7 -560.9579  18.740170				
9   8 -558.8663  22.987502				
10  9 -554.5951  27.544012				
11 10 -550.0363  32.106683				
12 11 -545.4736  36.601147				
> arima(VTSMX, order=c(6,0,0))				
				
Call:				
arima(x = VTSMX, order = c(6, 0, 0))				
				
Coefficients:				
         ar1      ar2     ar3     ar4      ar5      ar6  intercept				
      0.1471  -0.0291  0.2157  0.1576  -0.0444  -0.2860     0.0043				
s.e.  0.0982   0.0982  0.0989  0.0983   0.1002   0.1003     0.0054				
				
sigma^2 estimated as 0.001975:  log likelihood = 162.26,  aic = -308.53

#Check your AR model for stationarity				
> install.packages("fUnitRoots")				
Warning message:				
package ‘fUnitRoots’ is not available (for R version 3.4.0) 				
> adfTest(VTSMX,lags=6,type=c("c"))				
Error in adfTest(VTSMX, lags = 6, type = c("c")) : 				
  could not find function "adfTest"				
```

Part I.C Moving average model
```javascript
#Use ACF to determine appropriate MA order 				
> acf(VTSMX,lag=12,plot=FALSE)				
				
Autocorrelations of series ‘VTSMX’, by lag				
				
     0      1      2      3      4      5      6      7      8      9     10 				
 1.000  0.174 -0.041  0.179  0.212 -0.045 -0.252 -0.073  0.122 -0.129 -0.125 				
    11     12 				
 0.027  0.075 				
> acf(VTSMX,lag=12)				
> SE=1/(sqrt(length(VTSMX)))				
> 2*SE				
[1] 0.2041241

#Fit the appropriate MA model 				
> arima(VTSMX,order=c(0,0,6))				
				
Call:				
arima(x = VTSMX, order = c(0, 0, 6))				
				
Coefficients:				
         ma1     ma2     ma3     ma4      ma5      ma6  intercept				
      0.1175  0.0255  0.2374  0.2056  -0.0388  -0.2093     0.0040				
s.e.  0.0999  0.1035  0.1097  0.0967   0.1111   0.1153     0.0061				
				
sigma^2 estimated as 0.002026:  log likelihood = 161.08,  aic = -306.17				
```

Part II.A Test log returns for autocorrelation
```javascript
#Check ACF for significance							
> acf(AMZN, lag=12, plot=FALSE)							
							
Autocorrelations of series ‘AMZN’, by lag							
							
     0      1      2      3      4      5      6      7      8      9     10 							
 1.000  0.155 -0.124 -0.062 -0.128  0.047 -0.028 -0.158  0.094  0.214  0.067 							
    11     12 							
-0.249							
> acf(AMZN, lag=12)

#Apply Ljung-Box Q(12) statistic to test whether ACF is significant							
> Box.test(AMZN,lag=12,type='Ljung')							
							
	Box-Ljung test						
							
data:  AMZN							
X-squared = 20.955, df = 12, p-value = 0.05105							
```

Part II.B Test absolute value of log returns for dependence
```javascript
#Check ACF for significant lags 	
> acf(abs(AMZN), lag=12, plot=FALSE)	
	
Autocorrelations of series ‘abs(AMZN)’, by lag	
	
     0      1      2      3      4      5      6      7      8      9     10 	
 1.000  0.280  0.048  0.178 -0.032 -0.082 -0.004 -0.030  0.022  0.135  0.206 	
    11     12 	
 0.224  0.130 	
> acf(abs(AMZN), lag=12)

#Apply Ljung-Box Q(12) statistic to test whether ACF is significant 	
> Box.test(abs(AMZN), lag=12, type='Ljung')	
	
	Box-Ljung test
	
data:  abs(AMZN)	
X-squared = 26.198, df = 12, p-value = 0.01006	
```

Part II.C Test squared series of log returns for dependence
```javascript
#Check ACF for significant lags 	
> acf((AMZN^2), lag=12, plot=FALSE)	
	
Autocorrelations of series ‘(AMZN^2)’, by lag	
	
     0      1      2      3      4      5      6      7      8      9     10 	
 1.000  0.349  0.027  0.091 -0.064 -0.070 -0.034 -0.053  0.029  0.160  0.248 	
    11     12 	
 0.362  0.165 	
> acf((AMZN^2), lag=12	

#Apply Ljung-Box Q(12) statistic to test whether ACF is significant 	
> Box.test((AMZN^2), lag=12, type='Ljung')	
	
	Box-Ljung test
	
data:  (AMZN^2)	
X-squared = 41.516, df = 12, p-value = 4.016e-05	
```

Part II.D Test for ARCH effects
```javascript
#Calculate mean-adjusted log returns	
> y= AMZN-mean(AMZN)	
> acf(y,lag=12, plot=FALSE)	
	
Autocorrelations of series ‘y’, by lag	
	
     0      1      2      3      4      5      6      7      8      9     10 	
 1.000  0.155 -0.124 -0.062 -0.128  0.047 -0.028 -0.158  0.094  0.214  0.067 	
    11     12 	
-0.249	
> acf(y,lag=12)	
#Apply Ljung-Box Q(12) statistic to test whether ACF for the square of mean-adjusted log returns is significant 	
> Box.test(y^2,lag=12,type='Ljung')	
	
	Box-Ljung test
	
data:  y^2	
X-squared = 39.603, df = 12, p-value = 8.366e-05	
#We reject the Null Hypothesis	
#Apply Lagrange Multiplier test (12 lags) 	
> install.packages("FinTS")	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/el-capitan/contrib/3.4/FinTS_0.4-5.tgz'	
Content type 'application/x-gzip' length 3681661 bytes (3.5 MB)	
==================================================	
downloaded 3.5 MB	
	
	
The downloaded binary packages are in	
	/var/folders/24/1d3l64796nq2rnpx1pm58n140000gn/T//RtmpA1pbWC/downloaded_packages
> library(FinTS)	
Loading required package: zoo	
	
Attaching package: ‘zoo’	
	
The following objects are masked from ‘package:base’:	
	
    as.Date, as.Date.numeric	
	
> ArchTest(a1, lags=12, demean=FALSE)	
	
	ARCH LM-test; Null hypothesis: no ARCH effects
	
data:  a1	
Chi-squared = 26.747, df = 12, p-value = 0.008402	
#We reject the Null Hypothesis	
```

Part II.E Build an ARCH model 
```javascript
#Compute the PACF of the square of mean-adjusted log returns – check for significant lags 	
> pacf((y^2),lag=12,plot=FALSE)	
	
Partial autocorrelations of series ‘(y^2)’, by lag	
	
     1      2      3      4      5      6      7      8      9     10     11 	
 0.398 -0.163  0.111 -0.113  0.028 -0.102  0.032  0.063  0.206  0.096  0.214 	
12	
-0.088	
> pacf((y^2),lag=12)	
#Compute the ACF of the square of mean-adjusted log returns – check for significant lags 	
> acf((y^2),lag=12,plot=FALSE)	
	
Autocorrelations of series ‘(y^2)’, by lag	
	
     0      1      2      3      4      5      6      7      8      9     10 	
 1.000  0.398  0.022  0.036 -0.034 -0.044 -0.081 -0.055  0.053  0.212  0.248 	
    11     12 	
 0.280  0.127 	
> acf((y^2),lag=12)	
#Fit an ARCH(1) model (normally-distributed innovations)	
> install.packages("fGarch")	
also installing the dependencies ‘gss’, ‘stabledist’, ‘timeDate’, ‘timeSeries’, ‘fBasics’	
	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/el-capitan/contrib/3.4/gss_2.1-7.tgz'	
Content type 'application/x-gzip' length 840903 bytes (821 KB)	
==================================================	
downloaded 821 KB	
	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/el-capitan/contrib/3.4/stabledist_0.7-1.tgz'	
Content type 'application/x-gzip' length 38963 bytes (38 KB)	
==================================================	
downloaded 38 KB	
	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/el-capitan/contrib/3.4/timeDate_3012.100.tgz'	
Content type 'application/x-gzip' length 818701 bytes (799 KB)	
==================================================	
downloaded 799 KB	
	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/el-capitan/contrib/3.4/timeSeries_3022.101.2.tgz'	
Content type 'application/x-gzip' length 1612546 bytes (1.5 MB)	
==================================================	
downloaded 1.5 MB	
	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/el-capitan/contrib/3.4/fBasics_3011.87.tgz'	
Content type 'application/x-gzip' length 1524426 bytes (1.5 MB)	
==================================================	
downloaded 1.5 MB	
	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/el-capitan/contrib/3.4/fGarch_3010.82.1.tgz'	
Content type 'application/x-gzip' length 425617 bytes (415 KB)	
==================================================	
downloaded 415 KB	
	
	
The downloaded binary packages are in	
	/var/folders/24/1d3l64796nq2rnpx1pm58n140000gn/T//RtmpA1pbWC/downloaded_packages
> library(fGarch)	
Loading required package: timeDate	
Loading required package: timeSeries	
	
Attaching package: ‘timeSeries’	
	
The following object is masked from ‘package:zoo’:	
	
    time<-	
	
Loading required package: fBasics	
	
	
Rmetrics Package fBasics	
Analysing Markets and calculating Basic Statistics	
Copyright (C) 2005-2014 Rmetrics Association Zurich	
Educational Software for Financial Engineering and Computational Science	
Rmetrics is free software and comes with ABSOLUTELY NO WARRANTY.	
https://www.rmetrics.org --- Mail to: info@rmetrics.org	
> m11=garchFit(~1+garch(11,0), data=AMZN, trace=F)	
Warning message:	
In sqrt(diag(fit$cvar)) : NaNs produced	
> summary(m11)	
	
Title:	
 GARCH Modelling 	
	
Call:	
 garchFit(formula = ~1 + garch(11, 0), data = AMZN, trace = F) 	
	
Mean and Variance Equation:	
 data ~ 1 + garch(11, 0)	
<environment: 0x7f94e210b380>	
 [data = AMZN]	
	
Conditional Distribution:	
 norm 	
	
Coefficient(s):	
        mu       omega      alpha1      alpha2      alpha3      alpha4  	
2.3715e-02  9.7217e-09  1.6220e-01  1.0000e-08  8.4741e-01  4.3755e-02  	
    alpha5      alpha6      alpha7      alpha8      alpha9     alpha10  	
2.8572e-02  1.0000e-08  1.0000e-08  1.0000e-08  1.0000e-08  1.4040e-02  	
   alpha11  	
2.45E-01	
	
Std. Errors:	
 based on Hessian 	
	
Error Analysis:	
         Estimate  Std. Error  t value Pr(>|t|)    	
mu      2.372e-02   3.268e-03    7.256 3.99e-13 ***	
omega   9.722e-09          NA       NA       NA    	
alpha1  1.622e-01   5.800e-02    2.797 0.005161 ** 	
alpha2  1.000e-08          NA       NA       NA    	
alpha3  8.474e-01   2.192e-01    3.866 0.000111 ***	
alpha4  4.376e-02   4.890e-02    0.895 0.370906    	
alpha5  2.857e-02   8.830e-03    3.236 0.001214 ** 	
alpha6  1.000e-08          NA       NA       NA    	
alpha7  1.000e-08          NA       NA       NA    	
alpha8  1.000e-08          NA       NA       NA    	
alpha9  1.000e-08          NA       NA       NA    	
alpha10 1.404e-02          NA       NA       NA    	
alpha11 2.446e-01   7.894e-02    3.098 0.001945 ** 	
---	
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1	
	
Log Likelihood:	
 94.40968    normalized:  0.9834342 	
	
Description:	
 Fri May 26 03:12:20 2017 by user:  	
	
	
Standardised Residuals Tests:	
                                Statistic p-Value   	
 Jarque-Bera Test   R    Chi^2  3.941196  0.1393735 	
 Shapiro-Wilk Test  R    W      0.976194  0.07774257	
 Ljung-Box Test     R    Q(10)  6.372167  0.7830866 	
 Ljung-Box Test     R    Q(15)  11.20314  0.738066  	
 Ljung-Box Test     R    Q(20)  15.39582  0.7533287 	
 Ljung-Box Test     R^2  Q(10)  17.17844  0.07050754	
 Ljung-Box Test     R^2  Q(15)  23.55945  0.07296257	
 Ljung-Box Test     R^2  Q(20)  24.73237  0.2118623 	
 LM Arch Test       R    TR^2   9.597384  0.651235  	
	
Information Criterion Statistics:	
      AIC       BIC       SIC      HQIC 	
-6.32768	
	
> m9=garchFit(~1+garch(9,0), data=AMZN, trace=F) 	
Warning message:	
In sqrt(diag(fit$cvar)) : NaNs produced	
> summary(m9)	
	
Title:	
 GARCH Modelling 	
	
Call:	
 garchFit(formula = ~1 + garch(9, 0), data = AMZN, trace = F) 	
	
Mean and Variance Equation:	
 data ~ 1 + garch(9, 0)	
<environment: 0x7f94e4768a70>	
 [data = AMZN]	
	
Conditional Distribution:	
 norm 	
	
Coefficient(s):	
        mu       omega      alpha1      alpha2      alpha3      alpha4  	
1.8804e-02  9.7217e-09  5.4056e-01  1.0000e-08  3.7641e-01  1.0000e-08  	
    alpha5      alpha6      alpha7      alpha8      alpha9  	
1.0000e-08  2.0341e-01  1.6084e-01  1.0000e-08  1.0000e-08  	
	
Std. Errors:	
 based on Hessian 	
	
Error Analysis:	
        Estimate  Std. Error  t value Pr(>|t|)   	
mu     1.880e-02   6.635e-03    2.834  0.00459 **	
omega  9.722e-09   1.337e-03    0.000  0.99999   	
alpha1 5.406e-01   1.828e-01    2.958  0.00310 **	
alpha2 1.000e-08          NA       NA       NA   	
alpha3 3.764e-01   2.336e-01    1.612  0.10707   	
alpha4 1.000e-08   2.136e-01    0.000  1.00000   	
alpha5 1.000e-08          NA       NA       NA   	
alpha6 2.034e-01   1.751e-01    1.162  0.24541   	
alpha7 1.608e-01   3.144e-01    0.512  0.60892   	
alpha8 1.000e-08          NA       NA       NA   	
alpha9 1.000e-08   2.362e-02    0.000  1.00000   	
---	
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1	
	
Log Likelihood:	
 94.38469    normalized:  0.9831738 	
	
Description:	
 Fri May 26 03:12:40 2017 by user:  	
	
	
Standardised Residuals Tests:	
                                Statistic p-Value  	
 Jarque-Bera Test   R    Chi^2  1.597852  0.4498118	
 Shapiro-Wilk Test  R    W      0.9879445 0.5341143	
 Ljung-Box Test     R    Q(10)  9.243587  0.509153 	
 Ljung-Box Test     R    Q(15)  16.83649  0.3287324	
 Ljung-Box Test     R    Q(20)  21.26211  0.3818521	
 Ljung-Box Test     R^2  Q(10)  7.16928   0.7093731	
 Ljung-Box Test     R^2  Q(15)  13.42489  0.5695155	
 Ljung-Box Test     R^2  Q(20)  16.54294  0.6824214	
 LM Arch Test       R    TR^2   11.2652   0.5063383	
	
Information Criterion Statistics:	
      AIC       BIC       SIC      HQIC 	
-6.55895	
	
> m1=garchFit(~1+garch(1,0), data=AMZN, trace=F) 	
> summary(m1)	
	
Title:	
 GARCH Modelling 	
	
Call:	
 garchFit(formula = ~1 + garch(1, 0), data = AMZN, trace = F) 	
	
Mean and Variance Equation:	
 data ~ 1 + garch(1, 0)	
<environment: 0x7f94e4c384e8>	
 [data = AMZN]	
	
Conditional Distribution:	
 norm 	
	
Coefficient(s):	
       mu      omega     alpha1  	
0.0235836  0.0063008  0.3255130  	
	
Std. Errors:	
 based on Hessian 	
	
Error Analysis:	
        Estimate  Std. Error  t value Pr(>|t|)    	
mu      0.023584    0.009070    2.600  0.00932 ** 	
omega   0.006301    0.001298    4.854 1.21e-06 ***	
alpha1  0.325513    0.162141    2.008  0.04469 *  	
---	
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1	
	
Log Likelihood:	
 91.46596    normalized:  0.9527704 	
	
Description:	
 Fri May 26 03:12:54 2017 by user:  	
	
	
Standardised Residuals Tests:	
                                Statistic p-Value  	
 Jarque-Bera Test   R    Chi^2  0.0361031 0.9821104	
 Shapiro-Wilk Test  R    W      0.9851168 0.3516838	
 Ljung-Box Test     R    Q(10)  10.92994  0.3630023	
 Ljung-Box Test     R    Q(15)  19.55386  0.1897232	
 Ljung-Box Test     R    Q(20)  25.29382  0.1904204	
 Ljung-Box Test     R^2  Q(10)  6.30237   0.7892519	
 Ljung-Box Test     R^2  Q(15)  11.11726  0.7442385	
 Ljung-Box Test     R^2  Q(20)  12.98589  0.8779888	
 LM Arch Test       R    TR^2   16.59085  0.165647 	
	
Information Criterion Statistics:	
      AIC       BIC       SIC      HQIC 	
-7.261511	
#Fit an ARCH(1) model (Student’s T-distributed innovations)	
> m11_1=garchFit(~1+garch(11,0), data=AMZN, trace=F, cond.dist="std") 	
Warning message:	
In sqrt(diag(fit$cvar)) : NaNs produced	
> summary(m11)	
	
Title:	
 GARCH Modelling 	
	
Call:	
 garchFit(formula = ~1 + garch(11, 0), data = AMZN, trace = F) 	
	
Mean and Variance Equation:	
 data ~ 1 + garch(11, 0)	
<environment: 0x7f94e210b380>	
 [data = AMZN]	
	
Conditional Distribution:	
 norm 	
	
Coefficient(s):	
        mu       omega      alpha1      alpha2      alpha3      alpha4  	
2.3715e-02  9.7217e-09  1.6220e-01  1.0000e-08  8.4741e-01  4.3755e-02  	
    alpha5      alpha6      alpha7      alpha8      alpha9     alpha10  	
2.8572e-02  1.0000e-08  1.0000e-08  1.0000e-08  1.0000e-08  1.4040e-02  	
   alpha11  	
2.45E-01	
	
Std. Errors:	
 based on Hessian 	
	
Error Analysis:	
         Estimate  Std. Error  t value Pr(>|t|)    	
mu      2.372e-02   3.268e-03    7.256 3.99e-13 ***	
omega   9.722e-09          NA       NA       NA    	
alpha1  1.622e-01   5.800e-02    2.797 0.005161 ** 	
alpha2  1.000e-08          NA       NA       NA    	
alpha3  8.474e-01   2.192e-01    3.866 0.000111 ***	
alpha4  4.376e-02   4.890e-02    0.895 0.370906    	
alpha5  2.857e-02   8.830e-03    3.236 0.001214 ** 	
alpha6  1.000e-08          NA       NA       NA    	
alpha7  1.000e-08          NA       NA       NA    	
alpha8  1.000e-08          NA       NA       NA    	
alpha9  1.000e-08          NA       NA       NA    	
alpha10 1.404e-02          NA       NA       NA    	
alpha11 2.446e-01   7.894e-02    3.098 0.001945 ** 	
---	
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1	
	
Log Likelihood:	
 94.40968    normalized:  0.9834342 	
	
Description:	
 Fri May 26 03:12:20 2017 by user:  	
	
	
Standardised Residuals Tests:	
                                Statistic p-Value   	
 Jarque-Bera Test   R    Chi^2  3.941196  0.1393735 	
 Shapiro-Wilk Test  R    W      0.976194  0.07774257	
 Ljung-Box Test     R    Q(10)  6.372167  0.7830866 	
 Ljung-Box Test     R    Q(15)  11.20314  0.738066  	
 Ljung-Box Test     R    Q(20)  15.39582  0.7533287 	
 Ljung-Box Test     R^2  Q(10)  17.17844  0.07050754	
 Ljung-Box Test     R^2  Q(15)  23.55945  0.07296257	
 Ljung-Box Test     R^2  Q(20)  24.73237  0.2118623 	
 LM Arch Test       R    TR^2   9.597384  0.651235  	
	
Information Criterion Statistics:	
      AIC       BIC       SIC      HQIC 	
-6.32768	
	
> m9_1=garchFit(~1+garch(9,0), data=AMZN, trace=F, cond.dist="std") 	
Warning message:	
In sqrt(diag(fit$cvar)) : NaNs produced	
> summary(m9)	
	
Title:	
 GARCH Modelling 	
	
Call:	
 garchFit(formula = ~1 + garch(9, 0), data = AMZN, trace = F) 	
	
Mean and Variance Equation:	
 data ~ 1 + garch(9, 0)	
<environment: 0x7f94e4768a70>	
 [data = AMZN]	
	
Conditional Distribution:	
 norm 	
	
Coefficient(s):	
        mu       omega      alpha1      alpha2      alpha3      alpha4  	
1.8804e-02  9.7217e-09  5.4056e-01  1.0000e-08  3.7641e-01  1.0000e-08  	
    alpha5      alpha6      alpha7      alpha8      alpha9  	
1.0000e-08  2.0341e-01  1.6084e-01  1.0000e-08  1.0000e-08  	
	
Std. Errors:	
 based on Hessian 	
	
Error Analysis:	
        Estimate  Std. Error  t value Pr(>|t|)   	
mu     1.880e-02   6.635e-03    2.834  0.00459 **	
omega  9.722e-09   1.337e-03    0.000  0.99999   	
alpha1 5.406e-01   1.828e-01    2.958  0.00310 **	
alpha2 1.000e-08          NA       NA       NA   	
alpha3 3.764e-01   2.336e-01    1.612  0.10707   	
alpha4 1.000e-08   2.136e-01    0.000  1.00000   	
alpha5 1.000e-08          NA       NA       NA   	
alpha6 2.034e-01   1.751e-01    1.162  0.24541   	
alpha7 1.608e-01   3.144e-01    0.512  0.60892   	
alpha8 1.000e-08          NA       NA       NA   	
alpha9 1.000e-08   2.362e-02    0.000  1.00000   	
---	
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1	
	
Log Likelihood:	
 94.38469    normalized:  0.9831738 	
	
Description:	
 Fri May 26 03:12:40 2017 by user:  	
	
	
Standardised Residuals Tests:	
                                Statistic p-Value  	
 Jarque-Bera Test   R    Chi^2  1.597852  0.4498118	
 Shapiro-Wilk Test  R    W      0.9879445 0.5341143	
 Ljung-Box Test     R    Q(10)  9.243587  0.509153 	
 Ljung-Box Test     R    Q(15)  16.83649  0.3287324	
 Ljung-Box Test     R    Q(20)  21.26211  0.3818521	
 Ljung-Box Test     R^2  Q(10)  7.16928   0.7093731	
 Ljung-Box Test     R^2  Q(15)  13.42489  0.5695155	
 Ljung-Box Test     R^2  Q(20)  16.54294  0.6824214	
 LM Arch Test       R    TR^2   11.2652   0.5063383	
	
Information Criterion Statistics:	
      AIC       BIC       SIC      HQIC 	
-6.55895	
	
> m1_1=garchFit(~1+garch(1,0), data=AMZN, trace=F, cond.dist="std") 	
> summary(m1)	
	
Title:	
 GARCH Modelling 	
	
Call:	
 garchFit(formula = ~1 + garch(1, 0), data = AMZN, trace = F) 	
	
Mean and Variance Equation:	
 data ~ 1 + garch(1, 0)	
<environment: 0x7f94e4c384e8>	
 [data = AMZN]	
	
Conditional Distribution:	
 norm 	
	
Coefficient(s):	
       mu      omega     alpha1  	
0.0235836  0.0063008  0.3255130  	
	
Std. Errors:	
 based on Hessian 	
	
Error Analysis:	
        Estimate  Std. Error  t value Pr(>|t|)    	
mu      0.023584    0.009070    2.600  0.00932 ** 	
omega   0.006301    0.001298    4.854 1.21e-06 ***	
alpha1  0.325513    0.162141    2.008  0.04469 *  	
---	
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1	
	
Log Likelihood:	
 91.46596    normalized:  0.9527704 	
	
Description:	
 Fri May 26 03:12:54 2017 by user:  	
	
	
Standardised Residuals Tests:	
                                Statistic p-Value  	
 Jarque-Bera Test   R    Chi^2  0.0361031 0.9821104	
 Shapiro-Wilk Test  R    W      0.9851168 0.3516838	
 Ljung-Box Test     R    Q(10)  10.92994  0.3630023	
 Ljung-Box Test     R    Q(15)  19.55386  0.1897232	
 Ljung-Box Test     R    Q(20)  25.29382  0.1904204	
 Ljung-Box Test     R^2  Q(10)  6.30237   0.7892519	
 Ljung-Box Test     R^2  Q(15)  11.11726  0.7442385	
 Ljung-Box Test     R^2  Q(20)  12.98589  0.8779888	
 LM Arch Test       R    TR^2   16.59085  0.165647 	
	
Information Criterion Statistics:	
      AIC       BIC       SIC      HQIC 	
-7.261511	
```
