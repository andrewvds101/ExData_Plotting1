### Exploratory Data Analysis Assignment 1 - Plot 2

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
png(filename = "plot2.png",type="quartz")
with(hpc,plot(DateTime,Global_active_power,type="n",xlab = "",ylab = "Global Active Power (kilowatts)"))
lines(hpc$DateTime,hpc$Global_active_power)
dev.off