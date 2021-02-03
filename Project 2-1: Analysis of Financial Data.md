## Project Contents

**_1. Stock Price Data_**

- Using the Quantmod package – download daily stock prices for Amazon via Yahoo Finance for the period January 1, 2008 through December 31, 2015. 
- Provide dimensions for this matrix.
- Provide the first and last 6 rows of this matrix.
- Plot the daily volume and closing price – save as PDF.  
    - Background = white
    - Width = 15 
- Export this dataset to a TXT or CSV file. Copy and paste into an Excel file “`Amazon`” 

  
**_2. Daily Log Returns for Stock Data_**

- Compute log returns for Amazon’s daily stock price (closing price adjusted for splits and dividends).
    - Provide the first 6 observations
    - Provide the last 6 observations
- Calculate mean, median, variance, standard deviation, skewness, and excess kurtosis.
- Conduct skewness test (i.e. test null hypothesis that skewness = 0)
- Conduct kurtosis test (i.e. test null hypothesis that excess kurtosis = 0)
- Conduct Jarque-Bera Normality Test

**_3. Market Index Price Data_**

- Using the Quantmod package – download daily index prices for the Vanguard Total Stock Market Index Fund via Yahoo Finance for the period January 1, 2008 through December 31, 2015. 
- Provide dimensions for this matrix.
- Provide the first and last 6 rows of this matrix.
- Export this dataset to a TXT or CSV file.  Copy and paste into an Excel file “`Vanguard`”

**_4. Computing Monthly Log Returns_**

- Using the Period Return function in Quantmod, compute the monthly log returns of Amazon closing stock price 
    - Produce a histogram of this data using 20 buckets; save as PDF
    - Provide the first 6 observations
    - Provide the last 6 observations
- Using the Period Return function in Quantmod, compute the monthly log returns of the Vanguard Total Stock Market Index Fund closing price
    - Produce a histogram of this data using 20 buckets; save as PDF
    - Provide the first 6 observations
    - Provide the last 6 observations
- Combine monthly log returns for Amazon and Vanguard Total Stock Market Index Fund into same data frame
    - Provide dimensions for this matrix.
    - Provide the first 6 observations
    - Provide the last 6 observations
- Export this dataset to a TXT or CSV file. Copy and paste into an Excel file “`Combined Dataset (Monthly)`” 

**_5. Analysis of Monthly Log Returns_**

- Compute Pearson’s correlation coefficient between Amazon and Vanguard monthly log returns
- Produce a scatterplot of Amazon and Vanguard monthly log returns; save as PDF.
- Compute the beta for Amazon’s monthly log returns
  
## R Code and Output

Explore in table: [Project 2-1.xlsx](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/tables/Project%202-1.xlsx)

