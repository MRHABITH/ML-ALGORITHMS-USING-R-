library(shiny)
library(recommenderlab)
library(ggplot2)
library(data.table)
library(reshape2)

setwd("D:\\Data Set\\Project_Dataset\\IMDB-Dataset")                       
movie_data <- read.csv("movies.csv", stringsAsFactors=FALSE)
rating_data <- read.csv("ratings.csv")

# Data preparation
movie_genre <- as.data.frame(movie_data$genres, stringsAsFactors=FALSE)
movie_genre2 <- as.data.frame(tstrsplit(movie_genre[,1], '[|]', type.convert=TRUE), stringsAsFactors=FALSE)
colnames(movie_genre2) <- c(1:10)
list_genre <- c("Action", "Adventure", "Animation", "Children", "Comedy", "Crime", "Documentary", "Drama", "Fantasy", "Film-Noir", "Horror", "Musical", "Mystery", "Romance", "Sci-Fi", "Thriller", "War", "Western")
genre_mat1 <- matrix(0, 10330, 18)
genre_mat1[1,] <- list_genre
colnames(genre_mat1) <- list_genre

for (index in 1:nrow(movie_genre2)) {
  for (col in 1:ncol(movie_genre2)) {
    gen_col = which(genre_mat1[1,] == movie_genre2[index, col])
    genre_mat1[index + 1, gen_col] <- 1
  }
}

genre_mat2 <- as.data.frame(genre_mat1[-1,], stringsAsFactors=FALSE)
for (col in 1:ncol(genre_mat2)) {
  genre_mat2[,col] <- as.integer(genre_mat2[,col])
}

SearchMatrix <- cbind(movie_data[,1:2], genre_mat2[])
ratingMatrix <- dcast(rating_data, userId~movieId, value.var = "rating", na.rm=FALSE)
ratingMatrix <- as.matrix(ratingMatrix[,-1])
ratingMatrix <- as(ratingMatrix, "realRatingMatrix")

# Build recommendation model
recommendation_model <- recommenderRegistry$get_entries(dataType = "realRatingMatrix")
recommen_model <- Recommender(data = ratingMatrix, method = "IBCF", parameter = list(k = 30))

# Create table_views for top viewed movies plot
movie_views <- colCounts(ratingMatrix)
table_views <- data.frame(movie = names(movie_views), views = movie_views)
table_views <- table_views[order(table_views$views, decreasing = TRUE), ]
table_views$title <- NA

for (index in 1:nrow(table_views)){
  table_views[index,3] <- as.character(subset(movie_data, movie_data$movieId == table_views[index,1])$title)
}

# Shiny UI
ui <- fluidPage(
  titlePanel("Movie Recommendation System"),
  sidebarLayout(
    sidebarPanel(
      selectInput("user", "Select User", choices = unique(rating_data$userId)),
      actionButton("recommend", "Get Recommendations")
    ),
    mainPanel(
      h3("Top 10 Movie Recommendations"),
      tableOutput("recommendations"),
      h3("Top Viewed Movies"),
      plotOutput("topMoviesPlot")
    )
  )
)

# Shiny Server
server <- function(input, output) {
  recommendations <- eventReactive(input$recommend, {
    user <- as.integer(input$user)
    cat("Selected user:", user, "\n") # Debugging message
    
    predicted_recommendations <- predict(object = recommen_model,
                                         newdata = ratingMatrix[user, , drop=FALSE],
                                         n = 10)
    user_recommendations <- as(predicted_recommendations, "list")[[1]]
    cat("Recommendations (movie IDs):", user_recommendations, "\n") # Debugging message
    
    if (length(user_recommendations) == 0) {
      return(NULL)
    }
    
    recommended_movies <- sapply(user_recommendations, function(movie_id) {
      movie_title <- subset(movie_data, movie_data$movieId == movie_id)$title
      return(movie_title)
    })
    return(recommended_movies)
  })
  
  output$recommendations <- renderTable({
    req(recommendations())
    data.frame(Recommendation = recommendations())
  })
  
  output$topMoviesPlot <- renderPlot({
    ggplot(table_views[1:6, ], aes(x = title, y = views)) +
      geom_bar(stat="identity", fill = 'steelblue') +
      geom_text(aes(label=views), vjust=-0.3, size=3.5) +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      ggtitle("Total Views of the Top Films")
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
