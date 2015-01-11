library(dplyr)
data2 <- read.table('./household_power_consumption.txt',sep=';',header=TRUE)

data2$Date <- as.Date(data2$Date, "%d/%m/%Y")
data3 <- filter(data2,Date == "2007-02-01"|Date == "2007-02-02")

data3$DateTime <- strptime(paste(data3$Date, data3$Time), "%Y-%m-%d %H:%M:%S")

data3$Global_active_power <- as.double(data3$Global_active_power)   


png("C:/Users/sbanerjee/Documents/Docs/Exploratory Data Analysis/plot2.png",type ="cairo")
plot(data3$DateTime,data3$Global_active_power/1000,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()

