  rm(list = ls())   # Clears all the variables from the workplace 
  cat("\014")       # Clears console
  # pdf("ch5_ex5_8.pdf", title = "Example 5.8")

  
  library("Ecdat")
  data("CPSch3")
  dimnames(CPSch3)[[2]]
  
  male.earnings = CPSch3[CPSch3[,3] == "male", 2]
  sqrt.male.earnings = sqrt(male.earnings)
  log.male.earnings = log(male.earnings)
  
  par(mfrow=c(2,2))
  qqnorm(male.earnings, datax = TRUE, main = "untransformed")
  
  
  # dev.off()
  
  
  