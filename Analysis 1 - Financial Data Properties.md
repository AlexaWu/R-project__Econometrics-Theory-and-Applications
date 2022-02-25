```r
> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
```

## Daily data

#### setting working directory
```r
> setwd('C:/#Baruch/Econometrics/Financial Data')
```

#### Install packages required to import financial data via open sources
```r
> install.packages("TTR")
Installing package into ‘C:/Users/Alexa~Chutian/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
also installing the dependencies ‘xts’, ‘zoo’

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/xts_0.9-7.zip'
Content type 'application/zip' length 661925 bytes (646 KB)
downloaded 646 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/zoo_1.8-0.zip'
Content type 'application/zip' length 902582 bytes (881 KB)
downloaded 881 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/TTR_0.23-1.zip'
Content type 'application/zip' length 432724 bytes (422 KB)
downloaded 422 KB

package ‘xts’ successfully unpacked and MD5 sums checked
package ‘zoo’ successfully unpacked and MD5 sums checked
package ‘TTR’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Alexa~Chutian\AppData\Local\Temp\Rtmponaecl\downloaded_packages
> library(TTR)
Warning message:
package ‘TTR’ was built under R version 3.3.3 
> library(xts)
Loading required package: zoo

Attaching package: ‘zoo’

The following objects are masked from ‘package:base’:

    as.Date, as.Date.numeric

Warning messages:
1: package ‘xts’ was built under R version 3.3.3 
2: package ‘zoo’ was built under R version 3.3.3 
> library(zoo)
> library(quantmod)
Version 0.4-0 included new data defaults. See ?getSymbols.
Learn from a quantmod author: https://www.datacamp.com/courses/importing-and-managing-financial-data-in-r
Warning message:
package ‘quantmod’ was built under R version 3.3.3 
```

#### Download daily Apple stock prices via Yahoo Finance – which is default aggregator
> Copying and pasting can create issues with quotes
```r
> getSymbols('AAPL')
    As of 0.4-0, ‘getSymbols’ uses env=parent.frame() and
 auto.assign=TRUE by default.

 This  behavior  will be  phased out in 0.5-0  when the call  will
 default to use auto.assign=FALSE. getOption("getSymbols.env") and 
 getOptions("getSymbols.auto.assign") are now checked for alternate defaults

 This message is shown once per session and may be disabled by setting 
 options("getSymbols.warning4.0"=FALSE). See ?getSymbols for more details.
[1] "AAPL"
```

#### Dimensions for dataset imported
```r
> dim(AAPL)
[1] 2594    6
```

#### See first 6 rows of data
```r
> head(AAPL)
           AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted
2007-01-03     86.29     86.58    81.90      83.80   309579900      10.85709
2007-01-04     84.05     85.95    83.82      85.66   211815100      11.09807
2007-01-05     85.77     86.20    84.40      85.05   208685400      11.01904
2007-01-08     85.96     86.53    85.28      85.47   199276700      11.07345
2007-01-09     86.45     92.98    85.15      92.57   837324600      11.99333
2007-01-10     94.75     97.80    93.45      97.00   738220000      12.56728
```

#### See last 6 rows of data
```r
> tail(AAPL)
           AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted
2017-04-13    141.91    142.38   141.05     141.05    17652900        141.05
2017-04-17    141.48    141.88   140.87     141.83    16424000        141.83
2017-04-18    141.41    142.04   141.11     141.20    14660800        141.20
2017-04-19    141.88    142.00   140.45     140.68    17271300        140.68
2017-04-20    141.22    142.92   141.16     142.44    23251100        142.44
2017-04-21    142.44    142.68   141.85     142.27    17245200        142.27
```

