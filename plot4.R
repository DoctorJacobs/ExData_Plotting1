#Plot 4 starts off with much of the same code as Plot 3
file <- "./household_power_consumption.txt"
alldata <- read.table(file, header = T, sep = ";", stringsAsFactors = F, dec =".")
twodata <- subset(alldata, subset=(Date == "1/2/2007" | Date == "2/2/2007"))
datetime <- strptime(paste(twodata$Date, twodata$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(twodata$Global_active_power)
sub1 <- as.numeric(twodata$Sub_metering_1)
sub2 <- as.numeric(twodata$Sub_metering_2)
sub3 <- as.numeric(twodata$Sub_metering_3)

#Now we need to make sure global reactive power and voltage are ready
volt <- as.numeric(twodata$Voltage)
grp <- as.numeric(twodata$Global_reactive_power)

#GRAPH TIME
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
#1
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power")
#2
plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")
#3
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="", col = "black")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=0, lwd=0, bty = "n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
