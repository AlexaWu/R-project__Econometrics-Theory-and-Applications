```r
> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
```

## Autoregressive Models

#### Set working directory
```r
> setwd('C:/#Baruch/Econometrics/Financial Data')
```

#### Import Dataset
```r
> ExportT1 = read.csv ("ExportT1.csv")
> attach(ExportT1)
> names(ExportT1)
[1] "X"    "SPY"  "AAPL"
```

#### Pearson’s Correlation between Apple and S&P monthly returns
```r
> cor(AAPL, SPY)
[1] 0.5737038
```

#### Examine the SPY dataset
> Sample ACF for SPY
```r
> acf(SPY)
> acf(SPY, lag=10)
> f1=acf(SPY) 
> f1$acf
, , 1

              [,1]
 [1,]  1.000000000
 [2,]  0.237433093
 [3,] -0.015672930
 [4,]  0.173407987
 [5,]  0.255243730
 [6,] -0.033581461
 [7,] -0.265140934
 [8,] -0.065027861
 [9,]  0.109168840
[10,] -0.133572441
[11,] -0.095727195
[12,]  0.002882715
[13,]  0.072822672
[14,] -0.033134538
[15,] -0.134605236
[16,]  0.172546324
[17,]  0.079749803
[18,] -0.127319250
[19,] -0.004961150
```

#### T-Test for individual autocorrelations
> Lag 1 is given by ACF[2]
```r
> t1= f1$acf[2]*sqrt(length(SPY)) 
> t1
[1] 2.014687
```
> Lag 2 is given by ACF[3]
```r
> t2= f1$acf[3]*sqrt(length(SPY)) 
> t2
[1] -0.1329892
```

#### Portmanteau Statistic for entire ACF
> M as 12
```r
> Box.test(SPY, lag=12, type='Ljung')

        Box-Ljung test

data:  SPY
X-squared = 21.547, df = 12, p-value = 0.04292
```

> M as 24
```r
> Box.test(SPY, lag=24, type='Ljung')

        Box-Ljung test

data:  SPY
X-squared = 32.591, df = 24, p-value = 0.113
```

> M as natural log of T – which is given by “log” function in R	
```r
> Box.test(SPY, lag= log(length(SPY)), type='Ljung')

        Box-Ljung test

data:  SPY
X-squared = 11.676, df = 4.2767, p-value = 0.02442
```

#### Partial ACF for SPY
> Dashed lines are the two standard error limits; 5% significance
```r
> acf(SPY, lag=12)
> pacf(SPY, lag=12)
> acf(SPY, lag=12, plot=FALSE) 

Autocorrelations of series ‘SPY’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.237 -0.016  0.173  0.255 -0.034 -0.265 -0.065  0.109 -0.134 -0.096 
    11     12 
 0.003  0.073 
> pacf(SPY, lag=12, plot=FALSE)

Partial autocorrelations of series ‘SPY’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
 0.237 -0.076  0.208  0.175 -0.131 -0.264 -0.031  0.109 -0.077  0.100 -0.052 
    12 
-0.005 
```

#### Asymptotic standard error limit for approximately two standard errors
```r
> SE=1/(sqrt(length(SPY)))
> 2*SE
[1] 0.2357023
```
> Lags 1 and 6 are significant at 5% level

> Tsay uses maximum likelihood estimation on autoregressive model for SPY

#### Finds that AR(6) order minimizes AIC – i.e. the identified order is 6
> AIC
```r
> mm1=ar(SPY, method='mle') 
> mm1$order
[1] 6
```