#### Specifying dates of interest for subset
> Note data shown on Yahoo screen different than downloaded to CSV
```r
> getSymbols('AAPL', from="2008-01-01", to="2013-12-31") 
[1] "AAPL"
> head(AAPL)
           AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted
2008-01-02    199.27    200.26   192.55     194.84   269794700      25.24338
2008-01-03    195.41    197.39   192.69     194.93   210516600      25.25504
2008-01-04    191.45    193.00   178.89     180.05   363958000      23.32720
2008-01-07    181.25    183.60   170.23     177.64   518048300      23.01496
2008-01-08    180.14    182.46   170.80     171.25   380954000      22.18707
2008-01-09    171.30    179.50   168.30     179.40   453470500      23.24298
> tail(AAPL) 
           AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted
2013-12-23    568.00    570.72   562.76     570.09   125326600      76.38845
2013-12-24    569.89    571.88   566.03     567.67    41888700      76.06418
2013-12-26    568.10    569.50   563.38     563.90    51002000      75.55903
2013-12-27    563.82    564.41   559.50     560.09    56471100      75.04851
2013-12-30    557.46    560.09   552.32     554.52    63407400      74.30217
2013-12-31    554.17    561.28   554.00     561.02    55771100      75.17313
> dim(AAPL)
[1] 1511    6
```

#### Export data to TXT file – then can copy and paste into Excel
```r
> write.table(AAPL, "AAPL.txt", sep='\t', col.names = NA)
```

#### Plot daily close price & volume with options for white background and wider chart
```r
> chartSeries(AAPL, theme="white")
> require(TTR) 
> saveChart('pdf', width=13)
Error in assign(".chob", x, env) : 
  cannot change value of locked binding for '.chob'
```

#### Calculate log returns (first difference of logs) and save as new dataset
```r
> AAPL.rtn=diff(log(AAPL$AAPL.Adjusted))
> head(AAPL.rtn) 
           AAPL.Adjusted
2008-01-02            NA
2008-01-03  0.0004618362
2008-01-04 -0.0794059651
2008-01-07 -0.0134755807
2008-01-08 -0.0366345755
2008-01-09  0.0464935031
> tail(AAPL.rtn)
           AAPL.Adjusted
2013-12-23   0.037659405
2013-12-24  -0.004254036
2013-12-26  -0.006663266
2013-12-27  -0.006779487
2013-12-30  -0.009994628
2013-12-31   0.011653710
```

#### Drop 1st row for returns
```r
> AAPL.rtn <-AAPL.rtn[2:nrow(AAPL.rtn), ] 
> dim(AAPL.rtn)
[1] 1510    1
```

#### Calculate summary statistics for log returns for adjusted close price	
```r
> install.packages("fBasics")
Installing package into ‘C:/Users/Alexa~Chutian/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
also installing the dependencies ‘timeDate’, ‘timeSeries’, ‘gss’, ‘stabledist’

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/timeDate_3012.100.zip'
Content type 'application/zip' length 792160 bytes (773 KB)
downloaded 773 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/timeSeries_3022.101.2.zip'
Content type 'application/zip' length 1587933 bytes (1.5 MB)
downloaded 1.5 MB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/gss_2.1-7.zip'
Content type 'application/zip' length 876066 bytes (855 KB)
downloaded 855 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/stabledist_0.7-1.zip'
Content type 'application/zip' length 41914 bytes (40 KB)
downloaded 40 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/fBasics_3011.87.zip'
Content type 'application/zip' length 1558291 bytes (1.5 MB)
downloaded 1.5 MB

package ‘timeDate’ successfully unpacked and MD5 sums checked
package ‘timeSeries’ successfully unpacked and MD5 sums checked
package ‘gss’ successfully unpacked and MD5 sums checked
package ‘stabledist’ successfully unpacked and MD5 sums checked
package ‘fBasics’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Alexa~Chutian\AppData\Local\Temp\Rtmponaecl\downloaded_packages
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

Warning messages:
1: package ‘fBasics’ was built under R version 3.3.3 
2: package ‘timeDate’ was built under R version 3.3.3 
3: package ‘timeSeries’ was built under R version 3.3.3 
> basicStats(AAPL.rtn)
            AAPL.Adjusted
nobs          1510.000000
NAs              0.000000
Minimum         -0.197470
Maximum          0.130194
1. Quartile     -0.010065
3. Quartile      0.012745
Mean             0.000723
Median           0.001208
Sum              1.091230
SE Mean          0.000582
LCL Mean        -0.000419
UCL Mean         0.001864
Variance         0.000512
Stdev            0.022619
Skewness        -0.546244
Kurtosis         7.073274
```

