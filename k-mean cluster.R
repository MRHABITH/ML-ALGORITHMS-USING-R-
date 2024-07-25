# K-Means Clustering

  
# Importing the dataset

dataset = read.csv("D:\\Data Set\\Mall.csv")

dataset = dataset[4:5]
#Determine the optimal number of clusters
# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()

for (i in 1:20){
  wcss[i] = sum(kmeans(dataset, i)$withinss)
  
}
#WCSS -> WITHIN CLUSTER SUM OF SQUARE.
plot(1:20,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
# Fitting K-Means to the dataset

set.seed(29)
kmeans = kmeans(x = dataset, centers = 5)

kmeans
#kmeans ->

kmeans$cluster# cluster assignments for each data point.
kmeans$centers#The coordinates of the cluster centers.
kmeans$size#The number of data points in each cluster.
kmeans$withinss#The within-cluster sum of squares for each cluster.
kmeans$totss#total sum of square
kmeans$tot.withinss# The total within-cluster sum of squares.
kmeans$betweenss#The between-cluster sum of squares.
kmeans$iter#need to know how many iteration has been taken


y_kmeans = kmeans$cluster
y_kmeans
da=dataset

da$yvalue=y_kmeans

# Visualising the clusters
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,#plot data
         shade = FALSE,
         color = TRUE,
         labels = 0,
         plotchar = TRUE,
         span = TRUE,#expansion
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')




help(clusplot)


