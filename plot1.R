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
hist(powerUse$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Copy the plot to a PNG file, into the working directory
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
