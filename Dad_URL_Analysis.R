setwd("~/Desktop/R Projects/Dad_URL/Dad_URL_Project")
library("dplyr")
library("ggplot2")
library("xlsx")


df <- read.csv("date_url_project.csv", header = TRUE)  #date, url, project

I need to know:
#How many times, total, did each project invoke each url?
  #247 projects, 10 urls
x <- table(df$url, df$project)
write.table(x=x, file = "NumberEachProjectInvokesURL.csv")
  
#How many times did each project invoke each url, each day?
df2 <- as.data.frame(table(df$project, df$url))


#Histogram showing the distribution of number of urls invoked by each project, per day (e.g., histogram of question 2 above).
ggplot(data=df, aes(df$urls)) + geom_histogram()


#http://stackoverflow.com/questions/14818529/plot-histograms-over-factor-variables
p <- ggplot(data = df, aes(x=url)) 
p <- p + geom_histogram(aes(fill=date))
p <- p + scale_fill_brewer(palette="Set3")
p <- p + facet_wrap( ~ date, ncol=1)
p




der <- data.frame(weekday=rep(sort(unique(weekdays(.leap.seconds))), each=24), 
                 hour=rep(1:24, 7), count=sample(2:600, 24*7, replace=T))

der$weekday <- factor(der$weekday, levels=c("Monday", "Tuesday", "Wednesday", 
                                          "Thursday", "Friday", "Saturday", "Sunday"), ordered=T)
der$hour <- factor(der$hour)

head(der)
str(der)
p <- ggplot(data = der, aes(x=hour)) 
p <- p + geom_histogram(aes(weights=count, fill=weekday))
p <- p + scale_fill_brewer(palette="Set3")
p <- p + facet_wrap( ~ weekday, ncol=1)
p


