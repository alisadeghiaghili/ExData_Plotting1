data <- read.table(file = "./household_power_consumption.txt", 
                   colClasses = c(rep("character", 2), rep("numeric", 7)),
                   stringsAsFactors = FALSE, header = TRUE, 
                   sep =";",
                   na.string = "?")

data$Date <- strptime(x = data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(x = paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

twoDays <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

rm(data)

png(filename = "plot2.png", width = 480, height = 480)

plot(x = twoDays$DateTime,
     y = twoDays$Global_active_power,
     type = "l",
     border = "black",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     main = "")

dev.off()