## Summary
This assigment aims and goals at furnishing the R code required for plotting 4 pre-defined plots
## Plot 1
Reading the file
Reading, naming and subsetting power consumption data
```{r}
filepath<-"C:/Users/new/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
power <- read.table(filepath,skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
```
This code Calling the basic plot function
```{r}
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
```
This code annotating graph
```{r}
#title(main="Global Active Power")
```