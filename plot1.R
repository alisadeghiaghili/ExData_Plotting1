data <- read.table(file = "./household_power_consumption.txt", 
                        colClasses = c(rep("character", 2), rep("numeric", 7)),
                        stringsAsFactors = FALSE, header = TRUE, 
                        sep =";",
                        na.string = "?")

data$Date <- strptime(x = data$Date, format = "%d/%m/%Y")

twoDays <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

rm(data)

png(filename = "plot1.png", width = 480, height = 480)

hist(x = twoDays$Global_active_power, 
     col = "red", 
     border = "black",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", 
     main = "Global Active Power")

dev.off()