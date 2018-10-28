rm(list=ls())
library(jsonlite)
###Stringify some data from data frame to JSON


x <- vector()
y <- vector()


depth1 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/depth_1")
x[1] <- depth1$EXP_CONFIG$DEPTH
y[1] <- depth1$FINAL_TEST_ACCURACY
depth2 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/depth_2")
x[2] <- depth2$EXP_CONFIG$DEPTH
y[2] <- depth2$FINAL_TEST_ACCURACY
depth3 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/depth_3")
x[3] <- depth3$EXP_CONFIG$DEPTH
y[3] <- depth3$FINAL_TEST_ACCURACY
depth4 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/depth_4")
x[4] <- depth4$EXP_CONFIG$DEPTH
y[4] <- depth4$FINAL_TEST_ACCURACY
depth5 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/depth_6")
x[5] <- depth5$EXP_CONFIG$DEPTH
y[5] <- depth5$FINAL_TEST_ACCURACY
depth6 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/depth_8")
x[6] <- depth6$EXP_CONFIG$DEPTH
y[6] <- depth6$FINAL_TEST_ACCURACY
depth7 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/depth_10")
x[7] <- depth7$EXP_CONFIG$DEPTH
y[7] <- depth7$FINAL_TEST_ACCURACY
depth8 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/depth_12")
x[8] <- depth8$EXP_CONFIG$DEPTH
y[8] <- depth8$FINAL_TEST_ACCURACY
depth9 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/depth_14")
x[9] <- depth9$EXP_CONFIG$DEPTH
y[9] <- depth9$FINAL_TEST_ACCURACY
plot(x,y,type="o",col="red",lty=1,xlab="Depth",ylab="Test Accuracy",ylim=c(0.8,1))

depth1 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/depth_1")
x[1] <- depth1$EXP_CONFIG$DEPTH
y[1] <- depth1$FINAL_TEST_ACCURACY
depth2 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/depth_2")
x[2] <- depth2$EXP_CONFIG$DEPTH
y[2] <- depth2$FINAL_TEST_ACCURACY
depth3 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/depth_3")
x[3] <- depth3$EXP_CONFIG$DEPTH
y[3] <- depth3$FINAL_TEST_ACCURACY
depth4 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/depth_4")
x[4] <- depth4$EXP_CONFIG$DEPTH
y[4] <- depth4$FINAL_TEST_ACCURACY
depth5 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/depth_6")
x[5] <- depth5$EXP_CONFIG$DEPTH
y[5] <- depth5$FINAL_TEST_ACCURACY
depth6 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/depth_8")
x[6] <- depth6$EXP_CONFIG$DEPTH
y[6] <- depth6$FINAL_TEST_ACCURACY
depth7 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/depth_10")
x[7] <- depth7$EXP_CONFIG$DEPTH
y[7] <- depth7$FINAL_TEST_ACCURACY
depth8 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/depth_12")
x[8] <- depth8$EXP_CONFIG$DEPTH
y[8] <- depth8$FINAL_TEST_ACCURACY
depth9 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/depth_14")
x[9] <- depth9$EXP_CONFIG$DEPTH
y[9] <- depth9$FINAL_TEST_ACCURACY
points(x,y,type="o",col="green",lty=1,xlab="Depth",ylab="Test Accuracy")

