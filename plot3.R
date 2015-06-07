#Read File
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
wholedataset <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep = ";")

#Subset and combine date and time columns into a date/time datatype
dataset <- wholedataset[wholedataset$Date %in% c("1/2/2007", "2/2/2007"),]
dataset$DateTime <- cbind(paste(dataset$Date, dataset$Time))
dataset$DateTime <- strptime(dataset$DateTime, "%d/%m/%Y %H:%M:%S")

#write plot to file
png(filename = "plot3.png", width = 480, height = 480)
plot(dataset$DateTime, as.numeric(as.character(dataset$Sub_metering_1)), type="l", xlab = "", ylab = "Entergy sub metering")
lines(dataset$DateTime, as.numeric(as.character(dataset$Sub_metering_2)), col="red")
lines(dataset$DateTime, as.numeric(as.character(dataset$Sub_metering_3)), col="blue")
legend("topright", col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid")
dev.off()

#show the plot in console
plot(dataset$DateTime, as.numeric(as.character(dataset$Sub_metering_1)), type="l", xlab = "", ylab = "Entergy sub metering")
lines(dataset$DateTime, as.numeric(as.character(dataset$Sub_metering_2)), col="red")
lines(dataset$DateTime, as.numeric(as.character(dataset$Sub_metering_3)), col="blue")
legend("topright", col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid")

print("...The displayed plot has been written to your working directory as plot3.png")