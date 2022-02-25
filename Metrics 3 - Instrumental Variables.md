```r
> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
> setwd('C:/#Baruch/Econometrics/A&P')
```

## Stage 1 of 2SLS (no SE Adjustment)

#### Import Dataset
```r
> ExportM10 = read.csv ("ExportM10.csv") 
> attach(ExportM10)
> names(ExportM10)
[1] "ï..Student" "Grade"      "Hours"      "Flood"     
```

#### OLS Regression without IV
```r
> summary (lm(Grade ~ Hours, data=ExportM10))

Call:
lm(formula = Grade ~ Hours, data = ExportM10)

Residuals:
    Min      1Q  Median      3Q     Max 
-16.768  -4.768   1.623   5.318  13.318 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  63.4627     2.4085  26.350  < 2e-16 ***
Hours         3.3049     0.5031   6.569 3.69e-08 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 7.367 on 47 degrees of freedom
Multiple R-squared:  0.4787,    Adjusted R-squared:  0.4676 
F-statistic: 43.15 on 1 and 47 DF,  p-value: 3.687e-08
```

#### Stage 1 of 2SLS using standard OLS
```r
> summary (lm(Hours ~ Flood, data=ExportM10))

Call:
lm(formula = Hours ~ Flood, data = ExportM10)

Residuals:
    Min      1Q  Median      3Q     Max 
-3.9688 -1.0588 -0.0588  1.0312  4.0312 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   4.9688     0.3400  14.612  < 2e-16 ***
Flood        -1.9099     0.5773  -3.308  0.00181 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.924 on 47 degrees of freedom
Multiple R-squared:  0.1889,    Adjusted R-squared:  0.1716 
F-statistic: 10.94 on 1 and 47 DF,  p-value: 0.001806
```

## Stage 2 of 2SLS (no SE Adjustment)

#### Import Dataset
```r
> ExportM11 = read.csv ("ExportM11.csv") 
> attach(ExportM11)
The following objects are masked from ExportM10:

    Flood, Grade, Hours, ï..Student

> names(ExportM11)
[1] "ï..Student" "Grade"      "Pred_Hours" "Hours"      "Flood"     
```

#### Stage 2 of 2SLS using standard OLS
```r
> summary (lm(Grade ~ Pred_Hours, data=ExportM11))

Call:
lm(formula = Grade ~ Pred_Hours, data = ExportM11)

Residuals:
    Min      1Q  Median      3Q     Max 
-23.118  -7.125   1.875   7.875  13.875 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   61.895      6.651   9.306  3.1e-12 ***
Pred_Hours     3.669      1.511   2.428   0.0191 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 9.617 on 47 degrees of freedom
Multiple R-squared:  0.1114,    Adjusted R-squared:  0.09252 
F-statistic: 5.894 on 1 and 47 DF,  p-value: 0.01908
```

## Direct IV Regression (with SE Adjustment)

#### Import Dataset
```r
> ExportM11 = read.csv ("ExportM11.csv") 
> attach(ExportM11)
The following objects are masked from ExportM11 (pos = 3):

    Flood, Grade, Hours, ï..Student, Pred_Hours

The following objects are masked from ExportM10:

    Flood, Grade, Hours, ï..Student

> names(ExportM11)
[1] "ï..Student" "Grade"      "Pred_Hours" "Hours"      "Flood"     
```

#### Install package
```r
> install.packages("AER") 
Installing package into ‘C:/Users/Alexa~Chutian/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
also installing the dependencies ‘minqa’, ‘nloptr’, ‘Rcpp’, ‘RcppEigen’, ‘lme4’, ‘SparseM’, ‘MatrixModels’, ‘pbkrtest’, ‘quantreg’, ‘car’, ‘Formula’

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/minqa_1.2.4.zip'
Content type 'application/zip' length 624655 bytes (610 KB)
downloaded 610 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/nloptr_1.0.4.zip'
Content type 'application/zip' length 1172880 bytes (1.1 MB)
downloaded 1.1 MB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/Rcpp_0.12.9.zip'
Content type 'application/zip' length 3247423 bytes (3.1 MB)
downloaded 3.1 MB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/RcppEigen_0.3.2.9.1.zip'
Content type 'application/zip' length 2117600 bytes (2.0 MB)
downloaded 2.0 MB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/lme4_1.1-12.zip'
Content type 'application/zip' length 4768944 bytes (4.5 MB)
downloaded 4.5 MB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/SparseM_1.76.zip'
Content type 'application/zip' length 934958 bytes (913 KB)
downloaded 913 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/MatrixModels_0.4-1.zip'
Content type 'application/zip' length 196027 bytes (191 KB)
downloaded 191 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/pbkrtest_0.4-7.zip'
Content type 'application/zip' length 195933 bytes (191 KB)
downloaded 191 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/quantreg_5.29.zip'
Content type 'application/zip' length 2206606 bytes (2.1 MB)
downloaded 2.1 MB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/car_2.1-4.zip'
Content type 'application/zip' length 1482390 bytes (1.4 MB)
downloaded 1.4 MB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/Formula_1.2-1.zip'
Content type 'application/zip' length 163536 bytes (159 KB)
downloaded 159 KB

trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/AER_1.2-5.zip'
Content type 'application/zip' length 2457902 bytes (2.3 MB)
downloaded 2.3 MB

package ‘minqa’ successfully unpacked and MD5 sums checked
package ‘nloptr’ successfully unpacked and MD5 sums checked
package ‘Rcpp’ successfully unpacked and MD5 sums checked
package ‘RcppEigen’ successfully unpacked and MD5 sums checked
package ‘lme4’ successfully unpacked and MD5 sums checked
package ‘SparseM’ successfully unpacked and MD5 sums checked
package ‘MatrixModels’ successfully unpacked and MD5 sums checked
package ‘pbkrtest’ successfully unpacked and MD5 sums checked
package ‘quantreg’ successfully unpacked and MD5 sums checked
package ‘car’ successfully unpacked and MD5 sums checked
package ‘Formula’ successfully unpacked and MD5 sums checked
package ‘AER’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Alexa~Chutian\AppData\Local\Temp\Rtmp0EeOS3\downloaded_packages
> library(AER)
Loading required package: car
Loading required package: lmtest
Loading required package: zoo

Attaching package: ‘zoo’

The following objects are masked from ‘package:base’:

    as.Date, as.Date.numeric

Loading required package: sandwich
Loading required package: survival
Warning messages:
1: package ‘AER’ was built under R version 3.3.3 
2: package ‘car’ was built under R version 3.3.3 
3: package ‘lmtest’ was built under R version 3.3.3 
4: package ‘zoo’ was built under R version 3.3.3 
5: package ‘sandwich’ was built under R version 3.3.3 
```

#### Direct IV Regression
```r
> ivmodel = ivreg(Grade ~ Hours | Flood, data=ExportM11) 
> summary(ivmodel)

Call:
ivreg(formula = Grade ~ Hours | Flood, data = ExportM11)

Residuals:
     Min       1Q   Median       3Q      Max 
-15.5640  -4.5707   0.7536   5.7671  13.4293 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   61.895      5.123  12.082 5.09e-16 ***
Hours          3.669      1.164   3.152  0.00282 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 7.408 on 47 degrees of freedom
Multiple R-Squared: 0.4729,     Adjusted R-squared: 0.4616 
Wald test: 9.935 on 1 and 47 DF,  p-value: 0.002823 
```
