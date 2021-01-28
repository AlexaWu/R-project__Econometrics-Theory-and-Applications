## Project Contents

**_1. Downloading Data_**
  - Select BSL Longitudinal Survey Data https://www.nlsinfo.org/investigator/pages/login.jsp
  - Download and Save Dataset
  
*2. Data Manipulation in Excel*
  - Apply the data filters
  - Remove all observations that do not satisfy the filters
  - Add series of dummy variables for race and gender
  - Add the natural log of income as a variable and name it ln_income
  - Add a dummy variable for income greater than or equal to $60,000
  - Save worksheet as an Excel file - [Dataset1.xls](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/tables/Dataset1.xlsx)
  - Save worksheet as a text or CSV file - Dataset1
  
*3. Data Analysis re: Income*
  - Using Excel calculate the sample mean, sample standard deviation, sample skewness, sample kurtosis
  - Using R calculate the sample mean, sample standard deviation, population skewness, population kurtosis
  
*4. Data Analysis re: Income and AFQT*
  - Using Excel calculate the sample covariance, sample correlation coefficient
  - Using R calculate the sample covariance, sample correlation coefficient
  
  
## R Code and Output
```javascript
> getwd()
[1] "C:/Users/Alexa~Chutian/Documents"
> setwd("C:/#Baruch Finance/ECO 9723 Econometrics Theory and Applications/Metrics1")
> Dataset1=read.csv("Dataset1.csv")
> attach(Dataset1)
> names(Dataset1)
 [1] "id"           "father_ed"    "race"         "sex"          "afqt"        
 [6] "income"       "education"    "dummy_sex"    "dummy_race"   "ln_income"   
[11] "dummy_income"
> mean(income)
[1] 59743.02
> sd(income)
[1] 61755.33
> install.packages("moments")
Warning in install.packages("moments") :
  'lib = "C:/Program Files/R/R-3.3.2/library"' is not writable
--- Please select a CRAN mirror for use in this session ---
trying URL 'https://cran.cnr.berkeley.edu/bin/windows/contrib/3.3/moments_0.14.zip'
Content type 'application/zip' length 40751 bytes (39 KB)
downloaded 39 KB

package ‘moments’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Alexa~Chutian\AppData\Local\Temp\RtmpA7GCx8\downloaded_packages
> library(moments)
> skewness(income)
[1] 3.241179
> kurtosis(income)
[1] 14.98665
> cov(afqt,income)
[1] 612711740
> cor(afqt,income)
[1] 0.3496985
```
