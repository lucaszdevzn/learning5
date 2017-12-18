  rm(list = ls())   # Clears all the variables from the workplace 
  cat("\014")       # Clears console
  pdf("ch5_ex5_6.pdf", title = "Example 5.6")
# 
#   library(sn)
#   dat = read.csv("GasFlowData.csv")
#   dat = dat/10000
#   par(mfrow=c(3,2))
#   x = dat$Flow1
#   x1 = sort(x)
#   
#   fit1 = sn.mple(y = x1, x = as.matrix(rep(1, length(x1))))
#   est1 = cp2dp(fit1$cp, family = "SN")
#   plot(x1, dsn(x1, dp = est1),
#        type = "l", lwd = 2, xlab = "flow",
#        ylab = "Flow 1 density")
#   d = density(x1)
#   lines(d$x, d$y, lty = 2, lwd = 2)
#   legend(40, 0.034, c("t-model","KDE"), lty = c(1,2), lwd = c(2,2))
#   n = length(x1)
#   u = (1:n) / (n + 1)
#   plot(x1, qsn(u, dp = est1), xlab = "data", ylab = "skew-t quantiles", main = "Flow 1")
#   lmfit = lm(qsn(c(0.25,0.75), dp = est1) ~ quantile(x1, c(0.25, 0.75)))
#   abline(lmfit)
#   
#   x2 = sort(dat$Flow2)
#   fit2 = sn.mple(y = x2, x = as.matrix(rep(1,length(x2))))
#   est2 = cp2dp(fit2$cp, family = "SN")
#   plot(x2, dsn(x2, dp = est2),
#        type = "l", lwd = 2, xlab = "flow",
#        ylab = "Flow 2 density")
#   d = density(x2)
#   lines(d$x, d$y, lty = 2, lwd = 2)
#   legend(40, 0.034, c("t-model","KDE"), lty = c(1,2), lwd = c(2,2))
#   n = length(x2)
#   u = (1:n) / (n + 1)
#   plot(x2, qsn(u, dp = est2), xlab = "data", ylab = "skew-t quantiles", main = "Flow 2")
#   lmfit = lm(qsn(c(0.25,0.75), dp = est2) ~ quantile(x2, c(0.25, 0.75)))
#   abline(lmfit)
#   
#   
#   x3 = sort(dat$Flow3)
#   fit3 = sn.mple(y = x3, x = as.matrix(rep(1,length(x3))))
#   est3 = cp2dp(fit3$cp, family = "SN")
#   plot(x3, dsn(x3, dp = est3),
#        type = "l", lwd = 2, xlab = "flow",
#        ylab = "Flow 3 density")
#   d = density(x3)
#   lines(d$x, d$y, lty = 2, lwd = 2)
#   legend(40, 0.034, c("t-model","KDE"), lty = c(1,2), lwd = c(2,2))
#   n = length(x3)
#   u = (1:n) / (n + 1)
#   plot(x3, qsn(u, dp = est3), xlab = "data", ylab = "skew-t quantiles", main = "Flow 3")
#   lmfit = lm(qsn(c(0.25,0.75), dp = est3) ~ quantile(x3, c(0.25, 0.75)))
#   abline(lmfit)
#   
  dev.off()
  
  