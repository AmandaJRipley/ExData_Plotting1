data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
gap <- hpc$Global_active_power
hist(gap, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
png("Plot1.png", width=480, height=480)
dev.off()