#### Install FitAR package for AIC and BIC options
```r
> install.packages("FitAR")
Installing package into ‘C:/Users/Alexa~Chutian/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
also installing the dependencies ‘iterators’, ‘foreach’, ‘glmnet’, ‘grpreg’, ‘leaps’, ‘ltsa’, ‘bestglm’

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/iterators_1.0.8.zip'
Content type 'application/zip' length 316355 bytes (308 KB)
downloaded 308 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/foreach_1.4.3.zip'
Content type 'application/zip' length 389100 bytes (379 KB)
downloaded 379 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/glmnet_2.0-8.zip'
Content type 'application/zip' length 3557457 bytes (3.4 MB)
downloaded 3.4 MB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/grpreg_3.0-2.zip'
Content type 'application/zip' length 510033 bytes (498 KB)
downloaded 498 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/leaps_3.0.zip'
Content type 'application/zip' length 328487 bytes (320 KB)
downloaded 320 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/ltsa_1.4.6.zip'
Content type 'application/zip' length 504041 bytes (492 KB)
downloaded 492 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/bestglm_0.36.zip'
Content type 'application/zip' length 957376 bytes (934 KB)
downloaded 934 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/FitAR_1.94.zip'
Content type 'application/zip' length 1297934 bytes (1.2 MB)
downloaded 1.2 MB

package ‘iterators’ successfully unpacked and MD5 sums checked
package ‘foreach’ successfully unpacked and MD5 sums checked
package ‘glmnet’ successfully unpacked and MD5 sums checked
package ‘grpreg’ successfully unpacked and MD5 sums checked
package ‘leaps’ successfully unpacked and MD5 sums checked
package ‘ltsa’ successfully unpacked and MD5 sums checked
package ‘bestglm’ successfully unpacked and MD5 sums checked
package ‘FitAR’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Alexa~Chutian\AppData\Local\Temp\RtmpwVNYiQ\downloaded_packages
> library(FitAR)
Loading required package: lattice
Loading required package: leaps
Loading required package: ltsa
Loading required package: bestglm
Warning messages:
1: package ‘FitAR’ was built under R version 3.3.3 
2: package ‘leaps’ was built under R version 3.3.3 
3: package ‘bestglm’ was built under R version 3.3.3 
```

#### AIC finds
```r
> SelectModel(SPY, lag.max=12, ARModel="AR", Best=1, Criterion="AIC") 
[1] 6
> SelectModel(SPY, lag.max=12, ARModel="AR", Best=12, Criterion="AIC")
    p AIC-Exact AIC-Approx
1   6 -428.5632 -1.7082485
2   7 -426.6429 -1.1445869
3   1 -426.0691  1.2961074
4   8 -425.9230  0.4570643
5   4 -425.8665  0.3195733
6   3 -425.7097 -0.3592660
7   5 -425.1021 -3.6200251
8   2 -424.4736 -0.0778084
9   9 -424.2755  1.5937436
10  0 -423.8407 -0.2879934
11 10 -423.0346  3.5143097
12 11 -421.0911  5.4134322
```

#### BIC
```r
> SelectModel(SPY, lag.max=12, ARModel="AR", Best=1, Criterion="BIC") 
[1] 0
> SelectModel(SPY, lag.max=12, ARModel="AR", Best=12, Criterion="BIC")
    p BIC-Exact BIC-Approx
1   0 -421.5640   4.265339
2   1 -421.5158   8.126106
3   2 -417.6436   9.028856
4   3 -416.6030  11.024065
5   4 -414.4831  13.979570
6   6 -412.6265  16.505080
7   5 -411.4421  12.316638
8   7 -408.4295  19.345408
9   8 -405.4330  23.223725
10  9 -401.5089  26.637071
11 10 -397.9913  30.834303
12 11 -393.7712  35.010092
```

#### Fitting an AR(6) Model
> (p, d, q) are the AR order, the degree of differencing, and the MA order
> Note whether coefficient is at least twice magnitude of standard error
```r
> m6_1=arima(SPY, order=c(6,0,0))
> m6_1

Call:
arima(x = SPY, order = c(6, 0, 0))

Coefficients:
         ar1      ar2     ar3     ar4      ar5      ar6  intercept
      0.2075  -0.0181  0.1926  0.1858  -0.0553  -0.2782     0.0032
s.e.  0.1147   0.1156  0.1141  0.1130   0.1160   0.1159     0.0071

sigma^2 estimated as 0.002114:  log likelihood = 119.12,  aic = -222.24
```

#### Monthly data so test residuals using lag = 12
```r
> Box.test(m6_1$residuals, lag=12, type='Ljung')

        Box-Ljung test

data:  m6_1$residuals
X-squared = 2.8309, df = 12, p-value = 0.9966
```

> Since we used an AR(6) model with Q(12) Ljung-Box statistic

#### Recalculate p-value using 6 degrees of freedom
```r
> pv=1-pchisq(2.8309, 6)
> pv
[1] 0.8297518
```
