##
## Exploratory Data Analysis - Project 1
##

## plot1.r : this code reads data from the household_power_consumption.txt file
## and creates a bar chart

plot1 <- function () {
  
windows()

## 1. Read data into R

setwd("~/Dave/Coursera/DataScientistsToolKit/exdata-data-household_power_consumption")
power_df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## 2. Convert to Date/Time

power_df$Date <- as.Date(power_df$Date, "%d/%m/%Y")

## 3. subset based on dates: 2007-02-01 and 2007-02-02

power_df2 <- power_df [power_df$Date == "2007-02-01" | power_df$Date == "2007-02-02" ,]

## 4. Create histogram

hist(power_df2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

## 5. Copy to PNG file

setwd("~/Dave/Coursera/DataScientistsToolKit/ExData_Plotting1")

dev.copy(png, file="plot1.png")
dev.off()

}
## End of file 