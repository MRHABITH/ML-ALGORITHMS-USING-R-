# PCA

# Load necessary packages
library(caTools)
library(caret)
library(e1071)
library(Rfast)
library(factoextra)

#/Wine.csv
# Importing the dataset
# Load the dataset
dataset <- read.csv('D://Data Set//Wine.csv')

# Split the dataset into training and test sets

set.seed(123)

split <- sample.split(dataset$Customer_Segment, SplitRatio = 0.8)

training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Feature Scaling
training_set[-14] <- scale(training_set[-14])
test_set[-14] <- scale(test_set[-14])

# Perform PCA
pca_components <- 2
pca_model <- preProcess(x = training_set[-14], method = 'pca', pcaComp = pca_components)

training_set_pca <- predict(pca_model, training_set)
test_set_pca <- predict(pca_model, test_set)

# Train SVM classifier
svm_classifier <- svm(formula = Customer_Segment ~ .,
                      data = training_set_pca,
                      type = 'C-classification',
                      kernel = 'linear')

# Predict using SVM
y_pred <- predict(svm_classifier, newdata = test_set_pca)

# Compute Accuracy
cm <- table(test_set$Customer_Segment, y_pred)
cm
accuracy <- sum(diag(cm)) / sum(cm)
accuracy
# Visualization (adjust dimensions according to your dataset)
# ... (your visualization code here)

# Print the accuracy
cat("Accuracy:", accuracy, "\n")


# Visualization using plotly
library(plotly)

# Create a scatter plot of the PCA components
pca_plot <- plot_ly(data = training_set_pca, x = ~PC1, y = ~PC2, color = ~Customer_Segment,
                    type = "scatter", mode = "markers",
                    marker = list(size = 10))

# Customize the plot layout
pca_plot <- pca_plot %>% layout(
  title = "PCA Components Scatter Plot",
  xaxis = list(title = "PC1"),
  yaxis = list(title = "PC2")
)

# Show the plot
pca_plot



