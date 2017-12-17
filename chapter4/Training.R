library("fGarch")

logR=diff(log(EuStockMarkets))

x=seq(-.1,.1,b=.00001)
par(mfrow=c(1,1))
plot(density(logR[,1]),lwd=2,ylim=c(0,60))
lines(x,dstd(x,mean=median(logR[,1]),sd=mad(logR[,1]),nu=5),lty=4,lwd=1)
#help("dstd")
lines(x,dnorm(x,mean=mean(logR[,1]),sd=sd(logR[,1])),lty=3,lwd=4)
legend("centerright",c("KDE","t: df=5","normal"),lwd=c(2,2,4),lty=c(1,5,3)) %>% 