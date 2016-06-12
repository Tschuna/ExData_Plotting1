#Read and subset data
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")
data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
data2<-data[start:end,]

#Open graphics device
png(filename="plot2.png", width = 480, height = 480)

#Create plot
plot(data2$DateTime, as.numeric(as.character(data2$Global_active_power)),
      type='l',ylab="Global Active Power (Kilowatts)", xlab="")

#Close graphics device
dev.off()