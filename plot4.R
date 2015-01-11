library(dplyr)
data2 <- read.table('./household_power_consumption.txt',sep=';',header=TRUE)

data2$Date <- as.Date(data2$Date, "%d/%m/%Y")
data3 <- filter(data2,Date == "2007-02-01"|Date == "2007-02-02")

data3$DateTime <- strptime(paste(data3$Date, data3$Time), "%Y-%m-%d %H:%M:%S")
data3$Global_reactive_power <- as.numeric(data3$Global_reactive_power)

png("C:/Users/sbanerjee/Documents/Docs/Exploratory Data Analysis/plot4.png",type ="cairo")
par(mfrow = c(2,2))
plot(data3$DateTime,data3$Global_active_power/1000,xlab="",ylab="Global Active Power (kilowatts)",type="l")
plot(data3$DateTime,data3$Voltage,xlab="datetime",ylab="Voltage",type="l")

plot(data3$DateTime,data3$Sub_metering_1,xlab="",ylab="Energysub metering",type="l",col="black")
lines(data3$DateTime,data3$Sub_metering_2,xlab="",ylab="Energysub metering",type="l",col="blue")
lines(data3$DateTime,data3$Sub_metering_3,xlab="",ylab="Energysub metering",type="l",col="red")
legend('topright',lty=1,bty=1, legend= c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','blue','red'))

plot(data3$DateTime,data3$Global_reactive_power/1000,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()