library('dplyr')
data<- read.table("./Datasets/household_power_consumption.txt" ,
                  sep = ";", header = T)
head(data)
targetdata<-data[data$Date %in% c('1/2/2007', '2/2/2007'),]
datetime <- strptime(paste(targetdata$Date, targetdata$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")
rm(data)
png(filename = "plot2.png", height = 480, width = 480, units ='px')
plot(datetime, as.numeric(targetdata$Global_active_power), type = 'l',
     ylab = "Global Active Power (kilowatts)", xlab = "" )
dev.off()