### Exploratory Data Analysis - Course Project #1
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

RawData <- data.frame(read.table(file="household_power_consumption.txt",
                                 header=TRUE,sep=';',
                                 stringsAsFactors=FALSE))

### Use the filter() function of the "dplyr" package to extract those records where
### the first column has values of 1/2/2007 or 2/2/2007 (where the date format is DD/MM/YYYY,
### with single digit months and days not having leading zeroes.)
###

library(dplyr)

SelectData <- filter(RawData,Date=="1/2/2007"|Date=="2/2/2007")

### Write the selected subset of data to a working file.
###

write.table(SelectData, file="SelectData.txt")

### After the initial data processing, only this selected subset data file (SelectData.txt)
### is required - we don't have to perform the expensive initial select any more to meet the
### requirements of the assignment.
###

#PlotData <- data.frame(read.table(file="SelectData.txt",stringsAsFactors=FALSE))
#PlotData$Time <- as.POSIXct(paste(PlotData$Date,PlotData$Time), format="%d/%m/%Y %H:%M:%S")
#PlotData$Date <- as.Date(PlotData$Date,"%d/%m/%Y")

###  PlotData data frame is used to generate each of the individual plots for the assignment.
###