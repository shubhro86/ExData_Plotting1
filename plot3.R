library(dplyr)
data2 <- read.table('./household_power_consumption.txt',sep=';',header=TRUE)

data2$Date <- as.Date(data2$Date, "%d/%m/%Y")
data3 <- filter(data2,Date == "2007-02-01"|Date == "2007-02-02")

data3$DateTime <- strptime(paste(data3$Date, data3$Time), "%Y-%m-%d %H:%M:%S")


png("C:/Users/sbanerjee/Documents/Docs/Exploratory Data Analysis/plot3.png",type ="cairo")
plot(data3$DateTime,data3$Sub_metering_1,xlab="",ylab="Energysub metering",type="l",col="black")
lines(data3$DateTime,data3$Sub_metering_2,xlab="",ylab="Energysub metering",type="l",col="blue")
lines(data3$DateTime,data3$Sub_metering_3,xlab="",ylab="Energysub metering",type="l",col="red")
legend('topright',lty=1, legend= c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','blue','red'))
dev.off()
