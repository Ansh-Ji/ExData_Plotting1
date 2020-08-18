library('dplyr')
data<- read.table("./Datasets/household_power_consumption.txt" ,
                  sep = ";", header = T)
head(data)
targetdata<-data[data$Date %in% c('1/2/2007', '2/2/2007'),]
datetime <- strptime(paste(targetdata$Date, targetdata$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")
rm(data)

targetdata$Sub_metering_1<-as.numeric(targetdata$Sub_metering_1)
targetdata$Sub_metering_2<-as.numeric(targetdata$Sub_metering_2)
targetdata$Sub_metering_3<-as.numeric(targetdata$Sub_metering_3)

png(filename = "plot3.png", height = 480, width = 480, units ='px')
plot(datetime, targetdata$Sub_metering_1, type ='l', col='black',
     ylab = "Energy Sub Metering", xlab = "" )
lines(datetime, targetdata$Sub_metering_2, type = 'l', col = 'red')
lines(datetime, targetdata$Sub_metering_3, type ='l',col ='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty = 2, lwd = 3 , col = c('black', 'red', 'blue'))
dev.off()