## Plot 3
Reading, naming and subsetting power consumption data
```{r}
filepath<-"C:/Users/new/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
power <- read.table(filepath,skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
```

This code transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
```{r}
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
```

This code calling the basic plot functions
```{r}
plot(subpower$Time,subpower$Sub_metering_1,type="n",main="Energy sub-metering",xlab="",ylab="Energy sub metering")
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
```
Annotating graph
```{r}
#title(main="Energy sub-metering")
```