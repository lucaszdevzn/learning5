cat("\014")         # Clears the console
rm(list = ls())
graphics.off()

library("fGarch")
library(quantmod)
pdf("SampleGraph.pdf",width=7,height=5)
stockcode <- "VALE3.SA"
getSymbols(stockcode, src="yahoo", from='2017-01-01', to=Sys.Date(), auto.assign=T)
VALE <- VALE3.SA
stockColumns <- as.list(VALE)
closeStock <- stockColumns[4]
df <- data.frame(do.call(rbind, closeStock))
vectorVALEclose <- df$VALE3.SA.Close
vectorVALEclose <- vectorVALEclose[-60]

data(EuStockMarkets)
mode(EuStockMarkets)
class(EuStockMarkets)
logRsecond = diff(log(EuStockMarkets))
logR = diff(log(vectorVALEclose))

# par(mfrow=c(1,1))
# qqnorm(logR, datax = T)
# qqline(logR, datax = T)
print(shapiro.test(logR))

n=length(vectorVALEclose)
#par(mfrow = c(3,2))
q_grid = (1:n)/(n+1)
df_grid=c(3,4,5,6,7,8,9)
for(df in df_grid)
{
  qqplot(logR, qt(q_grid,df), main = paste("VALE", ", df = ", df))
  abline(lm(qt(c(0.25,0.75), df = df) ~ quantile(logR, c(0.25,0.75))))
}
dev.off()

x=seq(-.1,0.1,.001)
df = 20
mad_t = mad(logR, constant = sqrt(df/(df-2)) / qt(0.75,df))
#plot(density(logR), lwd = 2, ylim = c(0,20))
plot(density(logR), lwd = 2)
lines(x, dstd(x, mean = mean(logR), sd = mad_t, nu = df), lty = 5, lwd = 2, col = "red")
lines(x, dnorm(x, mean = mean(logR), sd = sd(logR)), lty = 3, lwd = 4, col = "blue")
legend("topleft", c("KDE", paste("t: df = ", df), "normal"),
        lwd = c(2,2,4), lty = c(1,5,3),
        col = c("black","red","blue"))

