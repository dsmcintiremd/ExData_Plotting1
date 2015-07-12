##
## Exploratory Data Analysis - Project 1
##

## plot3.r : this code reads data from the household_power_consumption.txt file
## and creates a time series with 3 values

plot3 <- function() {

windows()
  
## 1. Read data into R

setwd("~/Dave/Coursera/DataScientistsToolKit/exdata-data-household_power_consumption")
power_df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## 2. Convert to Date/Time

power_df$Date <- as.Date(power_df$Date, "%d/%m/%Y")

## 3. subset based on dates: 2007-02-01 and 2007-02-02

power_df2 <- power_df [power_df$Date == "2007-02-01" | power_df$Date == "2007-02-02" ,]

## Combine date/time column into new column

power_df2$datetime <- strptime(paste(power_df2$Date, power_df2$Time, sep = " "),"%Y-%m-%d %H:%M:%S")


## 4. Create plot

plot(power_df2$datetime, power_df2$Sub_metering_1, col="black",ylab="Energy sub metering", xlab="", type="l")
points(power_df2$datetime, power_df2$Sub_metering_2, col="red", type="l")
points(power_df2$datetime, power_df2$Sub_metering_3, col="blue", type="l")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## 5. Copy to PNG file

setwd("~/Dave/Coursera/DataScientistsToolKit/ExData_Plotting1")

dev.copy(png, file="plot3.png")
dev.off()

}
## End of file 