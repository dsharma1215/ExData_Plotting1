#R code for Plot#1 
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

#Now open png device
png()
#command to draw the histogram as per requiremnt
hist(twoday$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)", 
     ylab = "Frequency", col = "Red")
#close png device
dev.off()
