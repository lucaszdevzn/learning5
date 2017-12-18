  rm(list = ls())   # Clears all the variables from the workplace 
  cat("\014")       # Clears console
  
  require(fitdistrplus)
  
  data(Capm, package = "Ecdat")
  x = diff(Capm$rf)
  fitdistr(x,"t")
  
  # Continuing example
  library(fGarch)
  n = length(x)
  start = c(mean(x), sd(x), 5)
  
  
  # # The F-S skewed t distribuition

  # loglik_ged = function(beta) sum(-dsstd(x, mean = beta[1], sd = beta[2], nu = beta[3], xi = beta[4], log = TRUE))
  # start = c(mean(x), sd(x), 5, 1)
  # fit_ged = optim(start, loglik_ged, hessian = T, method = "L-BFGS-B", lower = c(-0.1,0.01,2.1,-2))
  # AIC_ged = 2*fit_ged$value + 2*4
  # BIC_ged = 2*fit_ged$value +log(n)*4
  # sd_ged = sqrt(diag(solve(fit_ged$hessian)))
  # fit_ged$par
  # sd_ged
  # AIC_ged
  # BIC_ged