# Step 1: Read the data table, using the header, separator and the na.strings 
epc <- read.table("household_power_consumption.txt", 
                  sep=";", header=TRUE, na.strings = c("?"))

# Step 2: Subset the data to just get the two days 
epc <- subset(epc, epc$Date == "1/2/2007" | epc$Date == "2/2/2007")

# Step 3: Create variable datetime by concatenating Date and Time and convert to POSIXct
epc$datetime <- as.POSIXct(paste(epc$Date, epc$Time), 
                           format="%d/%m/%Y %H:%M:%S")

# Open png file
png(file = "plot3.png", height = 480, width = 480)

# Do the plot
plot(epc$datetime, epc$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(epc$datetime, epc$Sub_metering_1, col="black")
lines(epc$datetime, epc$Sub_metering_2, col="red")
lines(epc$datetime, epc$Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_c"), 
       col=c("black", "red", "blue"), 
       lty=1)

# Turn device off
dev.off()