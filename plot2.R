#Read File
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
wholedataset <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep = ";")

#Subset and combine date and time columns into a date/time datatype
dataset <- wholedataset[wholedataset$Date %in% c("1/2/2007", "2/2/2007"),]
dataset$DateTime <- cbind(paste(dataset$Date, dataset$Time))
dataset$DateTime <- strptime(dataset$DateTime, "%d/%m/%Y %H:%M:%S")

#write plot to file as png
png(filename = "plot2.png", width = 480, height = 480)
plot(dataset$DateTime, as.numeric(as.character(dataset$Global_active_power)), type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

print("...The displayed plot has been written to your working directory as plot2.png")

#show the plot in console
plot(dataset$DateTime, as.numeric(as.character(dataset$Global_active_power)), type="l", xlab = "", ylab = "Global Active Power (kilowatts)")