
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

##create an empty png file that the plot will be written into and create the scatterplot with proper labeling and coloring, type="l" is used to convert the data points into line graph
png("plot2.png", width = 480, height = 480)
plot(finalDT$combined_date_time, finalDT$Global_active_power, xlab= "", ylab = "Global Active Power (kilowatts)", type = "l")
##close the file
dev.off()
