## read data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## subset to correct dates and reformat
hpc <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
datetime <- paste(as.Date(hpc$Date,format="%d/%m/%Y"), hpc$Time)
hpc$Datetime <- as.POSIXct(datetime)
## create plot2
with(hpc, plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
## make png copy
attach(data)
dev.copy(png, file = "Plot2.png", height = 480, width = 480)
dev.off()
detach(data)