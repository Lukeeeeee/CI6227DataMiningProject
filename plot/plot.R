rm(list=ls())
library(jsonlite)
###Stringify some data from data frame to JSON

data <- fromJSON("attr_label_dataset.json")
str(data)
#####histogram
hist(data$AGE,xlab="AGE",main="Histogram of AGE",xlim=c(15,40))
hist(data$LABEL,xlab="LABEL",main="Histogram of LABEL")
hist(data$NATION,xlab="NATION",main="Histogram of NATION")
hist(data$SAVING_TIME,xlab="SAVING TIME",main="Histogram of SAVING TIME")
hist(data$YELLOW_RED_CARD_NUMBER,xlab="YELLOW_RED_CARD_NUMBER",main="Histogram of YELLOW RED CARD NUMBER",cex.main=0.9, xlim=c(0,10), ylim=c(0,250))
###density plot
plot(hist(data$AVE_ASSISTANCE),main="Average Assistance Number")
plot(ecdf(data$AVE_ASSISTANCE),main="Average Assistance Number")

# mean(data$AVE_ASSISTANCE)
# sd(data$AVE_ASSISTANCE)

plot(hist(data$SPEED),main="Speed")
plot(ecdf(data$SPEED),main="Speed")
#plot(density(data$SPEED),main="Speed")
plot(hist(data$WEIGHT),main="Weight")
plot(ecdf(data$WEIGHT),main="Weight")
plot(hist(data$AVE_FOUL),main="Average Fouls Number")
plot(ecdf(data$AVE_FOUL),main="Average Fouls Number")

plot(hist(data$AVE_SCORE),main="Average Scores Number Per Game", cex.main=0.9)
plot(ecdf(data$AVE_SCORE),main="Average Scores Number Per Game", cex.main=0.9)

plot(hist(data$AVE_STEALING),main="Average Stealing Number")
plot(ecdf(data$AVE_STEALING),main="Average Stealing Number")

plot(hist(data$AVE_TACKLING),main="Average Tacking Number")
plot(ecdf(data$AVE_TACKLING),main="Average Tacking Number")

plot(hist(data$HEIGHT),main="Height")
plot(ecdf(data$HEIGHT),main="Height")

