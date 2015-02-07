library(lubridate)

# Read data from the data file
## data file is in the parent directory
household <- read.table(file = "../household_power_consumption.txt", header = TRUE, sep = ";")
selected <- household[household$Date %in% c("1/2/2007", "2/2/2007"),]

# Converting
active_power <- as.numeric(as.character(selected$Global_active_power))

# Plotting
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(active_power, col="RED", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()