Part I Stock Price Data
```javascript
> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
> setwd("C:/#Baruch/Econometrics/Projects")
> install.packages("TTR")	
--- Please select a CRAN mirror for use in this session ---	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/mavericks/contrib/3.3/TTR_0.23-1.tgz'	
Content type 'application/x-gzip' length 428119 bytes (418 KB)	
==================================================	
downloaded 418 KB	
	
	
The downloaded binary packages are in	
	/var/folders/24/1d3l64796nq2rnpx1pm58n140000gn/T//Rtmpbt5IQV/downloaded_packages
> library(TTR)	
> install.packages("xts")	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/mavericks/contrib/3.3/xts_0.9-7.tgz'	
Content type 'application/x-gzip' length 648948 bytes (633 KB)	
==================================================	
downloaded 633 KB	
	
	
The downloaded binary packages are in	
	/var/folders/24/1d3l64796nq2rnpx1pm58n140000gn/T//Rtmpbt5IQV/downloaded_packages
> library(xts)	
Loading required package: zoo	
	
Attaching package: ‘zoo’	
	
The following objects are masked from ‘package:base’:	
	
    as.Date, as.Date.numeric	
	
> install.packages("zoo")	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/mavericks/contrib/3.3/zoo_1.8-0.tgz'	
Content type 'application/x-gzip' length 887574 bytes (866 KB)	
==================================================	
downloaded 866 KB	
	
	
The downloaded binary packages are in	
	/var/folders/24/1d3l64796nq2rnpx1pm58n140000gn/T//Rtmpbt5IQV/downloaded_packages
> library(zoo)	
> install.packages("quantmod")	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/mavericks/contrib/3.3/quantmod_0.4-8.tgz'	
Content type 'application/x-gzip' length 473293 bytes (462 KB)	
==================================================	
downloaded 462 KB	
	
	
The downloaded binary packages are in	
	/var/folders/24/1d3l64796nq2rnpx1pm58n140000gn/T//Rtmpbt5IQV/downloaded_packages
> library(quantmod)	
Version 0.4-0 included new data defaults. See ?getSymbols.	
Learn from a quantmod author: https://www.datacamp.com/courses/importing-and-managing-financial-data-in-r	
> getSymbols('AMZN', from="2008-01-01", to="2015-12-31")	
[1] "AMZN"	
> head(AMZN)	
           AMZN.Open AMZN.High AMZN.Low AMZN.Close AMZN.Volume AMZN.Adjusted	
2008-01-02     95.35     97.43    94.70      96.25    13858700         96.25	
2008-01-03     96.06     97.25    94.52      95.21     9122500         95.21	
2008-01-04     93.26     93.40    88.50      88.79    10270000         88.79	
2008-01-07     88.62     90.57    85.47      88.82     9981600         88.82	
2008-01-08     87.55     91.83    86.93      87.88    12283300         87.88	
2008-01-09     87.56     87.80    80.24      85.22    16410900         85.22	
> tail(AMZN)	
           AMZN.Open AMZN.High AMZN.Low AMZN.Close AMZN.Volume AMZN.Adjusted	
2015-12-23    666.50    666.60   656.63     663.70     2722900        663.70	
2015-12-24    663.35    664.68   660.60     662.79     1091200        662.79	
2015-12-28    665.56    675.50   665.50     675.20     3783600        675.20	
2015-12-29    677.98    696.44   677.89     693.97     5735000        693.97	
2015-12-30    691.89    695.49   686.38     689.07     3519000        689.07	
2015-12-31    686.08    687.75   675.89     675.89     3718200        675.89	
> dim(AMZN)	
[1] 2015    6	
> chartSeries(AMZN, theme="white")	
> require(TTR) 	
> saveChart('pdf', width=13)	
> write.table(AMZN, "AMZN.txt", sep='\t', col.names = NA)	
```

![](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/formula/Amazon%20Plot%20(Volume%20%26%20Price).jpg)

