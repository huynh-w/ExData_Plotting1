library(lubridate)
data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
subdata <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")
png("plot4.png", 480, 480)
par(mfcol=c(2, 2))
## top left
with(subdata, plot(dmy(Date)+hms(Time), Global_active_power, type="l", xlab="", ylab="Global Active Power"))
## bottom left
with(subdata, plot(dmy(Date)+hms(Time), Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering"))
with(subdata, lines(dmy(Date)+hms(Time), Sub_metering_2, col="red"))
with(subdata, lines(dmy(Date)+hms(Time), Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=names(subdata)[7:9])
## top right
with(subdata, plot(dmy(Date)+hms(Time), Voltage, type="l", xlab="datetime", ylab="Voltage"))
## bottom right
with(subdata, plot(dmy(Date)+hms(Time), Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()