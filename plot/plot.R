rm(list=ls())
library(jsonlite)
###Stringify some data from data frame to JSON

data <- fromJSON("attr_label_dataset.json")
str(data)
#####histogram
hist(data$AGE,xlab="AGE",main="Histogram of AGE")
hist(data$LABEL,xlab="LABEL",main="Histogram of LABEL")
hist(data$NATION,xlab="NATION",main="Histogram of NATION")
hist(data$SAVING_TIME,xlab="SAVING TIME",main="Histogram of SAVING TIME")
hist(data$YELLOW_RED_CARD_NUMBER,xlab="YELLOW_RED_CARD_NUMBER",main="Histogram of YELLOW RED CARD NUMBER",cex.main=0.9)
###density plot
plot(density(data$AVE_ASSISTANCE,adjust=10),main="Average Assistance Number")
# mean(data$AVE_ASSISTANCE)
# sd(data$AVE_ASSISTANCE)
plot(density(data$SPEED,adjust=10),main="Speed")
plot(density(data$WEIGHT,adjust=10),main="Weight")
plot(density(data$AVE_FOUL,adjust=10),main="Average Fouls Number")
plot(density(data$AVE_SCORE,adjust=10),main="Average Scores Number Per Game", cex.main=0.9)
plot(density(data$AVE_STEALING,adjust=10),main="Average Stealing Number")
plot(density(data$AVE_TACKLING,adjust=10),main="Average Tacking Number")
plot(density(data$HEIGHT,adjust=10),main="Height")
