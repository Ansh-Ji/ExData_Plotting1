library('dplyr')
data<- read.table("./Datasets/household_power_consumption.txt" , 
                  sep = ";", header = T)
head(data)
targetdata<-data[data$Date %in% c('1/2/2007', '2/2/2007'),]
datetime <- strptime(paste(targetdata$Date, targetdata$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")
rm(data)
png(filename = "plot1.png", height = 480, width = 480, units ='px')
hist(as.numeric(targetdata$Global_active_power), col = 'red', 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()