#Assignment 1 - Plot 3
#included libraries
library(readr)
library(lubridate)
library(dplyr)


    #import data
        data<-read_delim("./household_power_consumption.txt",delim=";")
        
        data$Date<-dmy(data$Date)
        data<-data%>%filter(Date>=as.Date("2007-02-01"),Date<=as.Date("2007-02-02"))

    #Convert date variable to more user friendly format    
    #data$Date<-dmy(data$Date)
        data$Time<-hms(data$Time)
        data$DateTime<-data$Date+data$Time
        data$DateTime<-as.POSIXct(data$DateTime)
        
        data<-data%>%select(-Date,-Time)

    #Create plot with necessary adjustments 


        plot3<-with(data,{plot(Sub_metering_1~DateTime,type="l",ylab ="Energy sub metering",xlab="")
          lines(Sub_metering_2~DateTime,col="red")
          lines(Sub_metering_3~DateTime,col="blue")
          
          legend("topright",col=c("black","red","blue"),lwd=c(1,1,1),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



})
#copy plot to png
dev.copy(png,file="plot3.png",height=480,width=700)
dev.off()



