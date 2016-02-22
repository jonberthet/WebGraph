setwd("~/Desktop/R Projects/Dad_URL/Dad_URL_Project")

df <- read.csv("date_url_project.csv", header = TRUE)  #date, url, project

I need to know:
#How many times, total, did each project invoke each url?
  #247 projects, 10 urls
table(df$project, df$url)
  
#How many times did each project invoke each url, each day?
df2 <- as.data.frame(table(df$project, df$url, df$date))


#Histogram showing the distribution of number of urls invoked by each project, per day (e.g., histogram of question 2 above).
hist(df$url, df$project)
