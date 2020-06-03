## read data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## subset to correct dates and reformat
hpc <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc$datetime <- as.POSIXct(datetime)
par(mfrow = c(2, 2))
with(hpc, {
  plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ datetime, type = "l")
  plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2 ~ datetime, col = "Red")
    lines(Sub_metering_3 ~ datetime, col = "Blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  plot(Global_reactive_power ~ datetime, type = "l")
})
dev.copy(png, file = "Plot4.png", height = 480, width = 480)
dev.off()