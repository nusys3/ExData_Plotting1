library(dplyr)
library(lubridate)

# Read data from the data file
## data file is in the parent directory
household <- read.table(file = "../household_power_consumption.txt", header = TRUE, sep = ";")
selected <- household[household$Date %in% c("1/2/2007", "2/2/2007"),]

# Converting
selected$DateTime <- dmy_hms(paste(selected$Date, selected$Time))
selected$Sub_metering_1 <- as.numeric(as.character(selected$Sub_metering_1))
selected$Sub_metering_2 <- as.numeric(as.character(selected$Sub_metering_2))
selected$Sub_metering_3 <- as.numeric(as.character(selected$Sub_metering_3))

# Plotting
png(filename = "plot3.png",width = 480, height = 480, units = "px")

plot(x = selected$DateTime, selected$Sub_metering_1, type = "l",xlab = "", ylab = "Energy sub metering")
lines(x = selected$DateTime, y = selected$Sub_metering_2, col = "RED")
lines(x = selected$DateTime, y = selected$Sub_metering_3, col = "BLUE")
legend("topright", col = c("BLACK","RED","BLUE"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.off()