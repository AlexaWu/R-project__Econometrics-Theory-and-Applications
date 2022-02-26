```r
> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
```

#### Set working directory
```r
> setwd('C:/#Baruch/Econometrics/Financial Data')
```

#### Import Dataset from Tsay
```r
> Data1 = read.table ("Data1.txt", header=T)
> head(Data1)
      date    ibmrtn     vwrtn     ewrtn     sprtn
1 19260130 -0.010381  0.000724  0.023174  0.022472
2 19260227 -0.024476 -0.033374 -0.053510 -0.043956
3 19260331 -0.115591 -0.064341 -0.096824 -0.059113
4 19260430  0.089783  0.038358  0.032946  0.022688
5 19260528  0.036932  0.012172  0.001035  0.007679
6 19260630  0.068493  0.056888  0.050487  0.043184
```

#### Using CRSP (Center for Research in Security Prices) Equal-Weighted Index data
```r
> ew=Data1$ewrtn
```

#### Partial ACF
```r
> acf(ew, lag=12) 
> pacf(ew, lag=12)
> acf(ew, lag=12, plot=FALSE) 

Autocorrelations of series ‘ew’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.214  0.011 -0.104 -0.059  0.000 -0.041  0.016  0.023  0.130  0.070 
    11     12 
-0.008  0.016 
> pacf(ew, lag=12, plot=FALSE)

Partial autocorrelations of series ‘ew’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
 0.214 -0.036 -0.103 -0.015  0.017 -0.059  0.030  0.016  0.120  0.019 -0.023 
    12 
 0.049 
```

#### Asymptotic standard error limit for approximately two standard errors
> Lags 1 and 9 are significant at 5% level, i.e. PACF twice the SE
```r
> SE=1/(sqrt(length(ew)))
> 2*SE
[1] 0.06337243
```

#### Use maximum likelihood estimation on autoregressive model	
> AIC finds AR(9) is the identified order
```r
> mm1=ar(ew, method='mle') 
> mm1$order
[1] 9
```

#### Install FitAR package for AIC and BIC options
```r
> install.packages("FitAR")
Warning in install.packages("FitAR") :
  'lib = "C:/Program Files/R/R-3.4.0/library"' is not writable
--- Please select a CRAN mirror for use in this session ---
also installing the dependencies ‘iterators’, ‘foreach’, ‘glmnet’, ‘grpreg’, ‘leaps’, ‘ltsa’, ‘bestglm’


  There is a binary version available but the source version is later:
       binary source needs_compilation
glmnet  2.0-9 2.0-10              TRUE

  Binaries will be installed
trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/iterators_1.0.8.zip'
Content type 'application/zip' length 319267 bytes (311 KB)
downloaded 311 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/foreach_1.4.3.zip'
Content type 'application/zip' length 389532 bytes (380 KB)
downloaded 380 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/glmnet_2.0-9.zip'
Content type 'application/zip' length 1723104 bytes (1.6 MB)
downloaded 1.6 MB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/grpreg_3.0-2.zip'
Content type 'application/zip' length 510337 bytes (498 KB)
downloaded 498 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/leaps_3.0.zip'
Content type 'application/zip' length 328734 bytes (321 KB)
downloaded 321 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/ltsa_1.4.6.zip'
Content type 'application/zip' length 504966 bytes (493 KB)
downloaded 493 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/bestglm_0.36.zip'
Content type 'application/zip' length 957643 bytes (935 KB)
downloaded 935 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/FitAR_1.94.zip'
Content type 'application/zip' length 1297096 bytes (1.2 MB)
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
        C:\Users\Alexa~Chutian\AppData\Local\Temp\RtmpKqEpiD\downloaded_packages
> library(FitAR)
Loading required package: lattice
Loading required package: leaps
Loading required package: ltsa
Loading required package: bestglm
```

#### AIC finds AR(9)
```r
> SelectModel(ew, lag.max=12, ARModel="AR", Best=1, Criterion="AIC")
[1] 9
> SelectModel(ew, lag.max=12, ARModel="AR", Best=12, Criterion="AIC")
    p AIC-Exact AIC-Approx
1   9 -5246.232  -57.27905
2  10 -5244.592  -55.82027
3  11 -5243.127  -56.28671
4   3 -5238.500  -49.28697
5   4 -5236.766  -47.58065
6   6 -5236.561  -47.96688
7   7 -5235.417  -46.23777
8   5 -5235.058  -49.10412
9   8 -5233.686  -58.91513
10  1 -5230.288  -42.12479
11  2 -5229.637  -51.01969
12  0 -5185.562  -42.77294
```

