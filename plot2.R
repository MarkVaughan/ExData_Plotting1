# lubridate library is used to help manipulate data with dates
require(lubridate)

#Set working directory to location of files
setwd("~/Dropbox/coursera/datasci/exdata/proj1")


# Calculate the number of rows to read in
# Starting Date begins at line 2 and is: "2006-12-16 17:24:00"
# The exercise is only interested in the dates between "2007-02-01 00:00:00" to "2007-02-02 23:59:00"

# 1st Step is to specify the number of rows to read in based on the dates of interest
firstDate <- strptime("2006-12-16 17:24:00", "%Y-%m-%d %H:%M:%S")
startDate <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")

# Calculate the difference between the first date and the 2007-02-01 start date, return a number in days
begin <- startDate - firstDate

# calculate the number of rows from first date to our start date i.e. 2006-12-16 to 2007-02-01
beginRow <- as.numeric(begin) * 24 * 60

# calculate the number of rows to read i.e. 2 days, 48 * 60, 1 row per minute

numRow <- 48 * 60

hpc1 <-read.table("household_power_consumption.txt",header = TRUE,sep=";",nrows = 2)
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",skip=beginRow,nrows=numRow)

#Set header data
names(hpc) <- names(hpc1)

# Create PNG Graphics Device to write plot to
png(filename = "plot2.png",width = 480, height = 480)

# Construct plot 2 
# Date and Time columns are concatenated and converted using lubridate "dmy_hms".
plot(dmy_hms(paste(hpc$Date,hpc$Time)),hpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab = "")

dev.off()
