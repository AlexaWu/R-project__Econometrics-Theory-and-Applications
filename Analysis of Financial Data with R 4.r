> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
> setwd('C:/#Baruch/Econometrics/Financial Data')
> da = read.table("Data2.txt", header=T) 
> head(da)
      date      intc        sp
1 19730131  0.010050 -0.017111
2 19730228 -0.139303 -0.037490
3 19730330  0.069364 -0.001433
4 19730430  0.086486 -0.040800
5 19730531 -0.104478 -0.018884
6 19730629  0.133333 -0.006575
> intc=log(da$intc+1) 
> length(intc)
[1] 444
> t.test(intc)

        One Sample t-test

data:  intc
t = 2.3788, df = 443, p-value = 0.01779
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 0.00249032 0.02616428
sample estimates:
mean of x 
0.0143273 

> SE=1/(sqrt(length(intc))) 
> 2*SE
[1] 0.0949158
> acf(intc, lag=12, plot=FALSE) 

Autocorrelations of series ‘intc’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.020  0.024  0.082 -0.050 -0.023  0.022 -0.121 -0.085 -0.019  0.026 
    11     12 
-0.064  0.055 
> acf(intc, lag=12)
> Box.test(intc, lag=12, type='Ljung')

        Box-Ljung test

data:  intc
X-squared = 18.676, df = 12, p-value = 0.09665

> acf(intc, lag=24, plot=FALSE)

Autocorrelations of series ‘intc’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.020  0.024  0.082 -0.050 -0.023  0.022 -0.121 -0.085 -0.019  0.026 
    11     12     13     14     15     16     17     18     19     20     21 
-0.064  0.055 -0.053 -0.126  0.020  0.007 -0.021 -0.013  0.056 -0.011  0.084 
    22     23     24 
-0.030 -0.050  0.010 
> acf(intc, lag=24)
> Box.test(intc, lag=24, type='Ljung')

        Box-Ljung test

data:  intc
X-squared = 34.208, df = 24, p-value = 0.08103
 
> SE=1/(sqrt(length(intc))) 
> 2*SE
[1] 0.0949158
> acf(abs(intc), lag=24, plot=FALSE)

Autocorrelations of series ‘abs(intc)’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.196  0.176  0.187  0.155  0.182  0.144  0.134  0.142  0.133  0.125 
    11     12     13     14     15     16     17     18     19     20     21 
 0.056  0.141  0.136  0.109  0.051  0.038  0.026 -0.004  0.095  0.034  0.032 
    22     23     24 
-0.033 -0.049  0.026 
> acf(abs(intc), lag=24)
> Box.test(abs(intc), lag=12, type='Ljung')

        Box-Ljung test

data:  abs(intc)
X-squared = 124.91, df = 12, p-value < 2.2e-16

> acf((intc^2), lag=24, plot=FALSE)

Autocorrelations of series ‘(intc^2)’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.151  0.197  0.201  0.137  0.122  0.099  0.138  0.081  0.090  0.059 
    11     12     13     14     15     16     17     18     19     20     21 
 0.018  0.189  0.064  0.142  0.075  0.005  0.010  0.001  0.049  0.001  0.071 
    22     23     24 
-0.014 -0.035  0.007 
> acf((intc^2), lag=24)
> Box.test((intc^2), lag=12, type='Ljung')

        Box-Ljung test

data:  (intc^2)
X-squared = 98.783, df = 12, p-value = 9.992e-16

> y = intc - mean(intc)
> Box.test(y^2, lag=12, type='Ljung')

        Box-Ljung test

data:  y^2
X-squared = 92.939, df = 12, p-value = 1.332e-14

> install.packages("FinTS") 
Installing package into ‘C:/Users/Alexa~Chutian/Documents/R/win-library/3.4’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
also installing the dependency ‘zoo’

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/zoo_1.8-0.zip'
Content type 'application/zip' length 901320 bytes (880 KB)
downloaded 880 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/FinTS_0.4-5.zip'
Content type 'application/zip' length 3699164 bytes (3.5 MB)
downloaded 3.5 MB

package ‘zoo’ successfully unpacked and MD5 sums checked
package ‘FinTS’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Alexa~Chutian\AppData\Local\Temp\RtmponfCxu\downloaded_packages
> library(FinTS)
Loading required package: zoo

Attaching package: ‘zoo’

The following objects are masked from ‘package:base’:

    as.Date, as.Date.numeric

> ArchTest(y, lags=12, demean=FALSE)

        ARCH LM-test; Null hypothesis: no ARCH effects

data:  y
Chi-squared = 53.901, df = 12, p-value = 2.847e-07
 
> SE=1/(sqrt(length(y))) 
> 2*SE
[1] 0.0949158
> acf((y^2), lag=24, plot=FALSE) 

