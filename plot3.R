hh<-read.csv.sql(file = "household_power_consumption.txt", 
                 header = TRUE,
                 sep = ";",
                 sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ",
                 eol = "\n"
)

hh$Date<-as.Date(hh$Date, format = "%d/%m/%Y")

png(file = "plot3.png",
    width = 480,
    height = 480
)

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
       lty=1
       )

dev.off()