depth1 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/depth_1")
x[1] <- depth1$EXP_CONFIG$DEPTH
y[1] <- depth1$FINAL_TEST_ACCURACY
depth2 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/depth_2")
x[2] <- depth2$EXP_CONFIG$DEPTH
y[2] <- depth2$FINAL_TEST_ACCURACY
depth3 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/depth_3")
x[3] <- depth3$EXP_CONFIG$DEPTH
y[3] <- depth3$FINAL_TEST_ACCURACY
depth4 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/depth_4")
x[4] <- depth4$EXP_CONFIG$DEPTH
y[4] <- depth4$FINAL_TEST_ACCURACY
depth5 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/depth_6")
x[5] <- depth5$EXP_CONFIG$DEPTH
y[5] <- depth5$FINAL_TEST_ACCURACY
depth6 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/depth_8")
x[6] <- depth6$EXP_CONFIG$DEPTH
y[6] <- depth6$FINAL_TEST_ACCURACY
depth7 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/depth_10")
x[7] <- depth7$EXP_CONFIG$DEPTH
y[7] <- depth7$FINAL_TEST_ACCURACY
depth8 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/depth_12")
x[8] <- depth8$EXP_CONFIG$DEPTH
y[8] <- depth8$FINAL_TEST_ACCURACY
depth9 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/depth_14")
x[9] <- depth9$EXP_CONFIG$DEPTH
y[9] <- depth9$FINAL_TEST_ACCURACY
points(x,y,type="o",col="blue",lty=1,xlab="Depth",ylab="Test Accuracy")
legend("topright",legend=c("1000 dataset","5000 dataset","10000 dataset"),col=c("red","green","blue"),lty=c(1,1,1),bty="n",pt.cex=1, cex=0.7, y.intersp=2)

rm(list=ls())
x <- vector()
y <- vector()
lq1 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/learing_rate_0.010000")
x[1] <- lq1$EXP_CONFIG$LEARNING_RATE
y[1] <- lq1$FINAL_TEST_ACCURACY
lq2 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/learing_rate_0.030000")
x[2] <- lq2$EXP_CONFIG$LEARNING_RATE
y[2] <- lq2$FINAL_TEST_ACCURACY
lq3 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/learing_rate_0.100000")
x[3] <- lq3$EXP_CONFIG$LEARNING_RATE
y[3] <- lq3$FINAL_TEST_ACCURACY
lq4 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/learing_rate_0.300000")
x[4] <- lq4$EXP_CONFIG$LEARNING_RATE
y[4] <- lq4$FINAL_TEST_ACCURACY
plot(x,y,type="o",col="red",lty=1,xlab="Learning Rate",ylab="Test Accuracy",ylim=c(0.8,1))

lq1 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/learing_rate_0.010000")
x[1] <- lq1$EXP_CONFIG$LEARNING_RATE
y[1] <- lq1$FINAL_TEST_ACCURACY
lq2 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/learing_rate_0.030000")
x[2] <- lq2$EXP_CONFIG$LEARNING_RATE
y[2] <- lq2$FINAL_TEST_ACCURACY
lq3 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/learing_rate_0.100000")
x[3] <- lq3$EXP_CONFIG$LEARNING_RATE
y[3] <- lq3$FINAL_TEST_ACCURACY
lq4 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/learing_rate_0.300000")
x[4] <- lq4$EXP_CONFIG$LEARNING_RATE
y[4] <- lq4$FINAL_TEST_ACCURACY
points(x,y,type="o",col="blue",lty=1,xlab="Learning Rate",ylab="Test Accuracy")


lq1 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/learing_rate_0.010000")
x[1] <- lq1$EXP_CONFIG$LEARNING_RATE
y[1] <- lq1$FINAL_TEST_ACCURACY
lq2 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/learing_rate_0.030000")
x[2] <- lq2$EXP_CONFIG$LEARNING_RATE
y[2] <- lq2$FINAL_TEST_ACCURACY
lq3 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/learing_rate_0.100000")
x[3] <- lq3$EXP_CONFIG$LEARNING_RATE
y[3] <- lq3$FINAL_TEST_ACCURACY
lq4 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/learing_rate_0.300000")
x[4] <- lq4$EXP_CONFIG$LEARNING_RATE
y[4] <- lq4$FINAL_TEST_ACCURACY
points(x,y,type="o",col="green",lty=1,xlab="Learning Rate",ylab="Test Accuracy")
legend("topright",legend=c("1000 dataset","5000 dataset","10000 dataset"),col=c("red","blue","green"),lty=c(1,1,1),bty="n",pt.cex=1, cex=0.7, y.intersp=2)