Autocorrelations of series ‘(y^2)’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.145  0.208  0.196  0.133  0.116  0.088  0.121  0.076  0.083  0.060 
    11     12     13     14     15     16     17     18     19     20     21 
 0.009  0.184  0.052  0.125  0.061  0.006  0.010 -0.007  0.050 -0.005  0.081 
    22     23     24 
-0.012 -0.033  0.014 
> acf((y^2), lag=24)
> pacf((y^2), lag=24, plot=FALSE) 

Partial autocorrelations of series ‘(y^2)’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
 0.145  0.190  0.152  0.062  0.037  0.014  0.062  0.016  0.025  0.001 -0.046 
    12     13     14     15     16     17     18     19     20     21     22 
 0.161  0.009  0.065 -0.019 -0.070 -0.046 -0.026  0.039 -0.013  0.066 -0.042 
    23     24 
-0.044 -0.015 
> pacf((y^2), lag=24)
> install.packages("fGarch") 
Installing package into ‘C:/Users/Alexa~Chutian/Documents/R/win-library/3.4’
(as ‘lib’ is unspecified)
also installing the dependencies ‘gss’, ‘stabledist’, ‘timeDate’, ‘timeSeries’, ‘fBasics’

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/gss_2.1-7.zip'
Content type 'application/zip' length 875570 bytes (855 KB)
downloaded 855 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/stabledist_0.7-1.zip'
Content type 'application/zip' length 42044 bytes (41 KB)
downloaded 41 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/timeDate_3012.100.zip'
Content type 'application/zip' length 805561 bytes (786 KB)
downloaded 786 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/timeSeries_3022.101.2.zip'
Content type 'application/zip' length 1618338 bytes (1.5 MB)
downloaded 1.5 MB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/fBasics_3011.87.zip'
Content type 'application/zip' length 1557651 bytes (1.5 MB)
downloaded 1.5 MB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.4/fGarch_3010.82.1.zip'
Content type 'application/zip' length 447671 bytes (437 KB)
downloaded 437 KB

package ‘gss’ successfully unpacked and MD5 sums checked
package ‘stabledist’ successfully unpacked and MD5 sums checked
package ‘timeDate’ successfully unpacked and MD5 sums checked
package ‘timeSeries’ successfully unpacked and MD5 sums checked
package ‘fBasics’ successfully unpacked and MD5 sums checked
package ‘fGarch’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Alexa~Chutian\AppData\Local\Temp\RtmponfCxu\downloaded_packages
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
> m3_1=garchFit(~1+garch(3,0), data=intc, trace=F) 
> summary(m3_1)

Title:
 GARCH Modelling 

Call:
 garchFit(formula = ~1 + garch(3, 0), data = intc, trace = F) 

Mean and Variance Equation:
 data ~ 1 + garch(3, 0)
<environment: 0x0000000008782dc0>
 [data = intc]

Conditional Distribution:
 norm 

Coefficient(s):
      mu     omega    alpha1    alpha2    alpha3  
0.012567  0.010421  0.232889  0.075069  0.051994  

Std. Errors:
 based on Hessian 

Error Analysis:
        Estimate  Std. Error  t value Pr(>|t|)    
mu      0.012567    0.005515    2.279   0.0227 *  
omega   0.010421    0.001238    8.418   <2e-16 ***
alpha1  0.232889    0.111541    2.088   0.0368 *  
alpha2  0.075069    0.047305    1.587   0.1125    
alpha3  0.051994    0.045139    1.152   0.2494    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Log Likelihood:
 303.9607    normalized:  0.6845963 

Description:
 Thu May 11 20:29:59 2017 by user: Alexa~Chutian 


Standardised Residuals Tests:
                                Statistic p-Value     
 Jarque-Bera Test   R    Chi^2  203.362   0           
 Shapiro-Wilk Test  R    W      0.9635971 4.898647e-09
 Ljung-Box Test     R    Q(10)  9.260782  0.5075463   
 Ljung-Box Test     R    Q(15)  19.36748  0.1975619   
 Ljung-Box Test     R    Q(20)  20.46983  0.4289059   
 Ljung-Box Test     R^2  Q(10)  7.322136  0.6947234   
 Ljung-Box Test     R^2  Q(15)  27.41532  0.02552908  
 Ljung-Box Test     R^2  Q(20)  28.15113  0.1058698   
 LM Arch Test       R    TR^2   25.23347  0.01375447  

Information Criterion Statistics:
      AIC       BIC       SIC      HQIC 
-1.346670 -1.300546 -1.346920 -1.328481 

> m1_1=garchFit(~1+garch(1,0), data=intc, trace=F) 
> summary(m1_1)

Title:
 GARCH Modelling 

Call:
 garchFit(formula = ~1 + garch(1, 0), data = intc, trace = F) 

Mean and Variance Equation:
 data ~ 1 + garch(1, 0)
<environment: 0x000000000755f7f8>
 [data = intc]

Conditional Distribution:
 norm 

