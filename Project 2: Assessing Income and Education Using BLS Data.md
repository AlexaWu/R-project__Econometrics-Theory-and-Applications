## Project Contents

*1. Data Manipulation in R*
  - Based on [Dataset1.xml](https://github.com/AlexaWu/R-project---Econometrics-Theory-and-Applications/blob/master/tables/Dataset1.xlsx) - notice that some observations involve top-coded income (where any income >= $300,000 is shown as exactly $300,000)
  - Remove those observations and reattach data

*2. Hypothesis Testing in R*
  - Test the null hypothesis that in 2012 the average income of BLS79 responders equaled $40,000
  - Test the null hypothesis that in 2012 the average income of BLS79 responders equaled $45,000
  - Test the null hypothesis that in 2012 the average income of BLS79 responders equaled $50,000
  - Create a worksheet “Hypothesis Testing” in the Excel spreadsheet including the following for each of the above tests:
    - Calculated value of t
    - P-value
    - 99% Confidence interva

*3. Single Variable Regression Analysis in R*
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

*4. Basic Linear: Multiple Variable Regression in R*
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
    
*5. Various Functional Forms: Multiple Variable Regression in R*
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
