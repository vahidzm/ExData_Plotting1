# 07/19/2018
# VZM
# 
# Exploratory data analysis
# Project 1

setwd("/Users/vahid/Dropbox (Personal)/Data/Coursera/ExploratoryData/Project1")

# Read Data
data=read.csv(file="household_power_consumption.txt", sep=";", colClasses = "character")
head(data)
str(data)
data$Date<-as.Date(data$Date, format='%d/%m/%Y')
dataM <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

# plot 1
par(mfrow=c(1,1))
hist(as.numeric(dataM$Global_active_power), breaks = 12, col ="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()


# Plot 2
times =strptime(paste(as.character(dataM$Date),dataM$Time), format= "%Y-%m-%d %H:%M:%S")

plot(times,dataM$Global_active_power, lty=1, lwd=1, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png, file = "plot2.png")
dev.off()


# Plot 3
plot(times,dataM$Sub_metering_1, lty=1, lwd=1, type = "l", ylab = "Energy sub metering", xlab="")
lines(times,dataM$Sub_metering_2, lty=1, lwd=1, type = "l", col="red")
lines(times,dataM$Sub_metering_3, lty=1, lwd=1, type = "l", col ="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
dev.copy(png, file = "plot3.png")
dev.off()

#Plot 4

par(mfrow=c(2,2))
plot(times,dataM$Global_active_power, lty=1, lwd=1, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")

plot(times,dataM$Voltage, lty=1, lwd=1, type = "l", ylab = "Voltage", xlab="datetime")


plot(times,dataM$Sub_metering_1, lty=1, lwd=1, type = "l", ylab = "Energy sub metering", xlab="")
lines(times,dataM$Sub_metering_2, lty=1, lwd=1, type = "l", col="red")
lines(times,dataM$Sub_metering_3, lty=1, lwd=1, type = "l", col ="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))

plot(times,dataM$Global_reactive_power, lty=1, lwd=1, type = "l", ylab = "Global_reactive_power", xlab="datetime")



dev.copy(png, file = "plot4.png")
dev.off()