Coefficient(s):
      mu     omega    alpha1  
0.013130  0.011046  0.374976  

Std. Errors:
 based on Hessian 

Error Analysis:
        Estimate  Std. Error  t value Pr(>|t|)    
mu      0.013130    0.005318    2.469  0.01355 *  
omega   0.011046    0.001196    9.238  < 2e-16 ***
alpha1  0.374976    0.112620    3.330  0.00087 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Log Likelihood:
 299.9247    normalized:  0.675506 

Description:
 Thu May 11 20:31:45 2017 by user: Alexa~Chutian 


Standardised Residuals Tests:
                                Statistic p-Value     
 Jarque-Bera Test   R    Chi^2  144.3783  0           
 Shapiro-Wilk Test  R    W      0.9678175 2.670321e-08
 Ljung-Box Test     R    Q(10)  12.12248  0.2769429   
 Ljung-Box Test     R    Q(15)  22.30705  0.1000019   
 Ljung-Box Test     R    Q(20)  24.33412  0.2281016   
 Ljung-Box Test     R^2  Q(10)  16.57807  0.08423723  
 Ljung-Box Test     R^2  Q(15)  37.44349  0.001089733 
 Ljung-Box Test     R^2  Q(20)  38.81395  0.007031558 
 LM Arch Test       R    TR^2   27.32897  0.006926821 

Information Criterion Statistics:
      AIC       BIC       SIC      HQIC 
-1.337499 -1.309824 -1.337589 -1.326585 

> m3_2=garchFit(~1+garch(3,0), data=intc, trace=F, cond.dist="std") 
> summary(m3_2)

Title:
 GARCH Modelling 

Call:
 garchFit(formula = ~1 + garch(3, 0), data = intc, cond.dist = "std", 
    trace = F) 

Mean and Variance Equation:
 data ~ 1 + garch(3, 0)
<environment: 0x0000000012c437b8>
 [data = intc]

Conditional Distribution:
 std 

Coefficient(s):
      mu     omega    alpha1    alpha2    alpha3     shape  
0.018215  0.009887  0.145692  0.115486  0.111302  5.974097  

Std. Errors:
 based on Hessian 

Error Analysis:
        Estimate  Std. Error  t value Pr(>|t|)    
mu      0.018215    0.005216    3.492 0.000479 ***
omega   0.009887    0.001457    6.784 1.17e-11 ***
alpha1  0.145692    0.093614    1.556 0.119634    
alpha2  0.115486    0.067772    1.704 0.088374 .  
alpha3  0.111302    0.064311    1.731 0.083509 .  
shape   5.974097    1.466776    4.073 4.64e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Log Likelihood:
 321.5741    normalized:  0.724266 

Description:
 Thu May 11 20:32:26 2017 by user: Alexa~Chutian 


Standardised Residuals Tests:
                                Statistic p-Value     
 Jarque-Bera Test   R    Chi^2  266.7279  0           
 Shapiro-Wilk Test  R    W      0.9589488 8.639001e-10
 Ljung-Box Test     R    Q(10)  8.904513  0.541189    
 Ljung-Box Test     R    Q(15)  19.17938  0.2057202   
 Ljung-Box Test     R    Q(20)  20.06478  0.4538842   
 Ljung-Box Test     R^2  Q(10)  6.04517   0.8114541   
 Ljung-Box Test     R^2  Q(15)  25.73662  0.04088386  
 Ljung-Box Test     R^2  Q(20)  26.72014  0.1433229   
 LM Arch Test       R    TR^2   25.1032   0.01434135  

Information Criterion Statistics:
      AIC       BIC       SIC      HQIC 
-1.421505 -1.366156 -1.421864 -1.399678 

> m1_2=garchFit(~1+garch(1,0), data=intc, trace=F, cond.dist="std") 
> summary(m1_2)

Title:
 GARCH Modelling 

Call:
 garchFit(formula = ~1 + garch(1, 0), data = intc, cond.dist = "std", 
    trace = F) 

Mean and Variance Equation:
 data ~ 1 + garch(1, 0)
<environment: 0x00000000053d2160>
 [data = intc]

Conditional Distribution:
 std 

Coefficient(s):
      mu     omega    alpha1     shape  
0.017202  0.011816  0.277476  5.970266  

Std. Errors:
 based on Hessian 

Error Analysis:
        Estimate  Std. Error  t value Pr(>|t|)    
mu      0.017202    0.005195    3.311 0.000929 ***
omega   0.011816    0.001560    7.574 3.62e-14 ***
alpha1  0.277476    0.107183    2.589 0.009631 ** 
shape   5.970266    1.529524    3.903 9.49e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Log Likelihood:
 315.0899    normalized:  0.709662 

Description:
 Thu May 11 20:32:37 2017 by user: Alexa~Chutian 


