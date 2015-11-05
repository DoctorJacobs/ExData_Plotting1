#Code for Plot 1
#Download data file and have "houshold_power_consumption.txt" file in your wd
#Read file in and subset the two days we want  
  file <- "./household_power_consumption.txt"
  alldata <- read.table(file, header = T, sep = ";", stringsAsFactors = F, dec =".")
  twodata <- subset(alldata, subset=(Date == "1/2/2007" | Date == "2/2/2007"))
  
#Set the Global Active Power column equal to gap, make png file, set png file,
#close png file  
  gap <- as.numeric(twodata$Global_active_power)
  png("plot1.png", width=480, height=480)
  hist(gap, col = "orangered", main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)")
  dev.off()
