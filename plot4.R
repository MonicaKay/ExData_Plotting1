setwd("C:/Users/.../Assignment")

dataSet <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")

#Check the structure of the raw data set
str(dataSet)

#Make a copy of the dataset
powerUse <- dataSet

#Reformat the date and time variables
powerUse$DateTime <- as.POSIXct(paste(powerUse$Date,powerUse$Time), format = "%d/%m/%Y %H:%M:%S")
powerUse$Date <- as.Date(powerUse$Date, format = "%d/%m/%Y")
str(powerUse)

#Subset the data to include only the two days in scope for the assignment
powerUse <- subset(powerUse, powerUse$Date == "2007-02-01" | powerUse$Date == "2007-02-02")

#Create the plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(powerUse$DateTime, powerUse$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(powerUse$DateTime, powerUse$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
with(powerUse, 
{plot(powerUse$DateTime, powerUse$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(powerUse$DateTime, powerUse$Sub_metering_2, type = "l", col = "red")
lines(powerUse$DateTime, powerUse$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1 , col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", cex=0.4)
})
plot(powerUse$DateTime, powerUse$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Copy the plot to a PNG file, into the working directory
dev.copy(png, file = "plot4.png", width = 480, height = 480, pointsize = 20)
dev.off()
