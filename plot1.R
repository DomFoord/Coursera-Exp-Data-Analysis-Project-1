## Import the datafile.

powerdata <- read.table(unz("./exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## We take the subset of data corresponding to the dates 1/2/2007 - 2/2/2007

powerdata <- powerdata %>% 
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))

## change class of all columns to correct class

powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
powerdata$Voltage <- as.numeric(powerdata$Voltage)
powerdata$Global_intensity <- as.numeric(powerdata$Global_intensity)
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)

## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(powerdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
