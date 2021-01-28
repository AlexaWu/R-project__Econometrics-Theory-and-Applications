> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
> setwd('C:/#Baruch Finance/ECO 9723 Econometrics Theory and Applications/A&P')

#Import	Dataset
> ExportM1=read.csv("ExportM1.csv")
> attach(ExportM1)
> names(ExportM1)
[1] "ID"    "Hours" "Grade"

#Calculate	summary	statistics
> summary(Grade)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  50.00   72.00   79.00   77.69   85.00   94.00

#Calculate	mean
> mean(Grade)
[1] 77.69388

#Calculate	sample	variance
> var(Grade)
[1] 101.9252

#Calculate	sample	standard	deviation
> sd(Grade)
[1] 10.0958

#Calculate	sample	covariance
> cov(Grade,Hours)
[1] 14.76233

#Calculate	sample	correlation	coefficient		
> cor(Grade,Hours)
[1] 0.6918535

#Calculate	population	skewness
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

#Import	Dataset
> ExportM2=read.csv("ExportM2.csv")
> attach(ExportM2)
> names(ExportM2)
[1] "Grade_D0" "Grade_D1"

#T	Test	NOT	assuming	equal	variance	(i.e.	unpooled)
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

#T	Test	assuming	equal	variance	(i.e.	pooled)
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
