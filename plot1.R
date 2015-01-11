library(dplyr)
data2 <- read.table('./household_power_consumption.txt',sep=';',header=TRUE)

data2$Date <- as.Date(data2$Date, "%d/%m/%Y")
data3 <- filter(data2,Date == "2007-02-01"|Date == "2007-02-02")
data3$Global_active_power <- as.numeric(data3$Global_active_power)



png("C:/Users/sbanerjee/Documents/Docs/Exploratory Data Analysis/plot1.png",type ="cairo")
hist(data3$Global_active_power/1000,col = "red",xlab = 'Global Active Power (kilowatts)',main = paste("Global Active Power"))
dev.off()





