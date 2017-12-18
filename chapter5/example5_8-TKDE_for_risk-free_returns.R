  rm(list = ls())   # Clears all the variables from the workplace 
  cat("\014")       # Clears console
  # pdf("ch5_ex5_8.pdf", title = "Example 5.8")

  # Kernel density estimation and transformation kernel density estimates of monthly changes in the risk-free returns
  
  library(Capm, package = "Ecdat")
  y = diff(Capm$rf)               # The rf stands for risk-free returns
  # plot(Capm$rf, type = 'l', main = 'Risk-free returns', ylab = 'Risk-free returns [%]')
  # plot(y, type = 'l', main = 'Log function of risk-free returns')
  diffrf = y
  library(fGarch)
  
  # Calculating the transformation
  x1 = pstd(y, mean = 0.001, sd = .0725, nu = 3.34)
  x = qnorm(x1)
  
  par(mfrow = c(1,1))
  # Calculating the KDE for the untransformed data
  d1 = density(diffrf)
  plot(d1$x, d1$y, type = "l", xlab = "y", ylab = "Density(y)", lwd = 2)
  
  # Calculating the KDE of the transformed data
  d2 = density(x)
  ginvx = qstd(pnorm(d2$x), mean = 0.001, sd = .0725, nu = 3.34)
  gprime_num = dstd(ginvx, mean = 0.001, sd = .0725, nu = 3.34)
  gprime_den = dnorm(qnorm(pstd(ginvx, mean = 0.001, sd = .0725, nu = 3.34)))
  gprime = gprime_num/gprime_den
  lines(ginvx, d2$y * gprime, type = "l", lty = 2, col = "red", lwd = 2)
  legend("topleft", c("KDE", "TKDE"), lty = c(1,2), lwd = 2, col = c("black","red"))
  # dev.off()
  
  
  