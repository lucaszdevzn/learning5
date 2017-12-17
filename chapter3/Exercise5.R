yields=c(0.025,0.028,0.032,0.033)
yields
T = seq(0.5,2,by=0.5)
T
cashflows = c(35,35,35,1035)

prices = cashflows * exp(-T*yields)
prices
round(sum(prices),2)