Standardised Residuals Tests:
                                Statistic p-Value     
 Jarque-Bera Test   R    Chi^2  157.7799  0           
 Shapiro-Wilk Test  R    W      0.9663975 1.488224e-08
 Ljung-Box Test     R    Q(10)  12.8594   0.2316396   
 Ljung-Box Test     R    Q(15)  23.40632  0.07588561  
 Ljung-Box Test     R    Q(20)  25.374    0.1874956   
 Ljung-Box Test     R^2  Q(10)  19.96092  0.02962445  
 Ljung-Box Test     R^2  Q(15)  42.55549  0.0001845089
 Ljung-Box Test     R^2  Q(20)  44.06739  0.00147397  
 LM Arch Test       R    TR^2   29.76071  0.003033508 

Information Criterion Statistics:
      AIC       BIC       SIC      HQIC 
-1.401306 -1.364407 -1.401466 -1.386755 

> m3_3=garchFit(~1+garch(3,0), data=intc, trace=F, cond.dist="sstd") 
> summary(m3_3)

Title:
 GARCH Modelling 

Call:
 garchFit(formula = ~1 + garch(3, 0), data = intc, cond.dist = "sstd", 
    trace = F) 

Mean and Variance Equation:
 data ~ 1 + garch(3, 0)
<environment: 0x0000000009224960>
 [data = intc]

Conditional Distribution:
 sstd 

Coefficient(s):
       mu      omega     alpha1     alpha2     alpha3       skew      shape  
0.0150283  0.0098585  0.1593526  0.1144401  0.0955587  0.8888927  6.4582365  

Std. Errors:
 based on Hessian 

Error Analysis:
        Estimate  Std. Error  t value Pr(>|t|)    
mu      0.015028    0.005510    2.727 0.006382 ** 
omega   0.009858    0.001397    7.055 1.72e-12 ***
alpha1  0.159353    0.092535    1.722 0.085056 .  
alpha2  0.114440    0.067131    1.705 0.088244 .  
alpha3  0.095559    0.059347    1.610 0.107358    
skew    0.888893    0.065457   13.580  < 2e-16 ***
shape   6.458236    1.700553    3.798 0.000146 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Log Likelihood:
 322.8954    normalized:  0.7272418 

Description:
 Thu May 11 20:32:49 2017 by user: Alexa~Chutian 


Standardised Residuals Tests:
                                Statistic p-Value     
 Jarque-Bera Test   R    Chi^2  252.0227  0           
 Shapiro-Wilk Test  R    W      0.9599619 1.247534e-09
 Ljung-Box Test     R    Q(10)  8.835075  0.547824    
 Ljung-Box Test     R    Q(15)  19.04072  0.2118947   
 Ljung-Box Test     R    Q(20)  19.94742  0.461223    
 Ljung-Box Test     R^2  Q(10)  6.212811  0.7970781   
 Ljung-Box Test     R^2  Q(15)  26.08523  0.03713634  
 Ljung-Box Test     R^2  Q(20)  26.97459  0.1359805   
 LM Arch Test       R    TR^2   25.27191  0.01358566  

Information Criterion Statistics:
      AIC       BIC       SIC      HQIC 
-1.422952 -1.358378 -1.423439 -1.397487 

> m1_3=garchFit(~1+garch(1,0), data=intc, trace=F, cond.dist="sstd") 
> summary(m1_3)

Title:
 GARCH Modelling 

Call:
 garchFit(formula = ~1 + garch(1, 0), data = intc, cond.dist = "sstd", 
    trace = F) 

Mean and Variance Equation:
 data ~ 1 + garch(1, 0)
<environment: 0x0000000009306118>
 [data = intc]

Conditional Distribution:
 sstd 

Coefficient(s):
      mu     omega    alpha1      skew     shape  
0.013850  0.011659  0.284494  0.877621  6.523036  

Std. Errors:
 based on Hessian 

Error Analysis:
        Estimate  Std. Error  t value Pr(>|t|)    
mu      0.013850    0.005460    2.536 0.011197 *  
omega   0.011659    0.001472    7.920 2.44e-15 ***
alpha1  0.284494    0.101951    2.790 0.005263 ** 
skew    0.877621    0.061376   14.299  < 2e-16 ***
shape   6.523036    1.811716    3.600 0.000318 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Log Likelihood:
 316.9137    normalized:  0.7137695 

Description:
 Thu May 11 20:32:58 2017 by user: Alexa~Chutian 


Standardised Residuals Tests:
                                Statistic p-Value     
 Jarque-Bera Test   R    Chi^2  156.6034  0           
 Shapiro-Wilk Test  R    W      0.9663426 1.455423e-08
 Ljung-Box Test     R    Q(10)  12.79133  0.235574    
 Ljung-Box Test     R    Q(15)  23.34224  0.07713885  
 Ljung-Box Test     R    Q(20)  25.2944   0.1903993   
 Ljung-Box Test     R^2  Q(10)  20.033    0.02894214  
 Ljung-Box Test     R^2  Q(15)  42.96521  0.0001594213
 Ljung-Box Test     R^2  Q(20)  44.31549  0.001365164 
 LM Arch Test       R    TR^2   30.02046  0.002772693 

