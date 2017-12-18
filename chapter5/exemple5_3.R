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
  
  
  # The standardized function t is fitted with dt
  loglik_t = function(beta) sum( -dt((x - beta[1])/beta[2], beta[3], log = TRUE) + log(beta[2]))
  
  # Optimization function. "L-BFGS-B" is a limited-memory modification of the BFGS quasi-Newton method using a box of constraints.
  # "BFGS" stands for Broyden-Fletcher-Goldfarb-Shanno
  # Python has the same function: scipy.optimize.fmin_bfgs
  
  fit_t = optim(start, loglik_t, hessian = T, method = "L-BFGS-B", lower = c(-1,0.001,1))
  
  AIC_t = 2 * fit_t$value + 2 * 3
  BIC_t = 2 * fit_t$value + log(n)*3
  sd_t = sqrt(diag(solve(fit_t$hessian)))
  fit_t$par
  sd_t
  AIC_t
  BIC_t

  # The standardized function t is fitted with dstd
  loglik_std = function(beta) sum( -dstd(x, mean = beta[1], sd = beta[2], nu = beta[3], log = TRUE))
  fit_std = optim(start, loglik_std, hessian = T, method = "L-BFGS-B", lower = c(-0.1,0.01,2.1))
  AIC_std = 2*fit_std$value +2*3
  BIC_std = 2*fit_std$value + log(n)*3
  sd_std = sqrt(diag(solve(fit_std$hessian)))
  fit_std$par
  sd_std
  AIC_std
  BIC_std