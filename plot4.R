library(dplyr)
library(lubridate)

# Read data from the data file
## data file is in the parent directory
household <- read.table(file = "../household_power_consumption.txt", header = TRUE, sep = ";")

# select required records only
selected <- household[household$Date %in% c("1/2/2007", "2/2/2007"),]

# converting
selected$DateTime <- dmy_hms(paste(selected$Date, selected$Time))
selected$Sub_metering_1 <- as.numeric(as.character(selected$Sub_metering_1))
selected$Sub_metering_2 <- as.numeric(as.character(selected$Sub_metering_2))
selected$Sub_metering_3 <- as.numeric(as.character(selected$Sub_metering_3))

active_power <- as.numeric(as.character(selected$Global_active_power))
reactive_power <- as.numeric(as.character(selected$Global_reactive_power))
voltage <- as.numeric(as.character(selected$Voltage))

# plotting
png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

## Plot 1
plot(x = selected$DateTime, active_power, type = "l", ylab = "Global Active Power (kilowatts)")

## Plot 2
plot(x = selected$DateTime, voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## Plot 3
plot(x = selected$DateTime, selected$Sub_metering_1, type = "l",xlab = "", ylab = "Energy sub metering")
lines(x = selected$DateTime, y = selected$Sub_metering_2, col = "RED")
lines(x = selected$DateTime, y = selected$Sub_metering_3, col = "BLUE")
legend("topright", box.lty = 0, col = c("BLACK","RED","BLUE"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

## Plot 4
plot(x = selected$DateTime, reactive_power, type = "l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()