Information Criterion Statistics:
      AIC       BIC       SIC      HQIC 
-1.405017 -1.358892 -1.405266 -1.386827 

> r_m1_1=residuals(m1_1,standardize=T)
> SE=1/(sqrt(length(y))) 
> 2*SE
[1] 0.0949158
> acf(r_m1_1, lag=24)
> acf(r_m1_1, lag=24, plot=FALSE)

Autocorrelations of series ‘r_m1_1’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.012  0.038  0.089 -0.056 -0.029  0.019 -0.083 -0.076 -0.012  0.018 
    11     12     13     14     15     16     17     18     19     20     21 
-0.036  0.057 -0.055 -0.121 -0.007 -0.010 -0.021 -0.022  0.058  0.004  0.084 
    22     23     24 
-0.045 -0.046  0.006 
> pacf((r_m1_1^2), lag=24)
> pacf((r_m1_1^2), lag=24, plot=FALSE)

Partial autocorrelations of series ‘(r_m1_1^2)’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
-0.054  0.105  0.052  0.045  0.036  0.031  0.034  0.043  0.083  0.045 -0.063 
    12     13     14     15     16     17     18     19     20     21     22 
 0.157  0.046  0.063 -0.044 -0.018 -0.015 -0.037  0.029 -0.016  0.119 -0.010 
    23     24 
