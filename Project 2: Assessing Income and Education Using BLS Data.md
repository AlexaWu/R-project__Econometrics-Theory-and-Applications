## Project Contents

**_1. Data Manipulation in R_**
  - Based on [Dataset1.xml](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/tables/Dataset1.xlsx) - notice that some observations involve top-coded income (where any income >= $300,000 is shown as exactly $300,000)
  - Remove those observations and reattach data [Dataset2.xml](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/tables/Dataset2.xlsx)

**_2. Hypothesis Testing in R_**
  - Test the null hypothesis that in 2012 the average income of BLS79 responders equaled $40,000
  - Test the null hypothesis that in 2012 the average income of BLS79 responders equaled $45,000
  - Test the null hypothesis that in 2012 the average income of BLS79 responders equaled $50,000
  - Create a worksheet “Hypothesis Testing” in the Excel spreadsheet including the following for each of the above tests:
    - Calculated value of t
    - P-value
    - 99% Confidence interva

**_3. Single Variable Regression Analysis in R_**
  - Run OLS with one Regressor on Income: 
  ![](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/formula/OLS%20with%20one%20Regressor%20on%20Income.jpg)
    - Using homoskedasticity-only standard errors
    - Using heteroskedasticity-robust standard errors
    - Create a worksheet “Single Regressor OLS” in the Excel spreadsheet including the following for each of the above tests:
      - Calculated value of t-statistic for each parameter
      - P-value for each parameter
      - Estimated coefficient and standard error for each parameter
      - R-squared and adjusted R-squared (if given)
      - P-value for F Test (if given)

**_4. Basic Linear: Multiple Variable Regression in R_**
  - Run multivariable OLS on Income:
    - Add father’s education, sex, and race use dummy variables: ![](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/formula/multivariable%20OLS%20on%20Income.jpg)
      - Using homoskedasticity-only standard errors
      - Using heteroskedasticity robust SE
    - Add AFQT Score to previous specification:
    ![](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/formula/add%20AFQT%20score.jpg)
      - Using homoskedasticity-only standard errors
      - Using heteroskedasticity robust SE    
    - Create a worksheet “Multivariate OLS” in the Excel spreadsheet including the following for each of the above tests:
      - Calculated value of t-statistic for each parameter
      - P-value for each parameter
      - Estimated coefficient and standard error for each parameter
      - R-squared and adjusted R-squared (if given)
      - P-value for F Test (if given)
    
**_5. Various Functional Forms: Multiple Variable Regression in R_**
  - Run multiple variable OLS on natural log of Income: ![](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/formula/multiple%20variable%20OLS%20on%20natural%20log%20of%20Income.jpg)
    - Using homoskedasticity-only standard errors
    - Using heteroskedasticity-robust standard errors
    - Create a worksheet “Multivatiate Log-Linear” in the Excel spreadsheet including the following for each of the above tests:
      - Calculated value of t-statistic for each parameter
      - P-value for each parameter
      - Estimated coefficient and standard error for each parameter
      - R-squared and adjusted R-squared (if given)
      - P-value for F Test (if given)
  - Run multiple variable logit regression: ![](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/formula/multiple%20variable%20logit%20regression.jpg)
    - Assuming homoskedasticity-only standard errors
    - Create a worksheet “Logits” in the Excel spreadsheet including the following for each of the above tests:
      - Calculated value of z-statistic for each parameter
      - P-value for each parameter
      - Estimated coefficient and standard error for each parameter

## R Code and Output

PART I
```javascript
> getwd()
[1] "C:/Users/sonal/OneDrive/Documents"
> setwd("C:/Users/sonal/Desktop")
> Dataset1 = read.csv("Dataset1.csv")
> attach(Dataset1)
> names(Dataset1)
 [1] "id"           "father_ed"    "race"         "sex"          "afqt"         "income"      
 [7] "education"    "dummy_sex"    "dummy_race"   "ln_income"    "dummy_income"
> dim(Dataset1)[1]
[1] 4207
> Dataset2 <- subset(Dataset1,income <300000)
> dim(Dataset2)[1]
[1] 4069
> attach(Dataset2)
The following objects are masked from Dataset1:

    afqt, dummy_income, dummy_race, dummy_sex, education, father_ed, id, income,
    ln_income, race, sex
```

PART II A
```javascript
> #T-testreincome
> attach(Dataset2)
The following objects are masked from Dataset2 (pos = 3):

    afqt, dummy_income, dummy_race, dummy_sex, education, father_ed, id, income,
    ln_income, race, sex

The following objects are masked from Dataset1:

    afqt, dummy_income, dummy_race, dummy_sex, education, father_ed, id, income,
    ln_income, race, sex

> t.test(income,mu=40000)

        One Sample t-test

data:  income
t = 19.332, df = 4068, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 40000
95 percent confidence interval:
 49083.11 51133.34
sample estimates:
mean of x 
50108.22

> t.test(income,mu=40000,conf.level=0.99)

        One Sample t-test

data:  income
t = 19.332, df = 4068, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 40000
99 percent confidence interval:
 48760.76 51455.69
sample estimates:
mean of x 
50108.22
```

