## read data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## subset to correct dates
hpc <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
## create plot
hist(hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
## create png copy
attach(data)
dev.copy(png, file = "Plot1.png", height = 480, width = 480)
dev.off()
detach(data)