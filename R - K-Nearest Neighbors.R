# K-Nearest Neighbors (K-NN)

# Importing the dataset



dataset = read.csv("D:/Data Set/Social_Network_Ads.csv")

dataset = dataset[3:5]



# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
dataset$Purchased


# Splitting the dataset into the Training set and Test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)



# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])


# Fitting K-NN to the Training set and Predicting the Test set results
#cl--> class labels 
#k-->  number of nearest neighbors
#class --> performing classification task

library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5)

y_pred
# Making the Confusion Matrix
cm = table(test_set$Purchased, y_pred)
cm

Accuracy=sum(diag(cm)/sum(cm))
Accuracy

#Recall
recall = cm[1, 1] / (cm[1, 1] + cm[2, 1])
print(paste("Recall:", recall))

#presesion

pres = cm[1,1]/(cm[1,1] + cm[1,2])

print(pres)

#F1 score

F1 = 2 *(pres * recall)
f2=pres+recall
f3=F1/f2


print(f3)


library(ggplot2)
# Visualizing the Training Set
ggplot(data = training_set, aes(x = Age, y = EstimatedSalary, color = Purchased)) +
  geom_point() +
  ggtitle("Training Set: Purchased vs Age and Estimated Salary") +
  xlab("Age") +
  ylab("Estimated Salary")

# Visualizing the Test Set
ggplot(data = test_set, aes(x = Age, y = EstimatedSalary, color = Purchased)) +
  geom_point() +
  ggtitle("Test Set: Purchased vs Age and Estimated Salary") +
  xlab("Age") +
  ylab("Estimated Salary")