PART II B
```javascript
> t.test(income,mu=45000)

        One Sample t-test

data:  income
t = 9.7695, df = 4068, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 45000
95 percent confidence interval:
 49083.11 51133.34
sample estimates:
mean of x 
50108.22

> t.test(income,mu=45000,conf.level=0.99)

        One Sample t-test

data:  income
t = 9.7695, df = 4068, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 45000
99 percent confidence interval:
 48760.76 51455.69
sample estimates:
mean of x 
50108.22
```

PART II C
```javascript
> t.test(income,mu=50000)

        One Sample t-test

data:  income
t = 0.20698, df = 4068, p-value = 0.836
alternative hypothesis: true mean is not equal to 50000
95 percent confidence interval:
 49083.11 51133.34
sample estimates:
mean of x 
50108.22

> t.test(income,mu=50000,conf.level=0.99)

        One Sample t-test

data:  income
t = 0.20698, df = 4068, p-value = 0.836
alternative hypothesis: true mean is not equal to 50000
99 percent confidence interval:
 48760.76 51455.69
sample estimates:
mean of x 
50108.22

> t.test(income,mu=50000,conf.level=0.99)

        One Sample t-test

data:  income
t = 0.20698, df = 4068, p-value = 0.836
alternative hypothesis: true mean is not equal to 50000
99 percent confidence interval:
 48760.76 51455.69
sample estimates:
mean of x 
50108.22
```

PART III 
```javascript
> summary(lm(income~education, data=Dataset2))

Call:
lm(formula = income ~ education, data = Dataset2)

Residuals:
   Min     1Q Median     3Q    Max 
-74511 -20958  -5736  15264 149929 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) -21925.7     2749.9  -7.973 1.99e-15 ***
education     5221.8      196.2  26.608  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 30790 on 4067 degrees of freedom
Multiple R-squared:  0.1483,    Adjusted R-squared:  0.1481 
F-statistic:   708 on 1 and 4067 DF,  p-value: < 2.2e-16

> install.packages("sandwich")
Installing package into ‘C:/Users/sonal/OneDrive/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.3/sandwich_2.3-4.zip'
Content type 'application/zip' length 504727 bytes (492 KB)
downloaded 492 KB

package ‘sandwich’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\sonal\AppData\Local\Temp\Rtmp4ORKHz\downloaded_packages
> ols1 <- lm(income ~ education, data=Dataset2)
> library(sandwich)
> sqrt(diag(vcovHC(ols1)))
(Intercept)   education 
  2877.5348    217.2483 
> install.packages("lmtest")
Installing package into ‘C:/Users/sonal/OneDrive/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.3/lmtest_0.9-35.zip'
Content type 'application/zip' length 288735 bytes (281 KB)
downloaded 281 KB

package ‘lmtest’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\sonal\AppData\Local\Temp\Rtmp4ORKHz\downloaded_packages
> library(lmtest)
Loading required package: zoo

Attaching package: ‘zoo’

The following objects are masked from ‘package:base’:

    as.Date, as.Date.numeric

Warning message:
package ‘lmtest’ was built under R version 3.3.3 
> coeftest(ols1,vcov=vcovHC)

t test of coefficients:

             Estimate Std. Error t value  Pr(>|t|)    
(Intercept) -21925.73    2877.53 -7.6196 3.146e-14 ***
education     5221.82     217.25 24.0362 < 2.2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

> ols2 <- lm(income ~ education + father_ed + dummy_sex + dummy_race, data=Dataset2)
> summary(ols2)

Call:
lm(formula = income ~ education + father_ed + dummy_sex + dummy_race, 
    data = Dataset2)

Residuals:
   Min     1Q Median     3Q    Max 
-81963 -19061  -4511  14611 139708 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) -17174.8     2840.6  -6.046 1.62e-09 ***
education     5279.4      198.6  26.585  < 2e-16 ***
father_ed      495.2      141.7   3.494 0.000481 ***
dummy_sex   -18168.3      923.2 -19.679  < 2e-16 ***
dummy_race   -4392.5      980.4  -4.480 7.66e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 29230 on 4064 degrees of freedom
Multiple R-squared:  0.2327,    Adjusted R-squared:  0.2319 
F-statistic: 308.1 on 4 and 4064 DF,  p-value: < 2.2e-16

> library(sandwich)
> sqrt(diag(vcovHC(ols2)))
(Intercept)   education   father_ed   dummy_sex  dummy_race 
  2985.3077    225.1024    150.1834    931.8297    967.1190 
> library(lmtest)
> coeftest(ols2,vcov=vcovHC)

t test of coefficients:

             Estimate Std. Error  t value  Pr(>|t|)    
(Intercept) -17174.84    2985.31  -5.7531 9.406e-09 ***
education     5279.41     225.10  23.4534 < 2.2e-16 ***
father_ed      495.20     150.18   3.2973 0.0009845 ***
dummy_sex   -18168.35     931.83 -19.4975 < 2.2e-16 ***
dummy_race   -4392.51     967.12  -4.5418 5.738e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

PART IV
```javascript
> ols3 <- lm(income ~ education + father_ed + dummy_sex + dummy_race + afqt, data=Dataset2)
> summary(ols3)