rm(list=ls())
x <- vector()
y <- vector()
ti1 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/train_iter_10")
x[1] <- 10
y[1] <- ti1$FINAL_TEST_ACCURACY
ti2 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/train_iter_50")
x[2] <- 50
y[2] <- ti2$FINAL_TEST_ACCURACY
ti3 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/train_iter_100")
x[3] <- 100
y[3] <- ti3$FINAL_TEST_ACCURACY
ti4 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/train_iter_300")
x[4] <- 300
y[4] <- ti4$FINAL_TEST_ACCURACY
ti4 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/train_iter_500")
x[4] <- 500
y[4] <- ti4$FINAL_TEST_ACCURACY
plot(x,y,type="o",col="red",lty=1,xlab="Train Iteration",ylab="Test Accuracy",ylim=c(0.7,1))

ti1 <- fromJSON("train_iter_10")
x[1] <- 10
y[1] <- ti1$FINAL_TEST_ACCURACY
ti2 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/train_iter_50")
x[2] <- 50
y[2] <- ti2$FINAL_TEST_ACCURACY
ti3 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/train_iter_100")
x[3] <- 100
y[3] <- ti3$FINAL_TEST_ACCURACY
ti4 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/train_iter_300")
x[4] <- 300
y[4] <- ti4$FINAL_TEST_ACCURACY
ti4 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/train_iter_500")
x[4] <- 500
y[4] <- ti4$FINAL_TEST_ACCURACY
points(x,y,type="o",col="blue",lty=1,xlab="Train Iteration",ylab="Test Accuracy")


ti1 <- fromJSON("train_iter_10")
x[1] <- 10
y[1] <- ti1$FINAL_TEST_ACCURACY
ti2 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/train_iter_50")
x[2] <- 50
y[2] <- ti2$FINAL_TEST_ACCURACY
ti3 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/train_iter_100")
x[3] <- 100
y[3] <- ti3$FINAL_TEST_ACCURACY
ti4 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/train_iter_300")
x[4] <- 300
y[4] <- ti4$FINAL_TEST_ACCURACY
ti4 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/train_iter_500")
x[4] <- 500
y[4] <- ti4$FINAL_TEST_ACCURACY
points(x,y,type="o",col="green",lty=1,xlab="Train Iteration",ylab="Test Accuracy")
legend("bottomright",legend=c("1000 dataset","5000 dataset","10000 dataset"),col=c("red","blue","green"),lty=c(1,1,1),bty="n",pt.cex=1, cex=0.7, y.intersp=2)

rm(list=ls())
x <- vector()
y <- vector()
dt1 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/depth_4")
x[1] <- 1000
y[1] <- dt1$FINAL_TEST_ACCURACY
dt2 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/depth_4")
x[2] <- 5000
y[2] <- dt2$FINAL_TEST_ACCURACY
dt3 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/depth_4")
x[3] <- 10000
y[3] <- dt3$FINAL_TEST_ACCURACY
plot(x,y,type="o",col="red",lty="solid",xlab="Dataset Size",ylab="Test Accuracy",ylim=c(0.8,1), main="Depth=4 Training iteration=300 Learning rate=0.03")

dt1 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/train_iter_300")
x[1] <- 1000
y[1] <- dt1$FINAL_TEST_ACCURACY
dt2 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/train_iter_300")
x[2] <- 5000
y[2] <- dt2$FINAL_TEST_ACCURACY
dt3 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/train_iter_300")
x[3] <- 10000
y[3] <- dt3$FINAL_TEST_ACCURACY
points(x,y,type="o",col="blue",lty=1,xlab="Dataset Size",ylab="Test Accuracy")


dt1 <- fromJSON("~/dev/CI6227DataMiningProject/log/1000_dataset/learing_rate_0.300000")
x[1] <- 1000
y[1] <- dt1$FINAL_TEST_ACCURACY
dt2 <- fromJSON("~/dev/CI6227DataMiningProject/log/5000_dataset/learing_rate_0.300000")
x[2] <- 5000
y[2] <- dt2$FINAL_TEST_ACCURACY
dt3 <- fromJSON("~/dev/CI6227DataMiningProject/log/10000_dataset/learing_rate_0.300000")
x[3] <- 10000
y[3] <- dt3$FINAL_TEST_ACCURACY
points(x,y,type="o",col="green",lty=1,xlab="Dataset Size",ylab="Test Accuracy")