Part II	Daily Log Returns for Stock Data
```javascript
> AMZN.Close.rtn=diff(log(AMZN$AMZN.Close))	
> head(AMZN.Close.rtn)	
              AMZN.Close	
2008-01-02            NA	
2008-01-03 -0.0108640054	
2008-01-04 -0.0698109255	
2008-01-07  0.0003378076	
2008-01-08 -0.0106396365	
2008-01-09 -0.0307360536	
> tail(AMZN.Close.rtn)	
              AMZN.Close	
2015-12-23  0.0008290131	
2015-12-24 -0.0013720935	
2015-12-28  0.0185507963	
2015-12-29  0.0274197291	
2015-12-30 -0.0070858176	
2015-12-31 -0.0193125094	
> AMZN.rtn=diff(log(AMZN$AMZN.Adjusted))	
> head(AMZN.rtn)	
           AMZN.Adjusted	
2008-01-02            NA	
2008-01-03 -0.0108640054	
2008-01-04 -0.0698109255	
2008-01-07  0.0003378076	
2008-01-08 -0.0106396365	
2008-01-09 -0.0307360536	
> tail(AMZN.rtn)	
           AMZN.Adjusted	
2015-12-23  0.0008290131	
2015-12-24 -0.0013720935	
2015-12-28  0.0185507963	
2015-12-29  0.0274197291	
2015-12-30 -0.0070858176	
2015-12-31 -0.0193125094	
> AMZN.Close.rtn <- AMZN.Close.rtn [2:nrow(AMZN.Close.rtn), ]	
> dim(AMZN.Close.rtn)	
[1] 2014    1	
> AMZN.rtn <- AMZN.rtn[2:nrow(AMZN.rtn), ]	
> dim(AMZN.rtn)	
[1] 2014    1	
> install.packages("fBasics")	
trying URL 'https://cran.cnr.berkeley.edu/bin/macosx/mavericks/contrib/3.3/fBasics_3011.87.tgz'	
Content type 'application/x-gzip' length 1513759 bytes (1.4 MB)	
==================================================	
downloaded 1.4 MB	
	
	
The downloaded binary packages are in	
	/var/folders/24/1d3l64796nq2rnpx1pm58n140000gn/T//Rtmpbt5IQV/downloaded_packages
> library(fBasics)	
Loading required package: timeDate	
Loading required package: timeSeries	
	
Attaching package: ‘timeSeries’	
	
The following object is masked from ‘package:zoo’:	
	
    time<-	
	
	
	
Rmetrics Package fBasics	
Analysing Markets and calculating Basic Statistics	
Copyright (C) 2005-2014 Rmetrics Association Zurich	
Educational Software for Financial Engineering and Computational Science	
Rmetrics is free software and comes with ABSOLUTELY NO WARRANTY.	
https://www.rmetrics.org --- Mail to: info@rmetrics.org	
	
Attaching package: ‘fBasics’	
	
The following object is masked from ‘package:TTR’:	
	
    volatility	
	
> basicStats(AMZN.rtn)	
            AMZN.Adjusted	
nobs          2014.000000	
NAs              0.000000	
Minimum         -0.136759	
Maximum          0.237402	
1. Quartile     -0.011158	
3. Quartile      0.013468	
Mean             0.000968	
Median           0.000118	
Sum              1.949081	
SE Mean          0.000572	
LCL Mean        -0.000154	
UCL Mean         0.002089	
Variance         0.000658	
Stdev            0.025661	
Skewness         0.572603	
Kurtosis         8.685281	
> t.test(AAPL.rtn)	
Error in t.test(AAPL.rtn) : object 'AAPL.rtn' not found	
> t.test(AMZN.rtn)	
	
	One Sample t-test
	
data:  AMZN.rtn	
t = 1.6925, df = 2013, p-value = 0.0907	
alternative hypothesis: true mean is not equal to 0	
95 percent confidence interval:	
 -0.0001536076  0.0020891402	
sample estimates:	
   mean of x 	
0.000967766	
	
> s3=skewness(AMZN.rtn)	
> T=length(AMZN.rtn)	
> s3/sqrt(6/T)	
[1] 10.49077	
attr(,"method")	
[1] "moment"	
> s4=kurtosis(AMZN.rtn)	
> T=length(AMZN.rtn)	
> s4/sqrt(24/T)	
[1] 79.56242	
attr(,"method")	
[1] "excess"	
> normalTest(AMZN.rtn , method='jb')	
	
Title:	
 Jarque - Bera Normalality Test	
	
Test Results:	
  STATISTIC:	
    X-squared: 6457.3375	
  P VALUE:	
    Asymptotic p Value: < 2.2e-16 	
	
Description:	
 Thu May  4 15:28:09 2017 by user: 	
	
Warning message:	
In if (class(x) == "fREG") x = residuals(x) :	
  the condition has length > 1 and only the first element will be used	
```
	
Part III Market Index Price Data
```javascript
> getSymbols("VTSMX", from="2008-01-01", to="2015-12-31")	
[1] "VTSMX"	
> head(VTSMX)	
           VTSMX.Open VTSMX.High VTSMX.Low VTSMX.Close VTSMX.Volume	
2008-01-02      34.86      34.86     34.86       34.86            0	
2008-01-03      34.81      34.81     34.81       34.81            0	
2008-01-04      33.92      33.92     33.92       33.92            0	
2008-01-07      34.00      34.00     34.00       34.00            0	
2008-01-08      33.36      33.36     33.36       33.36            0	
2008-01-09      33.76      33.76     33.76       33.76            0	
           VTSMX.Adjusted	
2008-01-02       29.21361	
2008-01-03       29.17171	
2008-01-04       28.42587	
2008-01-07       28.49291	
2008-01-08       27.95657	
2008-01-09       28.29178	
> tail(VTSMX)	
           VTSMX.Open VTSMX.High VTSMX.Low VTSMX.Close VTSMX.Volume	
2015-12-23      51.28      51.28     51.28       51.28            0	
2015-12-24      51.22      51.22     51.22       51.22            0	
2015-12-28      51.08      51.08     51.08       51.08            0	
2015-12-29      51.62      51.62     51.62       51.62            0	
2015-12-30      51.25      51.25     51.25       51.25            0	
2015-12-31      50.78      50.78     50.78       50.78            0	
           VTSMX.Adjusted	
2015-12-23       50.09335	
2015-12-24       50.03474	
2015-12-28       49.89798	
2015-12-29       50.42548	
2015-12-30       50.06404	
2015-12-31       49.60492	
> dim(VTSMX)	
[1] 2015    6	
> write.table(VTSMX, "VTSMX.txt", sep='\t', col.names = NA)	
```
	
