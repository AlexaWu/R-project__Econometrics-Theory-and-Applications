#### setting working directory and importing data
```r
> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
> setwd('C:/#Baruch/Econometrics/A&P')
```

#### Import Dataset
```r
> ExportM14 = read.csv ("ExportM14.csv") 
> attach(ExportM14)
> names(ExportM14)
[1] "month"            "sales"            "median_adj_sales" "treat"           
[5] "regime"           "treat_regime"    
```

#### Differences in Differences Estimator
```r
> summary (lm(median_adj_sales ~ treat + regime + treat_regime, data= ExportM14))

Call:
lm(formula = median_adj_sales ~ treat + regime + treat_regime, 
    data = ExportM14)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.208387 -0.045598 -0.006554  0.040629  0.186613 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)   1.005422   0.016410  61.269  < 2e-16 ***
treat         0.002265   0.023207   0.098 0.922531    
regime       -0.003960   0.027308  -0.145 0.885124    
treat_regime -0.148596   0.038619  -3.848 0.000266 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.0787 on 68 degrees of freedom
Multiple R-squared:  0.3639,    Adjusted R-squared:  0.3359 
F-statistic: 12.97 on 3 and 68 DF,  p-value: 8.572e-07
```
