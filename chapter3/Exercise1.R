T=5
yield = 0.032 + 0.001*T/2 + 0.0002*T^2/3
round(yield,4)
price = 1000*exp(-T*yield)
round(price,1)
