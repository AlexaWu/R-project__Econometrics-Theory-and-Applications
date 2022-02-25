```r
> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
> setwd('C:/#Baruch/Econometrics/A&P')
```

## AR Models

#### Import Dataset
```r
> ExportM12 = read.csv ("ExportM12.csv")
> attach(ExportM12)
> names(ExportM12)
[1] "period"      "month"       "sales"       "sales_lag1"  "sales_lag2" 
[6] "ln_sales"    "sales_D1"    "ln_sales_D1"
```

#### Drop 1st and 2nd observations for lagged models
```r
> Data1_AR1<-subset(ExportM12, period>1)
> Data1_AR2<-subset(ExportM12, period>2)
```

#### AR(1) Model
```r
> summary (lm(sales ~ sales_lag1, data= Data1_AR1))

Call:
lm(formula = sales ~ sales_lag1, data = Data1_AR1)

Residuals:
    Min      1Q  Median      3Q     Max 
-338625 -175660  -21901  183347  450159 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)   
(Intercept) 1.023e+06  3.006e+05   3.402  0.00177 **
sales_lag1  4.737e-01  1.537e-01   3.082  0.00413 **
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 221500 on 33 degrees of freedom
Multiple R-squared:  0.2235,    Adjusted R-squared:    0.2 
F-statistic: 9.501 on 1 and 33 DF,  p-value: 0.004128
```

#### AR(2) Model
```r
> summary (lm(sales ~ sales_lag1 + sales_lag2, data= Data1_AR2))

Call:
lm(formula = sales ~ sales_lag1 + sales_lag2, data = Data1_AR2)

Residuals:
    Min      1Q  Median      3Q     Max 
-452562 -166802  -26799  183174  370182 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)  
(Intercept) 7.766e+05  3.478e+05   2.232   0.0329 *
sales_lag1  3.666e-01  1.753e-01   2.091   0.0449 *
sales_lag2  2.356e-01  1.758e-01   1.340   0.1901  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 220500 on 31 degrees of freedom
Multiple R-squared:  0.2728,    Adjusted R-squared:  0.2259 
F-statistic: 5.814 on 2 and 31 DF,  p-value: 0.007175
```

## Regression Discontinuity Designs

#### Import Dataset
```r
> ExportM13 = read.csv ("ExportM13.csv")
> attach(ExportM13)
The following objects are masked from ExportM12:

    month, period, sales, sales_lag1

> names(ExportM13)
[1] "period"     "month"      "sales"      "sales_lag1" "regime"    
```

#### Drop 1st observation for first lag
```r
> Data_AR1<-subset(ExportM13, period>1)
```

#### Regime Dummy Variable
```r
> summary (lm(sales ~ sales_lag1 + regime, data=Data_AR1))

Call:
lm(formula = sales ~ sales_lag1 + regime, data = Data_AR1)

Residuals:
    Min      1Q  Median      3Q     Max 
-420277 -108412   12820  136371  382569 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  1.873e+06  3.978e+05   4.707 4.64e-05 ***
sales_lag1   8.947e-02  1.911e-01   0.468  0.64284    
regime      -2.815e+05  9.636e+04  -2.921  0.00634 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 199900 on 32 degrees of freedom
Multiple R-squared:  0.387,     Adjusted R-squared:  0.3487 
F-statistic:  10.1 on 2 and 32 DF,  p-value: 0.0003973
```

#### Chow Test
```r
> install.packages("strucchange") 
Installing package into ‘C:/Users/Alexa~Chutian/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/strucchange_1.5-1.zip'
Content type 'application/zip' length 789495 bytes (770 KB)
downloaded 770 KB

package ‘strucchange’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Alexa~Chutian\AppData\Local\Temp\RtmpEhvECb\downloaded_packages
> library(strucchange)
Loading required package: zoo

Attaching package: ‘zoo’

The following objects are masked from ‘package:base’:

    as.Date, as.Date.numeric

Loading required package: sandwich
Warning messages:
1: package ‘strucchange’ was built under R version 3.3.3 
2: package ‘zoo’ was built under R version 3.3.3 
3: package ‘sandwich’ was built under R version 3.3.3 
> sctest(sales ~ sales_lag1, data=Data_AR1, type = "Chow", point=24)

        Chow test

data:  sales ~ sales_lag1
F = 2.7293, p-value = 0.08094
```