#### Conduct t-test re: mean return of 0
```r
> t.test(AAPL.rtn)

        One Sample t-test

data:  AAPL.rtn
t = 1.2415, df = 1509, p-value = 0.2146
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 -0.0004191037  0.0018644411
sample estimates:
   mean of x 
0.0007226687 
```

#### Conduct Skewness Test
```r
> s3=skewness(AAPL.rtn) 
> T=length(AAPL.rtn) 
> s3/sqrt(6/T)
[1] -8.665623
attr(,"method")
[1] "moment"
```

#### Conduct Kurtosis Test – must use excess kurtosis here
```r
> s4=kurtosis(AAPL.rtn)
> T=length(AAPL.rtn) 
> s4/sqrt(24/T)
[1] 56.10523
attr(,"method")
[1] "excess"
```

#### Conduct Jarque-Bera Normality Test
```r
> normalTest(AAPL.rtn , method='jb')

Title:
 Jarque - Bera Normalality Test

Test Results:
  STATISTIC:
    X-squared: 3234.9373
  P VALUE:
    Asymptotic p Value: < 2.2e-16 

Description:
 Mon Apr 24 16:46:37 2017 by user: Alexa~Chutian

Warning message:
In if (class(x) == "fREG") x = residuals(x) :
  the condition has length > 1 and only the first element will be used
```

## Monthly Data

#### Calculate monthly log returns
```r
> AAPL.mo.rtn <- periodReturn(AAPL, period='monthly', type='log', leading='True')
> dim(AAPL.mo.rtn)
[1] 72  1
> head(AAPL.mo.rtn)
           monthly.returns
2008-01-31     -0.38672276
2008-02-29     -0.07946415
2008-03-31      0.13786128
2008-04-30      0.19243288
2008-05-30      0.08165544
2008-06-30     -0.11979827
> tail(AAPL.mo.rtn)
           monthly.returns
2013-07-31     0.132102298
2013-08-30     0.073861775
2013-09-30    -0.021723603
2013-10-31     0.092015440
2013-11-29     0.061886508
2013-12-31     0.008862406
```

#### Import data for S&P 500 from Yahoo
```r
> getSymbols('SPY', from="2008-01-01", to="2013-12-31") 
[1] "SPY"
> head(SPY)
           SPY.Open SPY.High SPY.Low SPY.Close SPY.Volume SPY.Adjusted
2008-01-02   146.53   146.99  143.88    144.93  204935600     119.3533
2008-01-03   144.91   145.49  144.07    144.86  125133300     119.2957
2008-01-04   143.34   143.44  140.91    141.31  232330900     116.3721
2008-01-07   141.81   142.23  140.10    141.19  234991000     116.2733
2008-01-08   142.08   142.90  138.44    138.91  326365700     114.3957
2008-01-09   139.09   140.79  137.70    140.37  301824900     115.5980
> tail(SPY)
           SPY.Open SPY.High SPY.Low SPY.Close SPY.Volume SPY.Adjusted
2013-12-23   182.45   182.64  182.07    182.53   85598000     170.9805
2013-12-24   182.54   183.01  182.53    182.93   45368800     171.3552
2013-12-26   183.34   183.96  183.32    183.86   63365000     172.2263
2013-12-27   184.10   184.18  183.66    183.85   61814000     172.2170
2013-12-30   183.87   184.02  183.58    183.82   56857000     172.1889
2013-12-31   184.07   184.69  183.93    184.69   86119900     173.0038
```

