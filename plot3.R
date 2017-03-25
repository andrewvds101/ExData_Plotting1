### Exploratory Data Analysis Assignment 1 - Plot 3

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
png(filename = "plot3.png",type="quartz")
with(hpc,plot(DateTime,Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering"))
lines(hpc$DateTime,hpc$Sub_metering_1,col="black")
lines(hpc$DateTime,hpc$Sub_metering_2,col="red")
lines(hpc$DateTime,hpc$Sub_metering_3,col="blue")

## Add legend
legend("topright",
        c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1),
       lwd = c(2.5,2.5),
       col = c("black","red","blue")
)

dev.off