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

png("plot2.png")
par(pty="s")
plot(data$datetime, data$Global_active_power, type = "l", main = "", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()