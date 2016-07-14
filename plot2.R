## EXPLORATORY DATA ANALYSIS: ASSMT ONE - PLOTTING WITH BASE PLOT
## Plot 2. Read Power Usage Dataset PLOT Global Average Power by Date/Time
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
powerDataSet <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
str(powerDataSet)

## Combine DATE and TIME into new variable DATETIME
dateTime <- strptime(paste(powerDataSet$Date, powerDataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(powerDataSet$Global_active_power)

## Plot DateTime on x-axis; Global_active_power on y-axis, continuous plot 
dev.copy(png, file = "plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
