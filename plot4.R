data <- read.table(file = "./household_power_consumption.txt", 
                   colClasses = c(rep("character", 2), rep("numeric", 7)),
                   stringsAsFactors = FALSE, header = TRUE, 
                   sep =";",
                   na.string = "?")

data$Date <- strptime(x = data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(x = paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

twoDays <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

rm(data)

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(x = twoDays$DateTime,
     y = twoDays$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power",
     main = "")

plot(x = twoDays$DateTime,
     y = twoDays$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage",
     main = "")

plot(x = twoDays$DateTime,
     y = twoDays$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     main = "")

lines(x = twoDays$DateTime,
      y = twoDays$Sub_metering_2, 
      col = "red")

lines(x = twoDays$DateTime,
      y = twoDays$Sub_metering_3, 
      col = "blue")

legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1,
       bty = "n",
       cex = 0.5)

plot(x = twoDays$DateTime,
     y = twoDays$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()