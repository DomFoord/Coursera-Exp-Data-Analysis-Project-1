## Import the datafile.

powerdata <- read.table(unz("./exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## We take the subset of data corresponding to the dates 1/2/2007 - 2/2/2007

powerdata <- powerdata %>% 
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))


## we get the correct date/time and get the correct class for global_active_power
datetime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
subMetering1 <- as.numeric(powerdata$Sub_metering_1)
subMetering2 <- as.numeric(powerdata$Sub_metering_2)
subMetering3 <- as.numeric(powerdata$Sub_metering_3)

## make plot 3
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