legend("topleft",legend=c("Depth","Train Iteration","Learning Rate"),col=c("red","blue","green"),pt.cex=1, cex=0.7, lty=c(1,1,1),bty="n", y.intersp=2)


data <- fromJSON("~/dev/CI6227DataMiningProject/dataset/test_dataset/attr_label_dataset.json")
str(data)
#####histogram
hist(data$AGE,xlab="Age",main="Histogram of Age",xlim=c(15,40))
hist(data$LABEL,xlab="Label",main="Histogram of Label")
hist(data$NATION,xlab="Nation",main="Histogram of Nation")
hist(data$SAVING_TIME,xlab="Saving Time",main="Histogram of Saving Time")
hist(data$YELLOW_RED_CARD_NUMBER,xlab="Yellow Red Card Number",main="Histogram of Yellow Red Card Number",cex.main=0.9, xlim=c(0,10), ylim=c(0,250))
###density plot
plot(hist(data$AVE_ASSISTANCE),main="Histogram of Average Assistance Number",xlab = "Average Assistance Number")
plot(ecdf(data$AVE_ASSISTANCE),main="CDF of Average Assistance Number",xlab = "Average Assistance Number")

# mean(data$AVE_ASSISTANCE)
# sd(data$AVE_ASSISTANCE)

plot(hist(data$SPEED),main="Histogram of Speed",xlab="Speed")
plot(ecdf(data$SPEED),main="CDF of Speed", xlab="Speed")
#plot(density(data$SPEED),main="Speed")
plot(hist(data$WEIGHT),main="Histogram of Weight", xlab="Weight")
plot(ecdf(data$WEIGHT),main="CDF of Weight", xlab="Weight")
plot(hist(data$AVE_FOUL),main="Histogram of Average Fouls Number", xlab="Fouls Number")
plot(ecdf(data$AVE_FOUL),main="CDF of Average Fouls Number", xlab="Fouls Number")

plot(hist(data$AVE_SCORE),main="Histogram of Average Scores Number Per Game", cex.main=0.9, xlab="Average Scores Number Per Game")
plot(ecdf(data$AVE_SCORE),main="CDF of Average Scores Number Per Game", cex.main=0.9, xlab="Average Scores Number Per Game")

plot(hist(data$AVE_STEALING),main="Histogram of Average Stealing Number", xlab="Average Stealing Number")
plot(ecdf(data$AVE_STEALING),main="CDF of Average Stealing Number",  xlab="Average Stealing Number")

plot(hist(data$AVE_TACKLING),main="Histogram of Average Tacking Number", xlab="Average Tacking Number")
plot(ecdf(data$AVE_TACKLING),main="CDF of Average Tacking Number", xlab="Average Tacking Number")

plot(hist(data$HEIGHT),main="Histogram of Height", xlab="Height")
plot(ecdf(data$HEIGHT),main="CDF of Height", xlab="Height")


data3 <- fromJSON("~/dev/CI6227DataMiningProject/dataset/label_config.json")
importance <- data3$CLASS_WEIGHT_WITH_ATTR
weight <- matrix(nrow=12,ncol=4)
xvalue <- vector()
for(i in 1:12){
  weight[i,] <-importance[[i]]
  xvalue[i] <- sqrt(sum(weight[i,]^2))
}
data4 <- fromJSON("learing_rate_0.010000")
yvalue <- vector()
for(i in 1:12){
  yvalue[i] <- data4$FEATURE_IMPORTANCE[[i]]
}
####take log 
plot(log(xvalue[-9]),yvalue[-9],ylab="Feature Importance",xlab="Feature Weight L2-Norm",col= "blue", pch = 19, cex = 1, lty = "solid", lwd = 2)
text(log(xvalue[-9]),yvalue[-9],labels=names(importance),cex=0.5,pos=1)

plot(log(xvalue),yvalue,ylab="Feature Importance",xlab="Feature Weight L2-Norm",col= "blue", pch = 19, cex = 1, lty = "solid", lwd = 2)
text(log(xvalue),yvalue,labels=names(importance),cex=0.3,pos=1)

     