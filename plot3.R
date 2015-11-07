#Plot 3 starts off with much of the same code as Plot 2
file <- "./household_power_consumption.txt"
alldata <- read.table(file, header = T, sep = ";", stringsAsFactors = F, dec =".")
twodata <- subset(alldata, subset=(Date == "1/2/2007" | Date == "2/2/2007"))
datetime <- strptime(paste(twodata$Date, twodata$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(twodata$Global_active_power)

#Now, onto the new stuff
sub1 <- as.numeric(twodata$Sub_metering_1)
sub2 <- as.numeric(twodata$Sub_metering_2)
sub3 <- as.numeric(twodata$Sub_metering_3)

#Now, onto the graph
png("plot3.png", width=480, height=480)
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="", col = "black")
  lines(datetime, sub2, type="l", col="red")
  lines(datetime, sub3, type="l", col="blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
