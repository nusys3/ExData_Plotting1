library(dplyr)
library(lubridate)

# Read data from the data file
## data file is in the parent directory
household <- read.table(file = "../household_power_consumption.txt", header = TRUE, sep = ";")
selected <- household[household$Date %in% c("1/2/2007", "2/2/2007"),]

# Converting
selected$DateTime <- dmy_hms(paste(selected$Date, selected$Time))
active_power <- as.numeric(as.character(selected$Global_active_power))

# Plotting
png(filename = "plot2.png",width = 480, height = 480, units = "px")
plot(x = selected$DateTime, active_power, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()