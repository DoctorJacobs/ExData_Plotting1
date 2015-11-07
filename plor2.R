#Code for Plot 2
#Download data file and have "houshold_power_consumption.txt" file in your wd
#Read file in and subset the two days we want  
file <- "./household_power_consumption.txt"
alldata <- read.table(file, header = T, sep = ";", stringsAsFactors = F, dec =".")
twodata <- subset(alldata, subset=(Date == "1/2/2007" | Date == "2/2/2007"))

#Convert time info into more useful format
datetime <- strptime(paste(twodata$Date, twodata$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")

#Prep global active power as in plot1.R
gap <- as.numeric(twodata$Global_active_power)

#make png file, set file, close file
png("plot2.png", width=480, height=480)
plot(datetime, gap, type="l", ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()
