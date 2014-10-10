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

hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()