## Project Contents

>For all analysis use the monthly log returns for the period 1/1/08 – 12/31/15, and use 5% level when determining significance

**_1. Linear Model Analysis of Vanguard Total Stock Market Index Fund_**

A. Test	monthly	log	returns	for	autocorrelation
  1. Use a t-test to check whether lag 1 is significant 
  2. Use a t-test to check whether lag 2 is significant 
  3. Use Ljung-Box Q(m) statistics to test whether ACF is significant 
    a) Apply m = 12
    b) Apply m = ln(T)

B. Autoregressive	model
  1. Use PACF	to determine AR	order
  2. Run appropriate AR	model
    > NOTE: Reasonable people	can	disagree on	the	best order of	these	models – just make sure to justify your choice
  3. Check your	AR model for stationarity

C. Moving	average	model
  1. Use	ACF	to	determine	appropriate	MA	order	
  2. Fit	the	appropriate	MA model	
    > NOTE: Reasonable people	can	disagree on	the	best order of	these	models – just make sure to justify your choice

**_2. Modeling Volatility for Amazon, Inc._**

  
## R Code and Output
