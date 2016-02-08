dataSet <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings = "?", colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))
str(dataSet)

dataSet$Date <- as.Date(dataSet$Date, "%d/%m/%Y")
class(dataSet$Date)

subSet <- subset(dataSet, Date >= "2007-02-01" & Date <= "2007-02-02")
subSet$Date
strptime(subSet$Time, "%H:%M:%S")
##subSet$Time

subSet$Time <- strptime(paste(subSet$Date, subSet$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot3.png")
plot(x=subSet$Time, y=subSet$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(x=subSet$Time, y=subSet$Sub_metering_1)
lines(x=subSet$Time, y=subSet$Sub_metering_2, col=2)
lines(x=subSet$Time, y=subSet$Sub_metering_3, col=4)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), fill=c(1,2,4))
dev.off()