#### BIC finds AR(1)
```r
> SelectModel(ew, lag.max=12, ARModel="AR", Best=1, Criterion="BIC")
[1] 1
> SelectModel(ew, lag.max=12, ARModel="AR", Best=12, Criterion="BIC")
    p BIC-Exact BIC-Approx
1   1 -5220.481 -27.413552
2   3 -5218.885 -24.768231
3   2 -5214.926 -31.404706
4   4 -5212.248 -18.158169
5   5 -5205.636 -14.777886
6   6 -5202.235  -8.736899
7   9 -5197.194  -3.337832
8   7 -5196.187  -2.104048
9  10 -5190.651   3.024696
10  8 -5189.552  -9.877655
11 11 -5184.282   7.462007
12  0 -5180.658 -32.965447
```

#### Fitting an AR(1) Model
> (p, d, q) are the AR order, the degree of differencing, and the MA order
> AIC is -2401.76
```r
> arima(ew, order=c(1,0,0))

Call:
arima(x = ew, order = c(1, 0, 0))

Coefficients:
         ar1  intercept
      0.2140     0.0122
s.e.  0.0309     0.0029

sigma^2 estimated as 0.005219:  log likelihood = 1203.88,  aic = -2401.76
```

#### Fitting an AR(3) Model
> AIC is -2409.98
```r
> arima(ew, order=c(3, 0, 0))

Call:
arima(x = ew, order = c(3, 0, 0))

Coefficients:
         ar1      ar2      ar3  intercept
      0.2184  -0.0142  -0.1047     0.0123
s.e.  0.0315   0.0323   0.0317     0.0025

sigma^2 estimated as 0.005156:  log likelihood = 1209.99,  aic = -2409.98
```

#### Fitting an AR(9) Model
> AIC is -2417.71
```r
> arima(ew, order=c(9, 0, 0))

Call:
arima(x = ew, order = c(9, 0, 0))

Coefficients:
         ar1      ar2      ar3      ar4     ar5      ar6     ar7      ar8
      0.2172  -0.0167  -0.0990  -0.0211  0.0344  -0.0525  0.0275  -0.0091
s.e.  0.0314   0.0322   0.0323   0.0324  0.0324   0.0324  0.0323   0.0323
         ar9  intercept
      0.1210     0.0122
s.e.  0.0316     0.0028

sigma^2 estimated as 0.005054:  log likelihood = 1219.85,  aic = -2417.71
```

#### Fitting an AR(9) Model but just allow lags 1, 3, 9 and intercept to be estimated
> AIC is -2425.53
```r
> arima(ew, order=c(9, 0, 0), fixed=c(NA,0,NA,0,0,0,0,0,NA,NA))

Call:
arima(x = ew, order = c(9, 0, 0), fixed = c(NA, 0, NA, 0, 0, 0, 0, 0, NA, NA))

Coefficients:
         ar1  ar2      ar3  ar4  ar5  ar6  ar7  ar8     ar9  intercept
      0.2125    0  -0.1028    0    0    0    0    0  0.1225     0.0122
s.e.  0.0305    0   0.0307    0    0    0    0    0  0.0307     0.0029

sigma^2 estimated as 0.005075:  log likelihood = 1217.76,  aic = -2425.53
Warning message:
In arima(ew, order = c(9, 0, 0), fixed = c(NA, 0, NA, 0, 0, 0, 0,  :
  some AR parameters were fixed: setting transform.pars = FALSE
```

#### Out-of-sample prediction at forecast origin Feb 2008 (row 986) for AR(9)
> i.e. Check the reliability of predictions we would have made Mar-Dec 2008
```r
> ar9=arima(ew[1:986], order=c(9, 0, 0), fixed=c(NA,0,NA,0,0,0,0,0,NA,NA)) 
Warning message:
In arima(ew[1:986], order = c(9, 0, 0), fixed = c(NA, 0, NA, 0,  :
  some AR parameters were fixed: setting transform.pars = FALSE
> ar9

Call:
arima(x = ew[1:986], order = c(9, 0, 0), fixed = c(NA, 0, NA, 0, 0, 0, 0, 0, 
    NA, NA))

Coefficients:
         ar1  ar2      ar3  ar4  ar5  ar6  ar7  ar8     ar9  intercept
      0.2060    0  -0.1052    0    0    0    0    0  0.1204     0.0128
s.e.  0.0307    0   0.0308    0    0    0    0    0  0.0307     0.0029

sigma^2 estimated as 0.005044:  log likelihood = 1208.53,  aic = -2407.06
```

