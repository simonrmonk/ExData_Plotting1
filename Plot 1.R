setwd('C:/Users/simon.monk/Documents/Data Science Course/Exploratory Data Analysis/exdata-data-household_power_consumption')

dataSet <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings = "?", colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))
str(dataSet)

dataSet$Date <- as.Date(dataSet$Date, "%d/%m/%Y")
class(dataSet$Date)

subSet <- subset(dataSet, Date >= "2007-02-01" & Date <= "2007-02-02")
subSet$Date
##strptime(subSet$Time, "%H:%M:%S")
##subSet$Time

hist(subSet)

png(filename="plot1.png")
hist(main="Global Active Power", subSet$Global_active_power, col=2, ylab="Frequency", xlab="Global Active Power (kilowatts)")
dev.off()
