### Exploratory Data Analysis Assignment 1 - Plot 1

## Set working directory
setwd("/Users/Andrew/Library/Mobile Documents/com~apple~CloudDocs/Exploratory Data Analysis/Assignment 1")
## Load dplyr package
library(dplyr)

## Read in data
hpc <- tbl_df(read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?"))

## Convert Date column to date format
hpc$Date <- as.character(hpc$Date)
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")

## Remove data not needed
hpc <- filter(hpc,Date=="2007-02-01" | Date=="2007-02-02")

## Plot the data
png(filename = "plot1.png",type="quartz")
hist(hpc$Global_active_power,col = "red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off