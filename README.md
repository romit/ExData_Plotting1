## Submission for Course Project 1 for Coursera's Exploratory Data Analysis

The general approach to each of the .R files is the following:

* Step 1: Read the data table, using the header, separator and the na.strings 
epc <- read.table("household_power_consumption.txt", 
                  sep=";", header=TRUE, na.strings = c("?"))

* Step 2: Subset the data to just get the two days 
epc <- subset(epc, epc$Date == "1/2/2007" | epc$Date == "2/2/2007")

* Step 3: Create variable datetime by concatenating Date and Time and convert to POSIXct
epc$datetime <- as.POSIXct(paste(epc$Date, epc$Time), 
                           format="%d/%m/%Y %H:%M:%S")

* Open png file
png(file = "plot?.png", height = 480, width = 480)

* Do the plot

* Turn device off
dev.off()
