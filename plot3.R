#Reading headers

header <- read.table("household_power_consumption.txt", sep = ";", nrows = 1, 
                     header = TRUE)
#Reading relevant data

data <- read.table("household_power_consumption.txt", sep = ";", 
                   na.strings = "?", skip = 66637, nrows = 2880, 
                   col.names = colnames(header))
rm(header)

#Merging date and time

datetime <- strptime(paste(data$Date, data$Time, sep = " "), 
                     format = "%d/%m/%Y %H:%M:%S")

#Final dataset

data <- data.frame(datetime, data[-c(1,2)])

rm(datetime)

#Creating plot

png("plot3.png")
par(pty="s")

plot(data$datetime, data$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy Sub metering")

lines(data$datetime, data[["Sub_metering_1"]], col = "black")
lines(data$datetime, data[["Sub_metering_2"]], col = "red")
lines(data$datetime, data[["Sub_metering_3"]], col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()