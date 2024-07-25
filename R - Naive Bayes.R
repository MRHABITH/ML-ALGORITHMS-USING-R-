# Naive Bayes

# Importing the dataset

dataset = read.csv("D:/Data Set/Iris_new.csv")
View(dataset)
# Splitting the dataset into the Training set and Test set
library(caTools)
set.seed(123)
split = sample.split(dataset$spectype, SplitRatio = 0.80)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Feature Scaling
training_set[-5] = scale(training_set[-5])
test_set[-5] = scale(test_set[-5])



# Fitting naive Bayes to the Training set
# install.packages('e1071')
library(e1071) #classification
#method 1
classifier = naiveBayes(x = training_set[1:4],
                        y = training_set$spectype)

#method 2
clasifier = naiveBayes(spectype~.,
                       data = training_set)

?naiveBayes



summary(classifier)


# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-5])
y_pred


# Making the Confusion Matrix
cm = table(test_set$spectype, y_pred)
cm
Accuracy=sum(diag(cm)/sum(cm))
Accuracy


