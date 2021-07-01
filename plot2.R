## Import the datafile.

powerdata <- read.table(unz("./exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## We take the subset of data corresponding to the dates 1/2/2007 - 2/2/2007

powerdata <- powerdata %>% 
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))


## we get the correct date/time and get the correct class for global_active_power
datetime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 


## plot globalactivepower vs date&time
png("plot2.png", width=480, height=480)
plot(datetime, powerdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
