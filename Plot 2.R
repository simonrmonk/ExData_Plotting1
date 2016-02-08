dataSet <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings = "?", colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))
str(dataSet)

dataSet$Date <- as.Date(dataSet$Date, "%d/%m/%Y")
class(dataSet$Date)

subSet <- subset(dataSet, Date >= "2007-02-01" & Date <= "2007-02-02")
subSet$Date
strptime(subSet$Time, "%H:%M:%S")
##subSet$Time

subSet$Time <- strptime(paste(subSet$Date, subSet$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot2.png", width=480, height=480))
plot(x=subSet$Time, y=subSet$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(x=subSet$Time, y=subSet$Global_active_power)
dev.off()