#### Calculate monthly log returns
```r
> SPY.mo.rtn <- periodReturn(SPY, period='monthly', type='log', leading='True')
> dim(SPY.mo.rtn) 
[1] 72  1
> head(SPY.mo.rtn) 
           monthly.returns
2008-01-31     -0.06455220
2008-02-29     -0.02618231
2008-03-31     -0.01392103
2008-04-30      0.04656130
2008-05-30      0.01500341
2008-06-30     -0.09226532
> tail(SPY.mo.rtn)
           monthly.returns
2013-07-31      0.05038594
2013-08-30     -0.03045134
2013-09-30      0.02629351
2013-10-31      0.04526659
2013-11-29      0.02920697
2013-12-31      0.02018172
```

#### Save histograms with 20 buckets
```r
> pdf('AAPL_Histogram.pdf', width=10) 
> hist(AAPL.mo.rtn, nclass=20) 
> dev.off()
windows 
      2 
> pdf('SPY_Histogram.pdf', width=10) 
> hist(SPY.mo.rtn, nclass=20) 
> dev.off()
windows 
      2 
```

#### Pearson correlation between Apple and S&P monthly returns
```r
> cor(AAPL.mo.rtn, SPY.mo.rtn)
                monthly.returns
monthly.returns       0.5737038
```

#### Covariance between Apple and S&P monthly returns
```r
> cov(AAPL.mo.rtn, SPY.mo.rtn)
                monthly.returns
monthly.returns     0.003191284
```

#### Combine Apple and S&P monthly returns into matrix for analysis
```r
> monthly<-data.frame(SPY=SPY.mo.rtn, AAPL=AAPL.mo.rtn) 
> names(monthly)[1]<-"SPY"
> names(monthly)[2]<-"AAPL"
> cor(monthly)
           SPY      AAPL
SPY  1.0000000 0.5737038
AAPL 0.5737038 1.0000000
> pdf('Scatterplot.pdf', width=10)
> plot(monthly[1:2], xlab='S&P 500 Monthly Log Returns', ylab='Apple Monthly Log Returns')
> title(main='Scatterplot') 
> dev.off()
windows 
      2 
> summary(lm(AAPL~SPY, data=monthly))

Call:
lm(formula = AAPL ~ SPY, data = monthly)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.32212 -0.04111  0.00890  0.05188  0.16417 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.01063    0.01035   1.027    0.308    
SPY          1.16548    0.19888   5.860 1.38e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.08769 on 70 degrees of freedom
Multiple R-squared:  0.3291,    Adjusted R-squared:  0.3196 
F-statistic: 34.34 on 1 and 70 DF,  p-value: 1.38e-07
```

#### Run linear market model
> R-squared is % of movement in stock explained by movements in overall market
> Beta indicates whether asset is more or less volatile than overall market
```r
> summary(lm(AAPL.mo.rtn ~ SPY.mo.rtn))

Call:
lm(formula = AAPL.mo.rtn ~ SPY.mo.rtn)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.32212 -0.04111  0.00890  0.05188  0.16417 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.01063    0.01035   1.027    0.308    
SPY.mo.rtn   1.16548    0.19888   5.860 1.38e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.08769 on 70 degrees of freedom
Multiple R-squared:  0.3291,    Adjusted R-squared:  0.3196 
F-statistic: 34.34 on 1 and 70 DF,  p-value: 1.38e-07
```

#### Compute beta directly
```r
> cov(AAPL.mo.rtn, SPY.mo.rtn)/ var(SPY.mo.rtn)
                monthly.returns
monthly.returns        1.165484
```

#### Export data to TXT file – then can copy and paste into Excel
```r
> write.table(monthly, "Monthly.txt", sep='\t', col.names = NA)
```
