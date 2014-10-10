header <- read.table("household_power_consumption.txt", sep = ";", nrows = 1, 
                     header = TRUE)
data <- read.table("household_power_consumption.txt", sep = ";", 
                   na.strings = "?", skip = 66637, nrows = 2880, 
                   col.names = colnames(header))
rm(header)

datetime <- strptime(paste(data$Date, data$Time, sep = " "), 
                     format = "%d/%m/%Y %H:%M:%S")

data <- data.frame(datetime, data[-c(1,2)])

rm(datetime)

par(pin = c(5.21333, 5.21333))
plot(data$datetime, data$Global_active_power, type = "l", main = "", xlab = "", 
     ylab = "Global Active Power (kilowatts)", asp = 0)

dev.copy(png, file = "plot2.png")
dev.off()