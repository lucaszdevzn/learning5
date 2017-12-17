bondvalue = function(c, T, r, par)
{
  bv = c / r + ( par - c/ r ) * (1 + r)^(-2*T)
  bv
}

price = 1200
C = 40
T= 30
par = 1000

r = seq(0.02, 0.05, length = 300)
value = bondvalue(C, T, r, par)
yield2M = spline(value, r, xout = price ) #spline interpolation

plot(r, value, xlab = 'yield to maturity', ylab = 'price of bond', type = 'l', main = "par = 1000, coupon payment = 40, T = 30", lwd = 2)
abline(h = 1200)
abline(v = yield2M)

uniroot(function(r) r^2-.5,c(0.7,0.8))