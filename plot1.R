## EXPLORATORY DATA ANALYSIS: ASSIGNMENT ONE - PLOTTING WITH BASE PLOT
## GOAL: Examine how HH energy usage varies over 2-day period in Feb., 2007. 
## TASK: Reconstruct plots provided, constructed with base plotting system.
## Fork and clone GitHub REPO: https://github.com/rdpeng/ExData_Plotting1 

# Github REPO: https://github.com/smshiverick/ExData_Plotting1
setwd("~/data_science_coursera/exploratory_data_analysis")
library(data.table)

## Plot 1. Download the dataset, and unzip data files 
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power_consumption.zip", method = "curl")
unzip(zipfile = "household_power_consumption.zip")

## Read dataset; subset data for specified dates dates (2007-02-01 and 2007-02-02) 
## Note missing values in dataset coded as ?
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
powerDataSet <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(powerDataSet$Global_active_power)
str(powerDataSet)

## Construct plot, save it to PNG file (width 480 pixels, height 480 pixels)
## Include the code to copy plot to PNG file; CLOSE PNG device!
dev.copy(png, file = "plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

## Name each plot file; create separate R code file for corresponding plot (plot1.R <- plot1.PNG
## Add PNG file, R code file to top-level folder of git REPO (not sub-folders)
