## Project Contents

>For all analysis use the monthly log returns for the period 1/1/08 – 12/31/15, and use 5% level when determining significance

**_1. Linear Model Analysis of Vanguard Total Stock Market Index Fund_**

A. Test	monthly	log	returns	for	autocorrelation
- Use a t-test to check whether lag 1 is significant 
- Use a t-test to check whether lag 2 is significant 
- Use Ljung-Box Q(m) statistics to test whether ACF is significant
    - Apply m = 12
    - Apply m = ln(T)

B. Autoregressive	model
- Use PACF to determine AR order
- Run appropriate AR model
    > Reasonable people can disagree on the best order of these models – just make sure to justify your choice
- Check AR model for stationarity

C. Moving	average	model
- Use ACF to determine appropriate MA order
- Fit the appropriate MA model
    > Reasonable people can disagree on the best order of these models – just make sure to justify your choice

**_2. Modeling Volatility for Amazon, Inc._**

A. Test	log	returns	for	autocorrelation
- Check ACF for significance
- Apply Ljung-Box Q(12) statistic to test whether ACF is significant

B. Test absolute	value	of	log	returns	for	dependence	
- Check ACF for significant lags
- Apply Ljung-Box Q(12) statistic to test whether ACF is significant

C. Test	squared	series of log	returns	for	dependence	
- Check ACF for significant lags
- Apply Ljung-Box Q(12) statistic to test whether ACF is significant
  
D. Test	for	ARCH effects
- Calculate mean-adjusted log returns
- Apply Ljung-Box Q(12) statistic to test whether ACF for the square of mean-adjusted log returns is significant
- Apply Lagrange Multiplier test (12 lags) 

E. Build an	ARCH model	
- Compute the PACF of the square of mean-adjusted log returns – check for significant lags
- Compute the ACF of the square of mean-adjusted log returns – check for significant lags
- Fit an ARCH(1) model (normally-distributed innovations)
- Fit an ARCH(1) model (Student’s T-distributed innovations)

## R Code and Output

Part IA Test	monthly	log	returns	for	autocorrelation
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

Part IB	Autoregressive model
```javascript
#Autoregressive Model				
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
