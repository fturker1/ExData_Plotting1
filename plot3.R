
## get data.table library to be able to read the txt file and convert it into the data table
library(data.table)
dattable<- fread("household_power_consumption.txt")

##extract the dates we want to work with
shortDT <- dattable[dattable$Date %in% c("1/2/2007", "2/2/2007"), ]

##merge date and time columns in another object
combined_date_time <- paste(shortDT$Date, shortDT$Time)

##add merged date_time column at the end of the main data
finalDT <- cbind(shortDT, combined_date_time)

##convert the merged date-time column to Date object by using as.Positct 
finalDT$combined_date_time <- as.POSIXct(finalDT$combined_date_time, format= "%d/%m/%Y %H:%M:%S")

##create an empty png file that the plot will be written into and create the scatterplot with proper labeling and coloring
##top use more than one variable in a signle graph, use plot(... type = "n") and lines() function
png("plot3.png", width = 480, height = 480)
plot(finalDT$combined_date_time, finalDT$Sub_metering_1, type="n", xlab= "", ylab = "Energy sub metering")
lines(finalDT$combined_date_time, finalDT$Sub_metering_1)
lines(finalDT$combined_date_time, finalDT$Sub_metering_2, col = "red")
lines(finalDT$combined_date_time, finalDT$Sub_metering_3, col = "blue")

##add the legend
legend("topright", lty = 1, col = c("black", "red", "blue") , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##close the file
dev.off()

