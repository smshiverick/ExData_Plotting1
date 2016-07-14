## EXPLORATORY DATA ANALYSIS: ASSMT ONE - PLOTTING WITH BASE PLOT
## Plot 4. Create QuadPlot, 
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
powerDataSet <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]

## Label variables, and verify numeric values
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

## Create png file, name plot4
dev.copy(png, file = "plot4.png", width=480, height=480)
## Set parameters to create 4 plots drawn by column
par(mfrow = c(2,2))
## Upper left plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
## Upper right plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
## Lower left plot
plot(datetime, subMetering1, type = "l", col = "black", xlab = "", ylab = "Energy Sub Metering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", bty = "n", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
## Lower right plot
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab = "Global_reactive_power")
dev.off()

