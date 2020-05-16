
## get data.table library to be able to read the txt file and convert it into the data table
library(data.table)
dattable<- fread("household_power_consumption.txt")

##extract the dates we want to work with
shortDT <- dattable[dattable$Date %in% c("1/2/2007", "2/2/2007"), ]
##Convert GlobalPower to numeric from character
Globalpower <- as.numeric(shortDT$Global_active_power)

##create an empty png file that the plot will be written into and create the histogram with proper labeling and coloring
png("plot1.png", width = 480, height = 480)
hist(Globalpower, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
##close the file
dev.off()
