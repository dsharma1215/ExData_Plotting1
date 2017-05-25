#R code for Plot#2 
#for couresera course#4, week 1 peergraded assignment

#data file has almost 4years of data but we need only two days

#read data for only date 1/2/2007 and 2/2/2007
#we use packge sqldf (asumption it is already downloaded)

library(sqldf)
twoday <- read.csv.sql("household_power_consumption.txt",
                       sql = "select * from file where 
                       Date in('1/2/2007','2/2/2007')", 
                       header = TRUE, sep = ";")
#dataframe 'twoday' has 2880 rows

#Create a new column in dataframe that combines the date and time columns
#call it datetimestamp. convert to POSIXlt,POSIXt by using strptime
twoday$datetimestamp <- strptime(paste(twoday$Date, twoday$Time, sep=" "),
                                 format = "%d/%m/%Y %H:%M:%S")

#as per requirement pot this new column against Global active power colums
plot(twoday$datetimestamp, twoday$Global_active_power, type = "l",
     xlab="", ylab="Global Active Power (kilowatts)")

#copy to png
dev.copy(png, file="Plot2.png", width=480, height=480)

#close the device
dev.off()


