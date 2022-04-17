### Functions & Packages

**"Base" packages**: 

function | description
--|--
[getwd()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/getwd)|Get Working Directory
setwd()| Set Working Directory
[read.csv()](https://www.rdocumentation.org/packages/qtl2/versions/0.24/topics/read_csv)|Read a csv file
[attach()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/attach)|Attach Set of R Objects to Search Path
[names()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/names)|The Names of an Object
[summary()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/summary)|Object Summaries
[sqrt()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/MathFun)|computes the (principal) square root
[diag()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/diag)|Matrix Diagonals

**["stats" packages](https://www.rdocumentation.org/packages/stats/versions/3.6.2)**: 
function | description
--|--
[lm()](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/lm) | Fitting Linear Models
[glm()](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/glm) | Fitting Generalized Linear Models

**["sandwich" packages](https://www.rdocumentation.org/packages/sandwich/versions/3.0-1)**: 
function | description
--|--
[vcovHC()](https://www.rdocumentation.org/packages/sandwich/versions/3.0-1/topics/vcovHC)|Heteroscedasticity-Consistent Covariance Matrix Estimation


install.packages("lmtest"), library(lmtest), coeftest(,vcov=vcovHC)

------
### R codes

```r
> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
> setwd('C:/#Baruch/Econometrics/A&P')
```

## Single Variable OLS

#### Import Dataset
```r
> ExportM3=read.csv("ExportM3.csv")
> attach(ExportM3)
> names(ExportM3)
[1] "ID"    "Hours" "Grade"
```

#### Single Variable OLS Regression	
```r
> summary(lm(Grade~Hours,data=ExportM3))

Call:
lm(formula = Grade ~ Hours, data = ExportM3)

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

## Multiple Variable OLS

#### Import Dataset
```r
> ExportM4=read.csv("ExportM4.csv")
> attach(ExportM4)
The following objects are masked from ExportM3:

    Grade, Hours

> names(ExportM4)
[1] "Student" "Hours"   "Grade"   "Male"    "Econ"    "SAT"    
```

#### Multiple Variable OLS Regression
```r
> ols1<-lm(Grade~Hours+Male+Econ+SAT,data=ExportM4)
> summary(ols1)

Call:
lm(formula = Grade ~ Hours + Male + Econ + SAT, data = ExportM4)

Residuals:
     Min       1Q   Median       3Q      Max 
-14.0400  -2.9980  -0.3709   3.1506   9.7363 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 31.155090   9.570583   3.255 0.002182 ** 
Hours        2.634056   0.415731   6.336 1.08e-07 ***
Male        -0.802600   1.691180  -0.475 0.637434    
Econ         6.799451   1.876532   3.623 0.000749 ***
SAT          0.026314   0.007425   3.544 0.000948 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.663 on 44 degrees of freedom
Multiple R-squared:  0.7116,    Adjusted R-squared:  0.6854 
F-statistic: 27.14 on 4 and 44 DF,  p-value: 2.191e-11
```

#### White-corrected standard errors
```r
> install.packages("sandwich")
Installing package into ‘C:/Users/Alexa~Chutian/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/sandwich_2.3-4.zip'
Content type 'application/zip' length 504897 bytes (493 KB)
downloaded 493 KB

package ‘sandwich’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Alexa~Chutian\AppData\Local\Temp\Rtmpiwto6t\downloaded_packages
> library(sandwich)
Warning message:
package ‘sandwich’ was built under R version 3.3.3 
> sqrt(diag(vcovHC(ols1)))
 (Intercept)        Hours         Male         Econ          SAT 
12.071204516  0.405371356  1.895368359  1.925507628  0.009047153 
```

#### Recalc t-stats using heteroskedastic-robust standard errors
```r
> install.packages("lmtest")
Installing package into ‘C:/Users/Alexa~Chutian/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/lmtest_0.9-35.zip'
Content type 'application/zip' length 288633 bytes (281 KB)
downloaded 281 KB

package ‘lmtest’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Alexa~Chutian\AppData\Local\Temp\Rtmpiwto6t\downloaded_packages
> library(lmtest)
Loading required package: zoo

Attaching package: ‘zoo’

The following objects are masked from ‘package:base’:

    as.Date, as.Date.numeric

Warning messages:
1: package ‘lmtest’ was built under R version 3.3.3 
2: package ‘zoo’ was built under R version 3.3.3 
> coeftest(ols1,vcov=vcovHC)

t test of coefficients:

              Estimate Std. Error t value  Pr(>|t|)    
(Intercept) 31.1550899 12.0712045  2.5809 0.0132643 *  
Hours        2.6340558  0.4053714  6.4979 6.248e-08 ***
Male        -0.8025999  1.8953684 -0.4235 0.6740274    
Econ         6.7994505  1.9255076  3.5313 0.0009841 ***
SAT          0.0263145  0.0090472  2.9086 0.0056719 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

## Multicollinearity

#### Import Dataset
```r
> ExportM5=read.csv("ExportM5.csv")
> attach(ExportM5)
The following objects are masked from ExportM4:

    Econ, Grade, Hours, Male, SAT

The following objects are masked from ExportM3:

    Grade, Hours

> names(ExportM5)
 [1] "ï..Student" "Hours"      "Grade"      "Male"       "Female"    
 [6] "Econ"       "SAT"        "Half_SAT"   "ACT"        "NJ"        
[11] "PA"         "NY"         "CT"        
```

#### Multiple Variable OLS Regression
```r
> summary(lm(Grade~Hours+Male+Econ+SAT,data=ExportM5))

Call:
lm(formula = Grade ~ Hours + Male + Econ + SAT, data = ExportM5)

Residuals:
     Min       1Q   Median       3Q      Max 
-14.0400  -2.9980  -0.3709   3.1506   9.7363 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 31.155090   9.570583   3.255 0.002182 ** 
Hours        2.634056   0.415731   6.336 1.08e-07 ***
Male        -0.802600   1.691180  -0.475 0.637434    
Econ         6.799451   1.876532   3.623 0.000749 ***
SAT          0.026314   0.007425   3.544 0.000948 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.663 on 44 degrees of freedom
Multiple R-squared:  0.7116,    Adjusted R-squared:  0.6854 
F-statistic: 27.14 on 4 and 44 DF,  p-value: 2.191e-11
```

#### Perfect Multicollinearity & Dummy Variable Trap
```r
> summary(lm(Grade~Hours+Male+Econ+SAT+Half_SAT,data=ExportM5))

Call:
lm(formula = Grade ~ Hours + Male + Econ + SAT + Half_SAT, data = ExportM5)

Residuals:
     Min       1Q   Median       3Q      Max 
-14.0400  -2.9980  -0.3709   3.1506   9.7363 

Coefficients: (1 not defined because of singularities)
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 31.155090   9.570583   3.255 0.002182 ** 
Hours        2.634056   0.415731   6.336 1.08e-07 ***
Male        -0.802600   1.691180  -0.475 0.637434    
Econ         6.799451   1.876532   3.623 0.000749 ***
SAT          0.026314   0.007425   3.544 0.000948 ***
Half_SAT           NA         NA      NA       NA    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.663 on 44 degrees of freedom
Multiple R-squared:  0.7116,    Adjusted R-squared:  0.6854 
F-statistic: 27.14 on 4 and 44 DF,  p-value: 2.191e-11
```

#### Perfect Multicollinearity & Dummy Variable Trap
```r
> summary(lm(Grade~Hours+Male+Female+Econ+SAT,data=ExportM5))

Call:
lm(formula = Grade ~ Hours + Male + Female + Econ + SAT, data = ExportM5)

Residuals:
     Min       1Q   Median       3Q      Max 
-14.0400  -2.9980  -0.3709   3.1506   9.7363 

Coefficients: (1 not defined because of singularities)
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 31.155090   9.570583   3.255 0.002182 ** 
Hours        2.634056   0.415731   6.336 1.08e-07 ***
Male        -0.802600   1.691180  -0.475 0.637434    
Female             NA         NA      NA       NA    
Econ         6.799451   1.876532   3.623 0.000749 ***
SAT          0.026314   0.007425   3.544 0.000948 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.663 on 44 degrees of freedom
Multiple R-squared:  0.7116,    Adjusted R-squared:  0.6854 
F-statistic: 27.14 on 4 and 44 DF,  p-value: 2.191e-11
```

#### Perfect Multicollinearity & Dummy Variable Trap
```r
> summary(lm(Grade~Hours+Male+NJ+PA+CT+NY+Econ+SAT,data=ExportM5))

Call:
lm(formula = Grade ~ Hours + Male + NJ + PA + CT + NY + Econ + 
    SAT, data = ExportM5)

Residuals:
     Min       1Q   Median       3Q      Max 
-10.9164  -2.6211   0.3074   2.1210  10.4064 

Coefficients: (1 not defined because of singularities)
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 32.80252    9.04496   3.627 0.000787 ***
Hours        2.82116    0.39781   7.092 1.22e-08 ***
Male        -0.81790    1.60455  -0.510 0.612970    
NJ          -6.46221    2.36192  -2.736 0.009149 ** 
PA          -2.06690    2.36599  -0.874 0.387432    
CT          -4.03555    2.62069  -1.540 0.131272    
NY                NA         NA      NA       NA    
Econ         7.10177    1.77662   3.997 0.000261 ***
SAT          0.02712    0.00707   3.836 0.000424 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.297 on 41 degrees of freedom
Multiple R-squared:  0.7648,    Adjusted R-squared:  0.7247 
F-statistic: 19.05 on 7 and 41 DF,  p-value: 4.83e-11
```

#### drop a dummy
```r
> summary(lm(Grade~Hours+Male+NJ+PA+CT+Econ+SAT,data=ExportM5))

Call:
lm(formula = Grade ~ Hours + Male + NJ + PA + CT + Econ + SAT, 
    data = ExportM5)

Residuals:
     Min       1Q   Median       3Q      Max 
-10.9164  -2.6211   0.3074   2.1210  10.4064 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 32.80252    9.04496   3.627 0.000787 ***
Hours        2.82116    0.39781   7.092 1.22e-08 ***
Male        -0.81790    1.60455  -0.510 0.612970    
NJ          -6.46221    2.36192  -2.736 0.009149 ** 
PA          -2.06690    2.36599  -0.874 0.387432    
CT          -4.03555    2.62069  -1.540 0.131272    
Econ         7.10177    1.77662   3.997 0.000261 ***
SAT          0.02712    0.00707   3.836 0.000424 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.297 on 41 degrees of freedom
Multiple R-squared:  0.7648,    Adjusted R-squared:  0.7247 
F-statistic: 19.05 on 7 and 41 DF,  p-value: 4.83e-11
```

#### Imperfect Multicollinearity
```r
> summary(lm(Grade~Hours+Male+Econ+SAT+ACT,data=ExportM5))

Call:
lm(formula = Grade ~ Hours + Male + Econ + SAT + ACT, data = ExportM5)

Residuals:
     Min       1Q   Median       3Q      Max 
-13.2573  -2.6442  -0.3451   3.8685  10.3085 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 32.69983    9.74943   3.354 0.001671 ** 
Hours        2.63755    0.41674   6.329 1.21e-07 ***
Male        -0.54388    1.72000  -0.316 0.753372    
Econ         6.90004    1.88441   3.662 0.000682 ***
SAT         -0.01341    0.04529  -0.296 0.768587    
ACT          1.91424    2.15268   0.889 0.378825    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.676 on 43 degrees of freedom
Multiple R-squared:  0.7168,    Adjusted R-squared:  0.6839 
F-statistic: 21.77 on 5 and 43 DF,  p-value: 8.418e-11
```

## Quadratics

#### Import Dataset
```r
> ExportM6=read.csv("ExportM6.csv")
> attach(ExportM6)
The following objects are masked from ExportM5:

    Econ, Grade, Hours, ï..Student, SAT

The following objects are masked from ExportM4:

    Econ, Grade, Hours, SAT

The following objects are masked from ExportM3:

    Grade, Hours

> names(ExportM6)
[1] "ï..Student" "Grade"      "Hours"      "Hours2"     "Econ"      
[6] "SAT"       
```

#### Single Variable OLS Regression – Linear Model
```r
> summary(lm(Grade~Hours,data=ExportM6))

Call:
lm(formula = Grade ~ Hours, data = ExportM6)

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

#### Single Variable OLS Regression – Quadratic Added
```r
> summary(lm(Grade~Hours+Hours2,data=ExportM6))

Call:
lm(formula = Grade ~ Hours + Hours2, data = ExportM6)

Residuals:
    Min      1Q  Median      3Q     Max 
-14.899  -3.675   1.325   5.651  11.843 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  56.6866     4.5270  12.522  < 2e-16 ***
Hours         6.8472     2.0796   3.293  0.00191 ** 
Hours2       -0.3699     0.2110  -1.753  0.08623 .  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 7.209 on 46 degrees of freedom
Multiple R-squared:  0.5113,    Adjusted R-squared:  0.4901 
F-statistic: 24.07 on 2 and 46 DF,  p-value: 7.042e-08
```

#### Multiple Variable OLS Regression – Linear Model
```r
> summary(lm(Grade~Hours+Econ+SAT,data=ExportM6))

Call:
lm(formula = Grade ~ Hours + Econ + SAT, data = ExportM6)

Residuals:
     Min       1Q   Median       3Q      Max 
-14.4028  -2.9937  -0.4256   3.4116  10.2656 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 30.008754   9.180684   3.269 0.002074 ** 
Hours        2.607700   0.408443   6.384 8.37e-08 ***
Econ         6.928260   1.840746   3.764 0.000482 ***
SAT          0.026912   0.007254   3.710 0.000568 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.614 on 45 degrees of freedom
Multiple R-squared:  0.7101,    Adjusted R-squared:  0.6908 
F-statistic: 36.75 on 3 and 45 DF,  p-value: 3.664e-12
```

#### Multiple Variable OLS Regression – Quadratic Added
```r
> summary(lm(Grade~Hours+Hours2+Econ+SAT,data=ExportM6))

Call:
lm(formula = Grade ~ Hours + Hours2 + Econ + SAT, data = ExportM6)

Residuals:
     Min       1Q   Median       3Q      Max 
-13.5502  -2.5625   0.8883   3.1517  10.9492 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 27.700423   9.158128   3.025 0.004145 ** 
Hours        5.067879   1.627379   3.114 0.003241 ** 
Hours2      -0.256116   0.164165  -1.560 0.125898    
Econ         6.972690   1.812325   3.847 0.000382 ***
SAT          0.024991   0.007247   3.449 0.001253 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.526 on 44 degrees of freedom
Multiple R-squared:  0.7253,    Adjusted R-squared:  0.7004 
F-statistic: 29.05 on 4 and 44 DF,  p-value: 7.635e-12
```

## Logs

#### Import Dataset
```r
> ExportM7=read.csv("ExportM7.csv")
> attach(ExportM7)
The following objects are masked from ExportM6:

    Econ, Grade, Hours, ï..Student, SAT

The following objects are masked from ExportM5:

    Econ, Grade, Hours, ï..Student, SAT

The following objects are masked from ExportM4:

    Econ, Grade, Hours, SAT

The following objects are masked from ExportM3:

    Grade, Hours

> names(ExportM7)
[1] "ï..Student" "Grade"      "LnGrade"    "Hours"      "LnHours"   
[6] "Econ"       "SAT"        "LnSAT"     
```

#### Single Variable OLS Regression – Linear Model
```r
> summary(lm(Grade~Hours,data=ExportM7))

Call:
lm(formula = Grade ~ Hours, data = ExportM7)

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

#### Single Variable OLS Regression – Linear-Log Model
```r
> summary(lm(Grade~LnHours,data=ExportM7))

Call:
lm(formula = Grade ~ LnHours, data = ExportM7)

Residuals:
    Min      1Q  Median      3Q     Max 
-15.768  -4.130   1.573   5.223  11.445 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   60.407      2.597  23.258  < 2e-16 ***
LnHours       13.056      1.809   7.217 3.84e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 7.027 on 47 degrees of freedom
Multiple R-squared:  0.5256,    Adjusted R-squared:  0.5155 
F-statistic: 52.08 on 1 and 47 DF,  p-value: 3.838e-09
```

#### Single Variable OLS Regression – Log-Linear Model
```r
> summary(lm(LnGrade~Hours,data=ExportM7))

Call:
lm(formula = LnGrade ~ Hours, data = ExportM7)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.28915 -0.06683  0.01783  0.07701  0.16934 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 4.155319   0.033714 123.252  < 2e-16 ***
Hours       0.043836   0.007042   6.225 1.23e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.1031 on 47 degrees of freedom
Multiple R-squared:  0.4519,    Adjusted R-squared:  0.4402 
F-statistic: 38.75 on 1 and 47 DF,  p-value: 1.23e-07
```

#### Single Variable OLS Regression – Log-Log Model
```r
> summary(lm(LnGrade~LnHours,data=ExportM7))

Call:
lm(formula = LnGrade ~ LnHours, data = ExportM7)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.22436 -0.05933  0.02193  0.06831  0.14831 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  4.10939    0.03567 115.195  < 2e-16 ***
LnHours      0.17725    0.02485   7.133 5.14e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.09651 on 47 degrees of freedom
Multiple R-squared:  0.5198,    Adjusted R-squared:  0.5096 
F-statistic: 50.88 on 1 and 47 DF,  p-value: 5.135e-09
```

## Interaction Effects

#### Import Dataset
```r
> ExportM8=read.csv("ExportM8.csv")
> attach(ExportM8)
The following objects are masked from ExportM7:

    Econ, Grade, Hours, ï..Student, SAT

The following objects are masked from ExportM6:

    Econ, Grade, Hours, ï..Student, SAT

The following objects are masked from ExportM5:

    Econ, Grade, Hours, ï..Student, Male, SAT

The following objects are masked from ExportM4:

    Econ, Grade, Hours, Male, SAT

The following objects are masked from ExportM3:

    Grade, Hours

> names(ExportM8)
[1] "ï..Student" "Grade"      "Hours"      "Econ"       "SAT"       
[6] "Male"       "HoursEcon"  "HoursSAT"   "MaleEcon"  
```

#### Interacting Two Dummy Variables
```r
> summary(lm(Grade~Econ+Male,data=ExportM8))

Call:
lm(formula = Grade ~ Econ + Male, data = ExportM8)

Residuals:
    Min      1Q  Median      3Q     Max 
-23.212  -4.646   1.788   5.354  14.788 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  73.6460     2.1088  34.923  < 2e-16 ***
Econ         12.3816     2.5193   4.915 1.17e-05 ***
Male         -0.4336     2.4232  -0.179    0.859    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.301 on 46 degrees of freedom
Multiple R-squared:  0.3521,    Adjusted R-squared:  0.3239 
F-statistic:  12.5 on 2 and 46 DF,  p-value: 4.62e-05

> summary(lm(Grade~Econ+Male+MaleEcon,data=ExportM8))

Call:
lm(formula = Grade ~ Econ + Male + MaleEcon, data = ExportM8)

Residuals:
    Min      1Q  Median      3Q     Max 
-22.450  -4.333   0.500   5.550  15.550 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   74.917      2.390  31.349   <2e-16 ***
Econ           9.417      3.650   2.580   0.0132 *  
Male          -2.467      3.023  -0.816   0.4188    
MaleEcon       5.633      5.032   1.120   0.2688    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.278 on 45 degrees of freedom
Multiple R-squared:  0.3697,    Adjusted R-squared:  0.3276 
F-statistic: 8.797 on 3 and 45 DF,  p-value: 0.0001059

> summary(lm(Grade~Econ+Male+(Male*Econ),data=ExportM8))

Call:
lm(formula = Grade ~ Econ + Male + (Male * Econ), data = ExportM8)

Residuals:
    Min      1Q  Median      3Q     Max 
-22.450  -4.333   0.500   5.550  15.550 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   74.917      2.390  31.349   <2e-16 ***
Econ           9.417      3.650   2.580   0.0132 *  
Male          -2.467      3.023  -0.816   0.4188    
Econ:Male      5.633      5.032   1.120   0.2688    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.278 on 45 degrees of freedom
Multiple R-squared:  0.3697,    Adjusted R-squared:  0.3276 
F-statistic: 8.797 on 3 and 45 DF,  p-value: 0.0001059
```

#### Interacting Dummy Variable with Continuous Variable
```r
> summary (lm(Grade ~ Hours + Econ, data=ExportM8))

Call:
lm(formula = Grade ~ Hours + Econ, data = ExportM8)

Residuals:
     Min       1Q   Median       3Q      Max 
-16.0244  -3.3102   0.2396   3.6898  14.0469 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  63.3815     2.0745  30.553  < 2e-16 ***
Hours         2.6429     0.4615   5.727 7.43e-07 ***
Econ          8.4501     2.0282   4.166 0.000135 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 6.345 on 46 degrees of freedom
Multiple R-squared:  0.6215,    Adjusted R-squared:  0.605 
F-statistic: 37.77 on 2 and 46 DF,  p-value: 1.976e-10

> summary (lm(Grade ~ Hours + Econ + HoursEcon, data=ExportM8)) 

Call:
lm(formula = Grade ~ Hours + Econ + HoursEcon, data = ExportM8)

Residuals:
     Min       1Q   Median       3Q      Max 
-15.5470  -3.1761   0.1488   3.8239  14.0093 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  62.7324     2.5027  25.066  < 2e-16 ***
Hours         2.8146     0.5904   4.767 1.99e-05 ***
Econ         10.5916     4.9716   2.130   0.0386 *  
HoursEcon    -0.4536     0.9597  -0.473   0.6388    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 6.399 on 45 degrees of freedom
Multiple R-squared:  0.6234,    Adjusted R-squared:  0.5983 
F-statistic: 24.83 on 3 and 45 DF,  p-value: 1.25e-09

> summary (lm(Grade ~ Hours + Econ + (Hours*Econ), data=ExportM8))

Call:
lm(formula = Grade ~ Hours + Econ + (Hours * Econ), data = ExportM8)

Residuals:
     Min       1Q   Median       3Q      Max 
-15.5470  -3.1761   0.1488   3.8239  14.0093 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  62.7324     2.5027  25.066  < 2e-16 ***
Hours         2.8146     0.5904   4.767 1.99e-05 ***
Econ         10.5916     4.9716   2.130   0.0386 *  
Hours:Econ   -0.4536     0.9597  -0.473   0.6388    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 6.399 on 45 degrees of freedom
Multiple R-squared:  0.6234,    Adjusted R-squared:  0.5983 
F-statistic: 24.83 on 3 and 45 DF,  p-value: 1.25e-09
```

#### Interacting Two Continuous Variables
```r
> summary (lm(Grade ~ Hours + SAT, data=ExportM8))

Call:
lm(formula = Grade ~ Hours + SAT, data = ExportM8)

Residuals:
     Min       1Q   Median       3Q      Max 
-15.6640  -3.7476   0.5606   4.1837  14.1397 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 22.52703   10.16500   2.216 0.031669 *  
Hours        3.11552    0.43722   7.126  5.9e-09 ***
SAT          0.03300    0.00802   4.114 0.000159 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 6.367 on 46 degrees of freedom
Multiple R-squared:  0.6189,    Adjusted R-squared:  0.6023 
F-statistic: 37.35 on 2 and 46 DF,  p-value: 2.311e-10

> summary (lm(Grade ~ Hours + SAT + HoursSAT, data=ExportM8)) 

Call:
lm(formula = Grade ~ Hours + SAT + HoursSAT, data = ExportM8)

Residuals:
    Min      1Q  Median      3Q     Max 
-15.713  -4.105   0.717   4.050  14.217 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)  
(Intercept) 18.8776387 23.6266100   0.799   0.4285  
Hours        4.1438740  6.0115647   0.689   0.4942  
SAT          0.0359304  0.0189268   1.898   0.0641 .
HoursSAT    -0.0008204  0.0047831  -0.172   0.8646  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 6.435 on 45 degrees of freedom
Multiple R-squared:  0.6192,    Adjusted R-squared:  0.5938 
F-statistic: 24.39 on 3 and 45 DF,  p-value: 1.6e-09

> summary (lm(Grade ~ Hours + SAT + (Hours*SAT), data=ExportM8))

Call:
lm(formula = Grade ~ Hours + SAT + (Hours * SAT), data = ExportM8)

Residuals:
    Min      1Q  Median      3Q     Max 
-15.713  -4.105   0.717   4.050  14.217 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)  
(Intercept) 18.8776387 23.6266100   0.799   0.4285  
Hours        4.1438740  6.0115647   0.689   0.4942  
SAT          0.0359304  0.0189268   1.898   0.0641 .
Hours:SAT   -0.0008204  0.0047831  -0.172   0.8646  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 6.435 on 45 degrees of freedom
Multiple R-squared:  0.6192,    Adjusted R-squared:  0.5938 
F-statistic: 24.39 on 3 and 45 DF,  p-value: 1.6e-09
```

## Binary Dependent Variable

#### Import Dataset
```r
> ExportM9 = read.csv ("ExportM9.csv") 
> attach(ExportM9)
The following objects are masked from ExportM8:

    Econ, Grade, Hours, ï..Student, SAT

The following objects are masked from ExportM7:

    Econ, Grade, Hours, ï..Student, SAT

The following objects are masked from ExportM6:

    Econ, Grade, Hours, ï..Student, SAT

The following objects are masked from ExportM5:

    Econ, Grade, Hours, ï..Student, SAT

The following objects are masked from ExportM4:

    Econ, Grade, Hours, SAT

The following objects are masked from ExportM3:

    Grade, Hours

> names(ExportM9)
[1] "ï..Student" "Grade"      "Pass"       "Hours"      "Econ"      
[6] "SAT"       
```

#### OLS continuous
```r
> summary (lm(Grade ~ Hours, data=ExportM9))

Call:
lm(formula = Grade ~ Hours, data = ExportM9)

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

> summary (lm(Grade ~ Hours + Econ + SAT, data=ExportM9))

Call:
lm(formula = Grade ~ Hours + Econ + SAT, data = ExportM9)

Residuals:
     Min       1Q   Median       3Q      Max 
-14.4028  -2.9937  -0.4256   3.4116  10.2656 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 30.008754   9.180684   3.269 0.002074 ** 
Hours        2.607700   0.408443   6.384 8.37e-08 ***
Econ         6.928260   1.840746   3.764 0.000482 ***
SAT          0.026912   0.007254   3.710 0.000568 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.614 on 45 degrees of freedom
Multiple R-squared:  0.7101,    Adjusted R-squared:  0.6908 
F-statistic: 36.75 on 3 and 45 DF,  p-value: 3.664e-12
```

#### OLS with binary
```r
> summary (lm(Pass ~ Hours, data=ExportM9))

Call:
lm(formula = Pass ~ Hours, data = ExportM9)

Residuals:
    Min      1Q  Median      3Q     Max 
-0.8576 -0.1243  0.1424  0.2313  0.4091 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.41310    0.11936   3.461 0.001156 ** 
Hours        0.08890    0.02493   3.566 0.000847 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.3651 on 47 degrees of freedom
Multiple R-squared:  0.2129,    Adjusted R-squared:  0.1962 
F-statistic: 12.71 on 1 and 47 DF,  p-value: 0.0008469

> summary (lm(Pass ~ Hours + Econ + SAT, data=ExportM9))

Call:
lm(formula = Pass ~ Hours + Econ + SAT, data = ExportM9)

Residuals:
    Min      1Q  Median      3Q     Max 
-0.8720 -0.1494  0.0669  0.2399  0.4863 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)   
(Intercept) -0.855935   0.558089  -1.534  0.13211   
Hours        0.071745   0.024829   2.890  0.00592 **
Econ         0.144153   0.111898   1.288  0.20424   
SAT          0.001022   0.000441   2.317  0.02510 * 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.3412 on 45 degrees of freedom
Multiple R-squared:  0.3416,    Adjusted R-squared:  0.2977 
F-statistic: 7.783 on 3 and 45 DF,  p-value: 0.0002724
```

#### Logit with binary
```r
> model1<-glm(Pass ~ Hours, family=binomial (link='logit'), data=ExportM9) 
> summary(model1)

Call:
glm(formula = Pass ~ Hours, family = binomial(link = "logit"), 
    data = ExportM9)

Deviance Residuals: 
     Min        1Q    Median        3Q       Max  
-2.44251   0.07676   0.32240   0.51194   1.16213  

Coefficients:
            Estimate Std. Error z value Pr(>|z|)   
(Intercept)  -1.8939     1.0636  -1.781  0.07498 . 
Hours         0.9650     0.3495   2.761  0.00577 **
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 49.589  on 48  degrees of freedom
Residual deviance: 35.609  on 47  degrees of freedom
AIC: 39.609

Number of Fisher Scoring iterations: 6

> model2 <-glm(Pass ~ Hours + Econ + SAT, family=binomial (link='logit'), data=ExportM9)
> summary(model2)

Call:
glm(formula = Pass ~ Hours + Econ + SAT, family = binomial(link = "logit"), 
    data = ExportM9)

Deviance Residuals: 
     Min        1Q    Median        3Q       Max  
-2.56133   0.00001   0.00008   0.42064   1.46996  

Coefficients:
              Estimate Std. Error z value Pr(>|z|)  
(Intercept) -1.189e+01  5.899e+00  -2.015   0.0439 *
Hours        9.392e-01  4.103e-01   2.289   0.0221 *
Econ         1.895e+01  3.542e+03   0.005   0.9957  
SAT          7.786e-03  4.514e-03   1.725   0.0846 .
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 49.589  on 48  degrees of freedom
Residual deviance: 25.957  on 45  degrees of freedom
AIC: 33.957

Number of Fisher Scoring iterations: 19
```
