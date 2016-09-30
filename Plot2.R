# Read in Data
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# Convert Date Variable to Date Class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset Data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert DateTime to Date and Times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)