-0.061 -0.028 
> Box.test(r_m1_1, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m1_1
X-squared = 14.199, df = 12, p-value = 0.2882

> Box.test(r_m1_1^2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m1_1^2
X-squared = 32.438, df = 12, p-value = 0.001184

> r_m3_1=residuals(m3_1,standardize=T)
> SE=1/(sqrt(length(y))) 
> 2*SE
[1] 0.0949158
> acf(r_m3_1, lag=24)
> acf(r_m3_1, lag=24, plot=FALSE)

Autocorrelations of series ‘r_m3_1’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.020  0.017  0.065 -0.045 -0.019  0.023 -0.079 -0.077 -0.003  0.021 
    11     12     13     14     15     16     17     18     19     20     21 
-0.027  0.067 -0.065 -0.112 -0.003 -0.006 -0.014 -0.029  0.036  0.001  0.082 
    22     23     24 
-0.054 -0.051  0.009 
> pacf((r_m3_1^2), lag=24)
> pacf((r_m3_1^2), lag=24, plot=FALSE)

Partial autocorrelations of series ‘(r_m3_1^2)’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
-0.038  0.014  0.003  0.039  0.027  0.021  0.036  0.061  0.086  0.012 -0.047 
    12     13     14     15     16     17     18     19     20     21     22 
 0.187  0.042  0.047 -0.016 -0.017 -0.025 -0.042  0.019 -0.020  0.125 -0.012 
    23     24 
-0.038 -0.027 
> Box.test(r_m3_1, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m3_1
X-squared = 11.623, df = 12, p-value = 0.4764

> Box.test(r_m3_1^2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m3_1^2
X-squared = 25.471, df = 12, p-value = 0.01274

> r_m1_2=residuals(m1_2,standardize=T)
> acf(r_m1_2, lag=24)
> acf(r_m1_2, lag=24, plot=FALSE)

Autocorrelations of series ‘r_m1_2’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.013  0.035  0.092 -0.057 -0.028  0.020 -0.087 -0.077 -0.015  0.020 
    11     12     13     14     15     16     17     18     19     20     21 
-0.041  0.056 -0.052 -0.124 -0.004 -0.006 -0.020 -0.022  0.058  0.001  0.085 
    22     23     24 
-0.042 -0.048  0.007 
> pacf((r_m1_2^2), lag=24)
> pacf((r_m1_2^2), lag=24, plot=FALSE)

Partial autocorrelations of series ‘(r_m1_2^2)’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
-0.036  0.125  0.061  0.051  0.044  0.033  0.038  0.043  0.072  0.042 -0.063 
    12     13     14     15     16     17     18     19     20     21     22 
 0.162  0.041  0.062 -0.042 -0.028 -0.017 -0.036  0.033 -0.017  0.112 -0.016 
    23     24 
-0.061 -0.028 
> Box.test(r_m1_2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m1_2
X-squared = 15.036, df = 12, p-value = 0.2395

> Box.test(r_m1_2^2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m1_2^2
X-squared = 36.959, df = 12, p-value = 0.0002268

> r_m3_2=residuals(m3_2,standardize=T)
> acf(r_m3_2, lag=24)
> acf(r_m3_2, lag=24, plot=FALSE)

Autocorrelations of series ‘r_m3_2’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.029  0.011  0.052 -0.040 -0.016  0.025 -0.081 -0.080  0.001  0.023 
    11     12     13     14     15     16     17     18     19     20     21 
-0.023  0.067 -0.072 -0.110 -0.002 -0.001 -0.008 -0.035  0.025  0.000  0.082 
    22     23     24 
-0.057 -0.054  0.009 
> pacf((r_m3_2^2), lag=24)
> pacf((r_m3_2^2), lag=24, plot=FALSE)

Partial autocorrelations of series ‘(r_m3_2^2)’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
-0.027 -0.008 -0.022  0.033  0.021  0.008  0.033  0.063  0.080  0.006 -0.040 
    12     13     14     15     16     17     18     19     20     21     22 
 0.196  0.033  0.035 -0.001 -0.021 -0.024 -0.044  0.021 -0.020  0.130 -0.018 
    23     24 
-0.030 -0.026 
> Box.test(r_m3_2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m3_2
X-squared = 11.207, df = 12, p-value = 0.5113

> Box.test(r_m3_2^2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m3_2^2
X-squared = 24.736, df = 12, p-value = 0.01612

> r_m1_3=residuals(m1_3,standardize=T)
> acf(r_m1_3, lag=24)
> acf(r_m1_3, lag=24, plot=FALSE)

Autocorrelations of series ‘r_m1_3’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.014  0.036  0.092 -0.057 -0.028  0.019 -0.087 -0.077 -0.014  0.019 
    11     12     13     14     15     16     17     18     19     20     21 
-0.040  0.055 -0.054 -0.124 -0.004 -0.007 -0.021 -0.021  0.057  0.001  0.085 
    22     23     24 
-0.042 -0.047  0.008 
> pacf((r_m1_3^2), lag=24)
> pacf((r_m1_3^2), lag=24, plot=FALSE)

Partial autocorrelations of series ‘(r_m1_3^2)’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
-0.037  0.124  0.061  0.050  0.043  0.034  0.040  0.043  0.075  0.040 -0.063 
    12     13     14     15     16     17     18     19     20     21     22 
 0.163  0.042  0.065 -0.043 -0.029 -0.018 -0.034  0.029 -0.018  0.109 -0.015 
    23     24 
-0.061 -0.028 
> Box.test(r_m1_3, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m1_3
X-squared = 14.94, df = 12, p-value = 0.2447

> Box.test(r_m1_3^2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m1_3^2
X-squared = 37.056, df = 12, p-value = 0.0002188

> r_m3_3=residuals(m3_2,standardize=T)
> acf(r_m3_3, lag=24)
> acf(r_m3_3, lag=24, plot=FALSE)

Autocorrelations of series ‘r_m3_3’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.029  0.011  0.052 -0.040 -0.016  0.025 -0.081 -0.080  0.001  0.023 
    11     12     13     14     15     16     17     18     19     20     21 
-0.023  0.067 -0.072 -0.110 -0.002 -0.001 -0.008 -0.035  0.025  0.000  0.082 
    22     23     24 
-0.057 -0.054  0.009 
> pacf((r_m3_3^2), lag=24)
> pacf((r_m3_3^2), lag=24, plot=FALSE)

Partial autocorrelations of series ‘(r_m3_3^2)’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
-0.027 -0.008 -0.022  0.033  0.021  0.008  0.033  0.063  0.080  0.006 -0.040 
    12     13     14     15     16     17     18     19     20     21     22 
 0.196  0.033  0.035 -0.001 -0.021 -0.024 -0.044  0.021 -0.020  0.130 -0.018 
    23     24 
-0.030 -0.026 
> Box.test(r_m3_3, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m3_3
X-squared = 11.207, df = 12, p-value = 0.5113

> Box.test(r_m3_3^2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_m3_3^2
X-squared = 24.736, df = 12, p-value = 0.01612

> mm1=garchFit(~1+garch(1,1), data= intc, trace=F) 
> summary(mm1)

Title:
 GARCH Modelling 

Call:
 garchFit(formula = ~1 + garch(1, 1), data = intc, trace = F) 

Mean and Variance Equation:
 data ~ 1 + garch(1, 1)
<environment: 0x0000000008c52330>
 [data = intc]

Conditional Distribution:
 norm 

Coefficient(s):
        mu       omega      alpha1       beta1  
0.01126568  0.00091902  0.08643831  0.85258554  

Std. Errors:
 based on Hessian 

Error Analysis:
        Estimate  Std. Error  t value Pr(>|t|)    
mu     0.0112657   0.0053931    2.089  0.03672 *  
omega  0.0009190   0.0003888    2.364  0.01808 *  
alpha1 0.0864383   0.0265439    3.256  0.00113 ** 
beta1  0.8525855   0.0394322   21.622  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Log Likelihood:
 312.3307    normalized:  0.7034475 

Description:
 Thu May 11 20:37:37 2017 by user: Alexa~Chutian 


Standardised Residuals Tests:
                                Statistic p-Value     
 Jarque-Bera Test   R    Chi^2  174.904   0           
 Shapiro-Wilk Test  R    W      0.9709615 1.030282e-07
 Ljung-Box Test     R    Q(10)  8.016844  0.6271916   
 Ljung-Box Test     R    Q(15)  15.5006   0.4159946   
 Ljung-Box Test     R    Q(20)  16.41549  0.6905368   
 Ljung-Box Test     R^2  Q(10)  0.8746345 0.9999072   
 Ljung-Box Test     R^2  Q(15)  11.35935  0.7267295   
 Ljung-Box Test     R^2  Q(20)  12.55994  0.8954573   
 LM Arch Test       R    TR^2   10.51401  0.5709617   

Information Criterion Statistics:
      AIC       BIC       SIC      HQIC 
-1.388877 -1.351978 -1.389037 -1.374326 

> mm2=garchFit(~1+garch(1,1), data= intc, trace=F, cond.dist="std") 
> summary(mm2)

Title:
 GARCH Modelling 

Call:
 garchFit(formula = ~1 + garch(1, 1), data = intc, cond.dist = "std", 
    trace = F) 

Mean and Variance Equation:
 data ~ 1 + garch(1, 1)
<environment: 0x00000000091b52a8>
 [data = intc]

Conditional Distribution:
 std 

Coefficient(s):
       mu      omega     alpha1      beta1      shape  
0.0165075  0.0011576  0.1059030  0.8171313  6.7723503  

Std. Errors:
 based on Hessian 

Error Analysis:
        Estimate  Std. Error  t value Pr(>|t|)    
mu     0.0165075   0.0051031    3.235 0.001217 ** 
omega  0.0011576   0.0005782    2.002 0.045286 *  
alpha1 0.1059030   0.0372047    2.846 0.004420 ** 
beta1  0.8171313   0.0580141   14.085  < 2e-16 ***
shape  6.7723503   1.8572388    3.646 0.000266 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Log Likelihood:
 326.2264    normalized:  0.734744 

Description:
 Thu May 11 20:37:46 2017 by user: Alexa~Chutian 


Standardised Residuals Tests:
                                Statistic p-Value     
 Jarque-Bera Test   R    Chi^2  203.4933  0           
 Shapiro-Wilk Test  R    W      0.9687607 3.970603e-08
 Ljung-Box Test     R    Q(10)  7.877778  0.6407741   
 Ljung-Box Test     R    Q(15)  15.5522   0.4124197   
 Ljung-Box Test     R    Q(20)  16.50475  0.6848581   
 Ljung-Box Test     R^2  Q(10)  1.066054  0.9997694   
 Ljung-Box Test     R^2  Q(15)  11.49875  0.7165045   
 Ljung-Box Test     R^2  Q(20)  12.61496  0.8932865   
 LM Arch Test       R    TR^2   10.80739  0.5454935   

Information Criterion Statistics:
      AIC       BIC       SIC      HQIC 
-1.446966 -1.400841 -1.447215 -1.428776 

> mm3=garchFit(~1+garch(1,1), data= intc, trace=F, cond.dist="sstd") 
> summary(mm3)

Title:
 GARCH Modelling 

Call:
 garchFit(formula = ~1 + garch(1, 1), data = intc, cond.dist = "sstd", 
    trace = F) 

Mean and Variance Equation:
 data ~ 1 + garch(1, 1)
<environment: 0x0000000008b35b10>
 [data = intc]

Conditional Distribution:
 sstd 

Coefficient(s):
       mu      omega     alpha1      beta1       skew      shape  
0.0133343  0.0011621  0.1049289  0.8177875  0.8717220  7.2344225  

Std. Errors:
 based on Hessian 

Error Analysis:
        Estimate  Std. Error  t value Pr(>|t|)    
mu     0.0133343   0.0053430    2.496 0.012572 *  
omega  0.0011621   0.0005587    2.080 0.037519 *  
alpha1 0.1049289   0.0358860    2.924 0.003456 ** 
beta1  0.8177875   0.0559863   14.607  < 2e-16 ***
skew   0.8717220   0.0629129   13.856  < 2e-16 ***
shape  7.2344225   2.1018042    3.442 0.000577 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Log Likelihood:
 328.0995    normalized:  0.7389628 

Description:
 Thu May 11 20:37:55 2017 by user: Alexa~Chutian 


Standardised Residuals Tests:
                                Statistic p-Value     
 Jarque-Bera Test   R    Chi^2  195.2178  0           
 Shapiro-Wilk Test  R    W      0.9692506 4.892686e-08
 Ljung-Box Test     R    Q(10)  7.882126  0.6403496   
 Ljung-Box Test     R    Q(15)  15.62496  0.4074054   
 Ljung-Box Test     R    Q(20)  16.5774   0.6802193   
 Ljung-Box Test     R^2  Q(10)  1.078429  0.9997569   
 Ljung-Box Test     R^2  Q(15)  11.95155  0.6826923   
 Ljung-Box Test     R^2  Q(20)  13.03792  0.8757513   
 LM Arch Test       R    TR^2   11.18826  0.5128574   

Information Criterion Statistics:
      AIC       BIC       SIC      HQIC 
-1.450899 -1.395550 -1.451257 -1.429071 

> r_mm1=residuals(mm1,standardize=T)
> SE=1/(sqrt(length(y))) 
> 2*SE
[1] 0.0949158
> acf(r_mm1, lag=24)
> acf(r_mm1, lag=24, plot=FALSE)

Autocorrelations of series ‘r_mm1’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.034  0.028  0.057 -0.036 -0.008  0.021 -0.082 -0.061 -0.010  0.011 
    11     12     13     14     15     16     17     18     19     20     21 
-0.024  0.050 -0.069 -0.092 -0.003 -0.009 -0.009 -0.028  0.031  0.010  0.076 
    22     23     24 
-0.065 -0.046  0.009 
> pacf((r_mm1^2), lag=24) 
> pacf((r_mm1^2), lag=24, plot=FALSE)

Partial autocorrelations of series ‘(r_mm1^2)’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
-0.017 -0.003  0.002 -0.006  0.002 -0.006 -0.001  0.033  0.019 -0.012 -0.053 
    12     13     14     15     16     17     18     19     20     21     22 
 0.129  0.025  0.054 -0.010 -0.008 -0.020 -0.041  0.019 -0.020  0.088 -0.017 
    23     24 
-0.032  0.001 
> Box.test(r_mm1, lag=12, type='Ljung')

        Box-Ljung test

data:  r_mm1
X-squared = 9.4104, df = 12, p-value = 0.6675

> Box.test(r_mm1^2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_mm1^2
X-squared = 9.8678, df = 12, p-value = 0.6276

> r_mm2=residuals(mm2,standardize=T)
> acf(r_mm2, lag=24)
> acf(r_mm2, lag=24, plot=FALSE)

Autocorrelations of series ‘r_mm2’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.035  0.028  0.055 -0.035 -0.008  0.021 -0.081 -0.063 -0.010  0.012 
    11     12     13     14     15     16     17     18     19     20     21 
-0.023  0.051 -0.070 -0.093 -0.004 -0.010 -0.007 -0.031  0.030  0.009  0.077 
    22     23     24 
-0.066 -0.046  0.009 
> pacf((r_mm2^2), lag=24) 
> pacf((r_mm2^2), lag=24, plot=FALSE)

Partial autocorrelations of series ‘(r_mm2^2)’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
-0.025 -0.010 -0.005 -0.009 -0.004 -0.012 -0.006  0.031  0.018 -0.010 -0.053 
    12     13     14     15     16     17     18     19     20     21     22 
 0.131  0.025  0.045 -0.013 -0.004 -0.017 -0.039  0.021 -0.019  0.101 -0.015 
    23     24 
-0.030 -0.001 
> Box.test(r_mm2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_mm2
X-squared = 9.3431, df = 12, p-value = 0.6734

> Box.test(r_mm2^2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_mm2^2
X-squared = 10.444, df = 12, p-value = 0.5771

> r_mm3=residuals(mm3,standardize=T)
> acf(r_mm3, lag=24)
> acf(r_mm3, lag=24, plot=FALSE)

Autocorrelations of series ‘r_mm3’, by lag

     0      1      2      3      4      5      6      7      8      9     10 
 1.000  0.035  0.027  0.055 -0.035 -0.008  0.022 -0.081 -0.063 -0.009  0.012 
    11     12     13     14     15     16     17     18     19     20     21 
-0.023  0.051 -0.070 -0.094 -0.004 -0.010 -0.008 -0.030  0.030  0.009  0.077 
    22     23     24 
-0.066 -0.046  0.009 
> pacf((r_mm3^2), lag=24) 
> pacf((r_mm3^2), lag=24, plot=FALSE)

Partial autocorrelations of series ‘(r_mm3^2)’, by lag

     1      2      3      4      5      6      7      8      9     10     11 
-0.024 -0.010 -0.004 -0.010 -0.003 -0.010 -0.004  0.032  0.019 -0.012 -0.053 
    12     13     14     15     16     17     18     19     20     21     22 
 0.133  0.027  0.050 -0.011 -0.005 -0.018 -0.038  0.020 -0.019  0.098 -0.016 
    23     24 
-0.030 -0.002 
> Box.test(r_mm3, lag=12, type='Ljung')

        Box-Ljung test

data:  r_mm3
X-squared = 9.3388, df = 12, p-value = 0.6738

> Box.test(r_mm3^2, lag=12, type='Ljung')

        Box-Ljung test

data:  r_mm3^2
X-squared = 10.703, df = 12, p-value = 0.5545
