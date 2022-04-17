### :card_index_dividers: Packages & Functions

**["base" package](https://www.rdocumentation.org/packages/base/versions/3.6.2)**

function | description
--|--
[getwd()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/getwd)|Get Working Directory
setwd()| Set Working Directory
[read.csv()](https://www.rdocumentation.org/packages/qtl2/versions/0.24/topics/read_csv)|Read a csv file
[attach()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/attach)|Attach Set of R Objects to Search Path
[names()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/names)|The Names of an Object
[summary()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/summary)|Object Summaries
[mean()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/mean)|Arithmetic Mean

**["stats" package](https://www.rdocumentation.org/packages/stats/versions/3.6.2)**

function | description
--|--
[var()](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/cor)|compute the variance
[cov()](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/cor)|compute the covariance 
[cor()](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/cor)|compute the correlation
[sd()](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/sd)|compute the Standard Deviation
[t.test()](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/t.test)|Student's t-Test

**["moments" package](https://www.rdocumentation.org/packages/moments/versions/0.14)**

function | description
--|--
[skewness()](https://www.rdocumentation.org/packages/moments/versions/0.14/topics/skewness)|Skewness of the sample
[kurtosis()](https://www.rdocumentation.org/packages/moments/versions/0.14/topics/kurtosis)|Pearson's measure of kurtosis

------
### :card_index_dividers: R Code and Output
```r
> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
> setwd('C:/#Baruch/Econometrics/A&P')
```

#### Import Dataset
```r
> ExportM1=read.csv("ExportM1.csv")
> attach(ExportM1)
> names(ExportM1)
[1] "ID"    "Hours" "Grade"
```

#### Calculate summary statistics
```r
> summary(Grade)
   Min.     1st Qu.  Median   Mean     3rd Qu.  Max. 
  50.00     72.00    79.00    77.69    85.00    94.00
```

#### Calculate mean
```r
> mean(Grade)
[1] 77.69388
```

#### Calculate sample variance
```r
> var(Grade)
[1] 101.9252
```

#### Calculate sample standard deviation
```r
> sd(Grade)
[1] 10.0958
```

#### Calculate sample covariance
```r
> cov(Grade,Hours)
[1] 14.76233
```

#### Calculate sample correlation coefficient
```r
> cor(Grade,Hours)
[1] 0.6918535
```

#### Calculate population skewness
```r
> install.packages("moments")
Installing package into ‘C:/Users/Alexa~Chutian/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/moments_0.14.zip'
Content type 'application/zip' length 40751 bytes (39 KB)
downloaded 39 KB

package ‘moments’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Alexa~Chutian\AppData\Local\Temp\RtmpiYE1Rc\downloaded_packages
> library(moments)
> skewness(Grade)
[1] -0.5884398
> kurtosis(Grade)
[1] 2.970073
```

#### Import Dataset
```r
> ExportM2=read.csv("ExportM2.csv")
> attach(ExportM2)
> names(ExportM2)
[1] "Grade_D0" "Grade_D1"
```

#### T Test NOT assuming equal variance (i.e. unpooled)
```r
> t.test(Grade_D0,Grade_D1,var.equal=FALSE,paired=FALSE)

        Welch Two Sample t-test

data:  Grade_D0 and Grade_D1
t = -4.389, df = 46.88, p-value = 6.431e-05
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -15.486716  -5.751379
sample estimates:
mean of x mean of y 
 73.14286  83.76190 
```

#### T Test assuming equal variance (i.e. pooled)
```r
> t.test(Grade_D0,Grade_D1,var.equal=TRUE,paired=FALSE)

        Two Sample t-test

data:  Grade_D0 and Grade_D1
t = -4.2391, df = 47, p-value = 0.0001041
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -15.658546  -5.579549
sample estimates:
mean of x mean of y 
 73.14286  83.76190 
```
