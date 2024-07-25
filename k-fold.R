#k-fold

#/Social_Network_Ads.csv
# Importing the dataset
dataset = read.csv('D:\\Data Set\\Social_Network_Ads.csv')
dataset = dataset[3:5]



# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
# Fitting Kernel SVM to the Training set
library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'radial',
                 sigma=1.192688,
                 C=1.0)
# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm
Accuracy=sum(diag(cm)/sum(cm))
Accuracy
library(tidyverse)
library(caret)

#K-fold cross-validation
# Define training control
set.seed(123) 
train.control <- trainControl(method = "cv", number = 10)
#train control -> 
# Train the model
model <- train(Purchased ~., data = training_set, method = "svmRadial",
               trControl = train.control)

names(getModelInfo())
help(train)
# Summarize the results
print(model)
acurracy=model$resample$Accuracy
mean(acurracy)
model$bestTune
model$resample#grid search

#Repeated K-fold cross-validation
# Define training control
set.seed(123)
train.control <- trainControl(method = "repeatedcv", 
                              number = 10, repeats = 3)
# Train the model
model <- train(Purchased ~., data = training_set, method = "svmRadial",
               trControl = train.control)
# Summarize the results
print(model)
model$resample$Accuracy
model$bestTune

#Leave one out cross validation - LOOCV
# Define training control
train.control <- trainControl(method = "LOOCV")
# Train the model
model <- train(Purchased ~., data = training_set, method = "svmRadial",
               trControl = train.control)
model$bestTune
# Summarize the results
print(model)
loo_pred=model$pred
y_pred = predict(model, newdata = test_set[-3])
y_pred


# Making the Confusion Matrix


cm = table(test_set[, 3], y_pred)
cm
accuracy=sum(diag(cm)/sum(cm))
accuracy


