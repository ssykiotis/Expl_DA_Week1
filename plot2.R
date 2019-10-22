hh<-read.csv.sql(file = "household_power_consumption.txt", 
                 header = TRUE,
                 sep = ";",
                 sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ",
                 eol = "\n"
)

hh$Date<-as.Date(hh$Date, format = "%d/%m/%Y")

png(file = "plot2.png",
    width = 480,
    height = 480
)

with( hh,
      plot(1:length(Global_active_power),Global_active_power,type="n",xlab = " ", ylab = "Global Active Power (kilowatts" , xaxt="n")
     )
lines(1:length(hh$Global_active_power),hh$Global_active_power,
      ylab =  "Global Active Power (kilowatts)",
      )

axis(1, at=c(1,1440,2880), labels=c("Thu","Fri", "Sat"))
dev.off()