Call:
lm(formula = income ~ education + father_ed + dummy_sex + dummy_race + 
    afqt, data = Dataset2)

Residuals:
   Min     1Q Median     3Q    Max 
-80195 -18725  -4115  14111 144267 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -1.138e+04  2.863e+03  -3.975 7.16e-05 ***
education    4.161e+03  2.250e+02  18.492  < 2e-16 ***
father_ed    2.199e+02  1.426e+02   1.542    0.123    
dummy_sex   -1.759e+04  9.136e+02 -19.257  < 2e-16 ***
dummy_race   5.823e+01  1.063e+03   0.055    0.956    
afqt         2.225e-01  2.193e-02  10.143  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 28870 on 4063 degrees of freedom
Multiple R-squared:  0.2516,    Adjusted R-squared:  0.2507 
F-statistic: 273.2 on 5 and 4063 DF,  p-value: < 2.2e-16

> library(sandwich)
> sqrt(diag(vcovHC(ols3)))
 (Intercept)    education    father_ed    dummy_sex   dummy_race         afqt 
2.975649e+03 2.446034e+02 1.505426e+02 9.216847e+02 1.056968e+03 2.197286e-02 
> library(lmtest)
> coeftest(ols3,vcov=vcovHC)

t test of coefficients:

               Estimate  Std. Error  t value  Pr(>|t|)    
(Intercept) -1.1381e+04  2.9756e+03  -3.8249 0.0001328 ***
education    4.1610e+03  2.4460e+02  17.0112 < 2.2e-16 ***
father_ed    2.1994e+02  1.5054e+02   1.4610 0.1441010    
dummy_sex   -1.7594e+04  9.2168e+02 -19.0892 < 2.2e-16 ***
dummy_race   5.8227e+01  1.0570e+03   0.0551 0.9560708    
afqt         2.2247e-01  2.1973e-02  10.1250 < 2.2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

PART V A
```javascript
> ols1 <- lm(ln_income ~ education + father_ed + dummy_sex + dummy_race + afqt, data= Dataset2)
> 
> summary(ols1)

Call:
lm(formula = ln_income ~ education + father_ed + dummy_sex + 
    dummy_race + afqt, data = Dataset2)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.87318 -0.34509  0.08605  0.44249  1.87960 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  9.377e+00  6.433e-02 145.761   <2e-16 ***
education    8.429e-02  5.056e-03  16.671   <2e-16 ***
father_ed    1.983e-04  3.204e-03   0.062    0.951    
dummy_sex   -3.800e-01  2.053e-02 -18.510   <2e-16 ***
dummy_race   3.894e-03  2.389e-02   0.163    0.871    
afqt         4.957e-06  4.928e-07  10.058   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.6487 on 4063 degrees of freedom
Multiple R-squared:  0.2229,    Adjusted R-squared:  0.222 
F-statistic: 233.1 on 5 and 4063 DF,  p-value: < 2.2e-16

> library(sandwich)
> sqrt(diag(vcovHC(ols1)))
 (Intercept)    education    father_ed    dummy_sex   dummy_race         afqt 
6.453275e-02 5.079651e-03 3.284934e-03 2.055769e-02 2.437819e-02 5.034161e-07 
> library(lmtest)
> 
> coeftest(ols1,vcov=vcovHC)

t test of coefficients:

               Estimate  Std. Error  t value Pr(>|t|)    
(Intercept)  9.3774e+00  6.4533e-02 145.3127   <2e-16 ***
education    8.4288e-02  5.0797e-03  16.5932   <2e-16 ***
father_ed    1.9831e-04  3.2849e-03   0.0604   0.9519    
dummy_sex   -3.7998e-01  2.0558e-02 -18.4837   <2e-16 ***
dummy_race   3.8937e-03  2.4378e-02   0.1597   0.8731    
afqt         4.9567e-06  5.0342e-07   9.8461   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

PART V B
```javascript
> model1 <- glm(formula= dummy_income ~ education + father_ed + dummy_sex + dummy_race + afqt, family= binomial(link="logit"),data=Dataset2)
> 
> summary(model1)

Call:
glm(formula = dummy_income ~ education + father_ed + dummy_sex + 
    dummy_race + afqt, family = binomial(link = "logit"), data = Dataset2)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-2.0985  -0.7865  -0.5186   0.9280   2.5738  

Coefficients:
              Estimate Std. Error z value Pr(>|z|)    
(Intercept) -5.008e+00  2.513e-01 -19.930  < 2e-16 ***
education    2.717e-01  1.880e-02  14.454  < 2e-16 ***
father_ed    2.007e-02  1.186e-02   1.693   0.0904 .  
dummy_sex   -1.130e+00  7.889e-02 -14.325  < 2e-16 ***
dummy_race   1.830e-02  8.908e-02   0.205   0.8372    
afqt         1.346e-05  1.792e-06   7.514 5.75e-14 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 5050.4  on 4068  degrees of freedom
Residual deviance: 4255.3  on 4063  degrees of freedom
AIC: 4267.3

Number of Fisher Scoring iterations: 4
```
