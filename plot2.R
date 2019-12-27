#Assignment 1 - Plot 2
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
      
      
          plot2<-with(data,plot(Global_active_power~DateTime,type="l",ylab ="Global Active Power (kilowatts)",xlab=""))
      
      #copy plot to png
          dev.copy(png,file="plot2.png")
          dev.off()



