hh<-read.csv.sql(file = "household_power_consumption.txt", 
                 header = TRUE,
                 sep = ";",
                 sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ",
                 eol = "\n"
                 )

hh$Date<-as.Date(hh$Date, format = "%d/%m/%Y")

png(file = "plot1.png",
    width = 480,
    height = 480
    )

hist(hh$Global_active_power,
     col="red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"
     )

dev.off()