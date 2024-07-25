#Data Visualization
##Bar Chart##


x = c(50,6,7,8,9)
barplot(x)

barplot(x,col = "yellow",border = "red")
barplot(x,col = c("blue","red","green"),border = "yellow")
barplot(x,col=rainbow(length(x)))# VIBGYOR



x = c(110,60,70)
fruit = c("apple","orange","Mango")
colors=c("red","orange","yellow")
barplot(x, names.arg = fruit, col = colors, xlab=("Fruits"),
        ylab=("price"))
#names.argument -> every bar is going to takes a name.
?barplot

##Pie chart##(#contribution)

x = c(5,6,7)
fruit = c("apple","orange","Mango")
colors=c("red","orange","yellow")
pie(x)
pie(x,fruit,col=colors)
pie(x,fruit,edges=500,col=colors,radius=1,clockwise =FALSE,border=TRUE)
pie(x,init.angle=180,col=colors,border=TRUE)



#dpi-> depth point intensity

#edges- to get the clarity on edges.

library(plotrix)
pie3D(x,labels =fruit,explode = 0.2)#explode <- spliting the visualistion

##Line Graph##
x = c(5,6,7,8,9)
plot(x)
plot(x,type = "l")
?plot

xx=1:100
plot(xx,pch=66)
?plot
#pch - pointcharacter,h,s,S,n,o
xx=1:100
y=cos(xx)
y
plot(xx,y)
plot(xx,y,xlab='x vlaue',ylab='cos function',type='p',pch=1,col='red')
xx=seq(1,20,0.01)
xx
y=sin(xx)
y
plot(xx,y)
plot(xx,y,xlab='x vlaue',ylab='cos function',type='b',pch=61,col='red')



line1 <- c(10,20,30,40,50,100)
line2 <- c(20,55,45,55,90,100)
line3 <- c(20,29,39,55,60,10)
line4 <- c(20,89,25,35,90,100)


plot(line1, type = "l", col = "blue",lwd = 5)#lwd-line width
lines(line2, type="l", col = "red",lwd=5)
lines(line3, type="l", col = "green",lwd =5)
lines(line4, type="l", col = "pink",lwd=5)




#csv,tsv,json

#scatter plot


mba <- read.csv("D:\\Data Set\\mba.csv")
View(mba)



#there is no direct
plot(mba$workex,mba$gmat, type = "p",col = "blue",pch=100)




#comparision

~
pairs(~workex+gmat,data = mba,
      main = "pair plot")


#~tilde symbol

pairs(~.,data = mba,
      main = "pair plot")
#~. -> takes every column and plot it.

##Histogram - frequencies of values - hist()

h = c(20,30,40,40,40,50,60,60,60,60)
hist(h)
hist(h,col='red',border='green',xlab="height",ylab="frequency")


?hist
###############################

##coorelation
##boxplot - for the summary of data set

b = data.frame(height = c(120,150,160,5),
               weight = c(100,600,900,1),
               depth = c(400,100,300,2))    

boxplot(b$weight)

b

?hist
?boxplot



#With Data Set

hist(mba$workex,xlab = "workex",col="blue")

boxplot(mba$workex)

#$->data indexing process.


######################################################################################################################################
###################################################################

#Mean
v=c(2,4,6,8,10)
v
mean(v)

mean_a<- mean(c(-2,3,1,1,1,1,-9,-11,3))
mean_a

mean1<-mean(c(-2,3,1,1,1,1,-9,-8,NA))
mean1






mean2<-mean(c(-2,3,1,1,1,1,-9,-8,NA),na.rm=TRUE)
mean2
#na - not available
#rm- remove
#20% X 20 = ?

mean3<-mean(c(1,2,3,4,5,6,7,8,10,11,NA),trim =0.5,na.rm=TRUE)
mean3
mean1<-mean(c(1,2,3,4,NA),trim =0.1,na.rm=TRUE)
mean1
#trim - 0 to 1
#########################################################################

#Median
median1<- median(c(1,2,3,4,5))
median1

median2<- median(c(1,2,3,4,NA))
median2


median3<- median(c(1,2,3,4,NA),na.rm = TRUE)

median3

median(c(1,2,3,4,5,6,NA),na.rm=TRUE)


median(c(10,23,56,32,45,99,100,27,NA),na.rm=TRUE)

median(c(10,23,27,32,45,56,99,100,NA),trim = 0.5,na.rm=TRUE)

#Mode


mode<- table(c(1,2,2,3,1,3,5,6,6,3,22,33,44,5,7))
mode




#measure of dispersion

#Range
range(0,3,4,5,10,20)#min and max 

#Standard deviation and covariance.

a <- c(600,470,170,430,300)
mean(a)
var(a)
sd(a)



a <- c(600,470,170,430,300)

#Quartile
View(faithful)


quantile(faithful$eruptions)
quantile(a)

IQR(faithful$eruptions)
IQR(a)

View(faithful)
head(faithful)

range(faithful$eruptions)


#q*(n+1)
#25%
0.25*(272+1) 

0.50*(272+1)

0.75*(272+1) 

1*(272+1)

sd(faithful$waiting)




#Dataset- mba

dataset <-read.csv("D:\\Data Set\\mba.csv")
View(dataset)


mean_workex = mean(dataset$workex)
mean_workex

mean_gmat = mean(dataset$gmat)
mean_gmat

median_workex = median(dataset$workex)
median_workex

mode_workex = table(dataset$workex)
mode_workex

max(dataset$workex)
min(dataset$workex)
range(dataset$workex)



sd = sd(dataset$workex)
sd

v  = var(dataset$workex)
v
quantile(dataset$workex)
#IQR = Q3 - Q1.
IQR(dataset$workex)


cov_mba = cor(dataset$workex,dataset$gmat)#finding a relation between two variable is coorelation
cov_mba




##--------------------------------------------------------------------------------

