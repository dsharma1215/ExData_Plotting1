#R code for Plot#4
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

#Step 1 is to divide the device into 2 rows/colums
par(mfrow=c(2,2))

#plot#1
plot(twoday$datetimestamp,twoday$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")


#plot#2
plot(twoday$datetimestamp,twoday$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")


#Plot#3
#as per requirement plot this new column against 
# First -Sub_metering_1 colums
plot(twoday$datetimestamp,twoday$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

#Second - against Sub_metering_2 column
lines(twoday$datetimestamp,twoday$Sub_metering_2,col="red")

#Third - against Sub_metering_3 column
lines(twoday$datetimestamp,twoday$Sub_metering_3,col="blue")

#Create legend as required, shrik to fit
legend("topright", legend = c("Sub_metering_1  ",
                            "Sub_metering_2  ", "Sub_metering_3  "),
                lty=1, col=c("black","red","blue"),bty = "n",cex = .5)



#plot#4
plot(twoday$datetimestamp,twoday$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_Power")



#copy to png
dev.copy(png, file="Plot4.png", width=480, height=480)

#close device
dev.off()


