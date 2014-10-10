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

png("plot4.png")
par(mfrow = c(2,2))

par(pty="s")
plot(data$datetime, data$Global_active_power, type = "l", main = "", xlab = "", 
     ylab = "Global Active Power")

par(pty="s")
plot(data$datetime, data$Voltage, type = "l", main = "", xlab = "datetime", 
     ylab = "Voltage")

par(pty="s")
plot(data$datetime, data$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy Sub metering")

lines(data$datetime, data[["Sub_metering_1"]], col = "black")
lines(data$datetime, data[["Sub_metering_2"]], col = "red")
lines(data$datetime, data[["Sub_metering_3"]], col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), bty = "n", lty = 1, cex = 0.8)

par(pty="s")
plot(data$datetime, data$Global_reactive_power, type = "l", main = "", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()