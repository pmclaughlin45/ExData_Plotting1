#Read File
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
wholedataset <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep = ";")

#Subset and combine date and time columns into a date/time datatype
dataset <- wholedataset[wholedataset$Date %in% c("1/2/2007", "2/2/2007"),]
dataset$DateTime <- cbind(paste(dataset$Date, dataset$Time))
dataset$DateTime <- strptime(dataset$DateTime, "%d/%m/%Y %H:%M:%S")

#write plot to png
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(dataset$Global_active_power)),ylim=c(0, 1200), main = "Global Active Power", xlab = "Global Active Powere (kilowatts)", ylab = "Frequency", col="red")
dev.off()



#show the plot in console
hist(as.numeric(as.character(dataset$Global_active_power)),ylim=c(0, 1200), main = "Global Active Power", xlab = "Global Active Powere (kilowatts)", ylab = "Frequency", col="red")