Part IV	Computing Monthly Log Returns
```javascript
> VTSMX.mo.rtn <- periodReturn(VTSMX, period='monthly', type='log', leading='True')	
> AMZN.mo.rtn <- periodReturn(AMZN, period='monthly', type='log', leading='True')	
> dim(AMZN.mo.rtn)	
[1] 96  1	
> head(AMZN.mo.rtn)	
           monthly.returns	
2008-01-31      -0.2046991	
2008-02-29      -0.1866552	
2008-03-31       0.1006964	
2008-04-30       0.0978569	
2008-05-30       0.0373211	
2008-06-30      -0.1071045	
> tail(AMZN.mo.rtn)	
           monthly.returns	
2015-07-31     0.211162141	
2015-08-31    -0.044352591	
2015-09-30    -0.001951639	
2015-10-30     0.201080865	
2015-11-30     0.060295573	
2015-12-31     0.016544138	
> hist(AMZN.mo.rtn, nclass=20)	
> VTSMX.mo.rtn <- periodReturn(VTSMX, period='monthly', type='log', leading='True')	
> dim(VTSMX.mo.rtn)	
[1] 96  1	
> head(VTSMX.mo.rtn)	
           monthly.returns	
2008-01-31     -0.04848906	
2008-02-29     -0.03119519	
2008-03-31     -0.01030448	
2008-04-30      0.04899933	
2008-05-30      0.02070470	
2008-06-30     -0.08999649	
> tail(VTSMX.mo.rtn)	
           monthly.returns	
2015-07-31     0.016186186	
2015-08-31    -0.061947770	
2015-09-30    -0.034761157	
2015-10-30     0.075518920	
2015-11-30     0.005387717	
2015-12-31    -0.025854332	
> hist(VTSMX.mo.rtn, nclass=20)	
> monthly<-data.frame(VTSMX=VTSMX.mo.rtn, AMZN=AMZN.mo.rtn)	
> names(monthly)[1]<-"VTSMX"	
> names(monthly)[2]<-"AMZN"	
> head(monthly)	
                 VTSMX       AMZN	
2008-01-31 -0.04848906 -0.2046991	
2008-02-29 -0.03119519 -0.1866552	
2008-03-31 -0.01030448  0.1006964	
2008-04-30  0.04899933  0.0978569	
2008-05-30  0.02070470  0.0373211	
2008-06-30 -0.08999649 -0.1071045	
> tail(monthly)	
                  VTSMX         AMZN	
2015-07-31  0.016186186  0.211162141	
2015-08-31 -0.061947770 -0.044352591	
2015-09-30 -0.034761157 -0.001951639	
2015-10-30  0.075518920  0.201080865	
2015-11-30  0.005387717  0.060295573	
2015-12-31 -0.025854332  0.016544138	
> dim(monthly)	
[1] 96  2	
> write.table(monthly, "monthly.txt", sep='\t', col.names = NA)	
```
![](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/formula/Amazon%20Plot%20(Log%20Returns).pdf)
![](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/formula/Vanguard%20Plot%20(Log%20Returns).pdf)

Part V Analysis of Monthly Log Returns
```javascript
> cor(AMZN.mo.rtn, VTSMX.mo.rtn)	
                monthly.returns	
monthly.returns       0.4964068	
> pdf('Scatterplot.pdf', width=10)	
> plot(monthly[1:2], xlab='Vanguard Monthly Log Returns', ylab='Amazon Monthly Log Returns')	
> title(main='Scatterplot')	
> dev.off()	
null device 	
1	
> pdf('Scatterplot.pdf', width=10)	
> plot(monthly[1:2], xlab='Vanguard Monthly Log Returns', ylab='Amazon Monthly Log Returns')	
> title(main='Scatterplot')	
> 	
> pdf('Scatterplot.pdf', width=10)	
> plot(monthly[1:2], xlab='Vanguard Monthly Log Returns', ylab='Amazon Monthly Log Returns')	
> title(main='Scatterplot')	
> dev.off()	
pdf 	
2	
> cov(AMZN.mo.rtn, VTSMX.mo.rtn)/ var(VTSMX.mo.rtn)	
                monthly.returns	
monthly.returns       0.9916292	
```
![](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/formula/Combined%20Plot%20(Monthly).jpg)
