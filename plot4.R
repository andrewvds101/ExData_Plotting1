### Exploratory Data Analysis Assignment 1 - Plot 4

## Set working directory
setwd("/Users/Andrew/Library/Mobile Documents/com~apple~CloudDocs/Exploratory Data Analysis/Assignment 1")

## Load dplyr package
library(dplyr)

## Read in data
hpc <- tbl_df(read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?"))

## Convert Date to date format
hpc$Date <- as.character(hpc$Date)
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")

## Remove data not needed
hpc <- filter(hpc,Date=="2007-02-01" | Date=="2007-02-02")

## Create variable representing date and time
hpc$Time <- as.character(hpc$Time)
hpc$DateTime <- as.POSIXct(paste(hpc$Date,hpc$Time),format="%Y-%m-%d %H:%M:%S")

## Plot the data
png(filename = "plot4.png",type="quartz")
par(mfrow=c(2,2)) ## Window for 4 panel chart
# Panel 1
with(hpc,plot(DateTime,Global_active_power,type="n",xlab = "",ylab = "Global Active Power (kilowatts"))
lines(hpc$DateTime,hpc$Global_active_power)
# Panel 2
with(hpc,plot(DateTime,Voltage,type="n",xlab = "datetime",ylab = "Voltage"))
lines(hpc$DateTime,hpc$Voltage)
# Panel 3
with(hpc,plot(DateTime,Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering"))
lines(hpc$DateTime,hpc$Sub_metering_1,col="black")
lines(hpc$DateTime,hpc$Sub_metering_2,col="red")
lines(hpc$DateTime,hpc$Sub_metering_3,col="blue")
legend("topright",
                          c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                         lty = c(1,1),
                         lwd = c(2.5,2.5),
                         col = c("black","red","blue"),
                        border = "white"
                  )
# Panel 4
with(hpc,plot(DateTime,Global_reactive_power,type="n",xlab = "datetime",ylab = "Global_reactive_power"))
lines(hpc$DateTime,hpc$Global_reactive_power)

dev.off