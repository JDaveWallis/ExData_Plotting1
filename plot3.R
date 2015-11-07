### Exploratory Data Analysis - Course Project #1 - PLOT #3
### Submitted by Dave Wallis, 11/7/2015
###
### Note - The source data was processed a single time, using the R code script
### called "ProcessSelectedUCIData.R" - that file is included in the Git library.
### The steps of that process are included in each of the plot#.R
### scripts, in order to meet the requirements of the course assignment.
### But the intent is that the source processing only needs to be run one time
### before the plots are generated.
###
###
### "ProcessSelectedUCIData.R"
###
### Read through the entire raw UCI Electric Power Consumption dataset.
### This step is expensive, but will only need to be done one time to
### produce the subsetted selected data from 2/1/2007 and 2/2/2007.
### Load into the RawData dataframe.
### (specifying the semicolon as the separator, including header from the file,
### and specifying stringsAsFactors=FALSE so that character columns are read as
### character data - not factors).
###

#RawData <- data.frame(read.table(file="household_power_consumption.txt",
#                                 header=TRUE,sep=';',
#                                 stringsAsFactors=FALSE))

### Use the filter() function of the "dplyr" package to extract those records where
### the first column has values of 1/2/2007 or 2/2/2007 (where the date format is DD/MM/YYYY,
### with single digit months and days not having leading zeroes.)
###

#library(dplyr)
#
#SelectData <- filter(RawData,Date=="1/2/2007"|Date=="2/2/2007")

### Write the selected subset of data to a working file.
###

#write.table(SelectData, file="SelectData.txt")

### After the initial data processing, only this selected subset data file (SelectData.txt)
### is required - we don't have to perform the expensive initial select any more to meet the
### requirements of the assignment.
###

PlotData <- data.frame(read.table(file="SelectData.txt",stringsAsFactors=FALSE))
PlotData$Time <- as.POSIXct(paste(PlotData$Date,PlotData$Time), format="%d/%m/%Y %H:%M:%S")
PlotData$Date <- as.Date(PlotData$Date,"%d/%m/%Y")


### Code to produce the individual plots for the assignment
###
### Plot #3 - line diagram comparing energy sub metering readings
###           across 2 days by minute.  This plot adds additional lines
###           to the graph - one for each sub metering station
###
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
plot(PlotData$Time,PlotData$Sub_metering_1,type="l",col="black", 
     fg="black",
     main="Comparison of Sub Metering Readings by Minute",
     xlab="",
     ylab="Energy sub metering")

lines(PlotData$Time,PlotData$Sub_metering_2,type="l",col="red") 
lines(PlotData$Time,PlotData$Sub_metering_3,type="l",col="blue")

legend("topright", names(PlotData[7:9]),
       lty=1, col=c("black", "red", "blue"),text.col="black")

