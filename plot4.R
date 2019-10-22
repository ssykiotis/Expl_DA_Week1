hh<-read.csv.sql(file = "household_power_consumption.txt", 
                 header = TRUE,
                 sep = ";",
                 sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ",
                 eol = "\n"
)

hh$Date<-as.Date(hh$Date, format = "%d/%m/%Y")

png(file = "plot4.png",
    width = 480,
    height = 480
)

par(mfrow=c(2,2))

############################## Plot 1 ###########################################

with( hh,
      plot(1:length(Global_active_power),Global_active_power,type="n",xlab = " ", ylab = "Global Active Power" , xaxt="n")
)
lines(1:length(hh$Global_active_power),hh$Global_active_power,
)

axis(1, at=c(1,1440,2880), labels=c("Thu","Fri", "Sat"))

############################## Plot 2 ###########################################

with( hh,
      plot(1:length(Voltage),Voltage,type="n",xlab = "datetime", ylab = "Voltage" , xaxt="n")
)
lines(1:length(hh$Voltage),hh$Voltage,
)

axis(1, at=c(1,1440,2880), labels=c("Thu","Fri", "Sat"))

############################## Plot 3 ###########################################

with( hh,
      plot(1:length(Sub_metering_1),Sub_metering_1,type="n",xlab = " ", ylab = "Energy sub metering" , xaxt="n")
)
lines(1:length(hh$Sub_metering_1),hh$Sub_metering_1,
)
lines(1:length(hh$Sub_metering_2),hh$Sub_metering_2,
      col = "red"
)
lines(1:length(hh$Sub_metering_3),hh$Sub_metering_3,
      col = "blue"
)

axis(1, at=c(1,1440,2880), labels=c("Thu","Fri", "Sat"))
legend("topright",
       legend=c("Sub-metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"),
       lty=1,
       bty="n"
)

############################## Plot 4 ###########################################


with( hh,
      plot(1:length(Global_reactive_power),Global_reactive_power,type="n", ylab = "Global_reactive_power", xlab = "datetime" , xaxt="n",cex.axis=0.9)
)
lines(1:length(hh$Global_reactive_power),hh$Global_reactive_power
)

axis(1, at=c(1,1440,2880), labels=c("Thu","Fri", "Sat"))

#####
dev.off()

