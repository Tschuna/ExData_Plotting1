#Read and subset data
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")
data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
data2<-data[start:end,]

#Open graphics device
png(filename="plot1.png", width = 480, height = 480)

#Create plot
hist(as.numeric(as.character(data2$Global_active_power)), 
       main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)", col = "red")

#Close graphics device
dev.off()