#### Point forecast and standard error of prediction
```r                          
> predict(ar9,10)
$pred
Time Series:
Start = 987 
End = 996 
Frequency = 1 
 [1] 0.005628834 0.010538320 0.012994586 0.015073113 0.014017046 0.002178244
 [7] 0.007494061 0.004639567 0.008032268 0.011485358

$se
Time Series:
Start = 987 
End = 996 
Frequency = 1 
 [1] 0.07102406 0.07251543 0.07257804 0.07290066 0.07296034 0.07296620
 [7] 0.07296813 0.07296934 0.07296957 0.07346720
```

#### For MA Model use ACF to determine the right lag order
> Lags 1 and 9 are significant at 5% level, i.e. ACF twice the SE
```r
> acf(ew, lag=12, plot=FALSE)

Autocorrelations of series ‘ew’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.214  0.011 -0.104 -0.059  0.000 -0.041  0.016  0.023  0.130  0.070 
    11     12 
-0.008  0.016 
> SE=1/(sqrt(length(ew))) 
> 2*SE
[1] 0.06337243
```

#### Fitting an MA(9) Model
> AIC is -2419.72
```r
> arima(ew, order=c(0, 0, 9))

Call:
arima(x = ew, order = c(0, 0, 9))

Coefficients:
         ma1     ma2      ma3      ma4     ma5      ma6     ma7      ma8
      0.2144  0.0374  -0.1203  -0.0425  0.0232  -0.0302  0.0482  -0.0276
s.e.  0.0316  0.0321   0.0328   0.0336  0.0319   0.0318  0.0364   0.0354
         ma9  intercept
      0.1350     0.0122
s.e.  0.0323     0.0028

sigma^2 estimated as 0.005043:  log likelihood = 1220.86,  aic = -2419.72
```

#### Fitting refined MA(9) Model since only lags 1, 3, 9 and intercept are significant
> AIC is -2421.22
```r
> arima(ew, order=c(0, 0, 9), fixed=c(NA,0,NA,0,0,0,0,0,NA,NA))

Call:
arima(x = ew, order = c(0, 0, 9), fixed = c(NA, 0, NA, 0, 0, 0, 0, 0, NA, NA))

Coefficients:
         ma1  ma2      ma3  ma4  ma5  ma6  ma7  ma8     ma9  intercept
      0.1909    0  -0.1199    0    0    0    0    0  0.1227     0.0122
s.e.  0.0293    0   0.0338    0    0    0    0    0  0.0312     0.0027

sigma^2 estimated as 0.005097:  log likelihood = 1215.61,  aic = -2421.22
```

#### Out-of-sample prediction at forecast origin Feb 2008 (row 986) for AR(9)
> i.e. Check the reliability of predictions we would have made Mar-Dec 2008
```r
> ma9=arima(ew[1:986], order=c(0, 0, 9), fixed=c(NA,0,NA,0,0,0,0,0,NA,NA)) 
> ma9

Call:
arima(x = ew[1:986], order = c(0, 0, 9), fixed = c(NA, 0, NA, 0, 0, 0, 0, 0, 
    NA, NA))

Coefficients:
         ma1  ma2      ma3  ma4  ma5  ma6  ma7  ma8     ma9  intercept
      0.1844    0  -0.1206    0    0    0    0    0  0.1218     0.0128
s.e.  0.0295    0   0.0338    0    0    0    0    0  0.0312     0.0027

sigma^2 estimated as 0.005066:  log likelihood = 1206.44,  aic = -2402.88
```

#### Point forecast and standard error of prediction
```r
> predict(ma9,10)
$pred
Time Series:
Start = 987 
End = 996 
Frequency = 1 
 [1] 0.004282626 0.013558874 0.015024191 0.014453445 0.012046343 0.001805558
 [7] 0.012211538 0.005514814 0.008513456 0.012791824

$se
Time Series:
Start = 987 
End = 996 
Frequency = 1 
 [1] 0.07117456 0.07237493 0.07237493 0.07288176 0.07288176 0.07288176
 [7] 0.07288176 0.07288176 0.07288176 0.07339566
