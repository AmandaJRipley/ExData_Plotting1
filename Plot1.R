## read data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## subset to correct dates
hpc <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
## creqte plot
hist(hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
## create png copy
dev.copy(png, "Plot1.png")
dev.off()