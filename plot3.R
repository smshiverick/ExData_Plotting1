## EXPLORATORY DATA ANALYSIS: ASSMT ONE - PLOTTING WITH BASE PLOT
## Plot 3. Plot DateTime and SubMetering 1, 2, 3, with legend (by color)
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
powerDataSet <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
str(powerDataSet)

## Label variables, and verify numeric values
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(powerDataSet$Sub_metering_1)
subMetering2 <- as.numeric(powerDataSet$Sub_metering_2)
subMetering3 <- as.numeric(powerDataSet$Sub_metering_3)

## Name Plot, set parameters, lable axes, add lines, and legend
dev.copy(png, file = "plot3.png", width=480, height=480)
plot(datetime, subMetering1, type = "l", col = "black", xlab = "", ylab = "Energy Sub Metering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()
