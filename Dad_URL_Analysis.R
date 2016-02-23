setwd("~/Desktop/R Projects/Dad_URL/Dad_URL_Project")
library("dplyr")
library("ggplot2")
library("xlsx")
library("tidyr")
library(reshape2)

df <- read.csv("date_url_project.csv", header = TRUE)  #date, url, project
df$date <-  strptime(df$date, format = "%m/%d/%Y")
summary(df$date)

# dfyah <- subset(df, !grepl("2016-01-28", date))
# dfoff <- subset(df, grepl("2016-01-28", date))
# #checks if I get all the data
# ifelse(nrow(df) == nrow(df15) + nrow(df16),"yup", "nope")
# #convert date columns to correct dates
# dfyah$date2 <-  strptime(dfyah$date, format = "%m/%d/%Y")
# #correct off date date
# #dfoff$date2 <-  strptime(dfoff$date, format = "%Y-%m-%d")
# dfoff$newdate <- strptime(as.character(dfoff$date), "%Y-%m-%d")
# dfoff$txtdate <- as.factor(format(dfoff$newdate, "%m-%d-%Y"))
# head(dfoff)
# dfoff$txtdate <-  strptime(dfoff$txtdate, format = "%m-%d-%Y")
# dfoff$date <-  strptime(dfoff$date, format = "%Y-%m-%d")


#I need to know:
#How many times, total, did each project invoke each url?
#247 projects, 10 urls
x <- table(df$project, df$url)

#x2 <- cast(x, id.vars=c("/alarms", "/alarms/all/severitycount", "/events", "/instances", "/meters/cpu_util/graphdata" ,"/meters/disk.read.bytes.rate/graphdata" ,"/meters/disk.write.bytes.rate/graphdata", "/meters/memory_util/graphdata", "/meters/network.incoming.bytes.rate/graphdata", "/meters/network.outgoing.bytes.rate/graphdata"))
write.xlsx(as.matrix(x), "NumberEachProjectInvokesURL.xlsx")

#How many times did each project invoke each url, each day?
x2 <- table(df$project, df$url, df$date)


#Histogram showing the distribution of number of urls invoked by each project, per day (e.g., histogram of question 2 above).
ggplot(data=df, aes(df$urls)) + geom_histogram()


#http://stackoverflow.com/questions/14818529/plot-histograms-over-factor-variables
p <- ggplot(data = x, aes(x=url)) 
p <- p + geom_histogram(aes(fill=date))
p <- p + scale_fill_brewer(palette="Set3")
p <- p + facet_wrap( ~ date, ncol=1)
p




set.seed(1234)
df <- data.frame(weekday=rep(sort(unique(weekdays(.leap.seconds))), each=24), 
                 hour=rep(1:24, 7), count=sample(2:600, 24*7, replace=T))

df$weekday <- factor(df$weekday, levels=c("Monday", "Tuesday", "Wednesday", 
                                          "Thursday", "Friday", "Saturday", "Sunday"), ordered=T)
df$hour <- factor(df$hour)

require(ggplot2)    
p <- ggplot(data = df, aes(x=hour)) 
p <- p + geom_histogram(aes(weights=count, fill=weekday))
p <- p + scale_fill_brewer(palette="Set3")
p <- p + facet_wrap( ~ weekday, ncol=1)
p

