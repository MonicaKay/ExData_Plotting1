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
par(oma=c(0,0,0,0))
with(powerUse, plot(powerUse$DateTime, powerUse$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(powerUse, lines(powerUse$DateTime, powerUse$Sub_metering_2, type = "l", col = "red"))
with(powerUse, lines(powerUse$DateTime, powerUse$Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty=1 , col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5)

#Copy the plot to a PNG file, into the working directory
dev.copy(png, file = "plot3.png", width = 480, height = 480, pointsize = 20)
dev.off()
