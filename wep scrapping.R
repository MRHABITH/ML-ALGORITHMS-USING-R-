#web scraping

# Load required libraries
library(rvest)
library(tm)
library(wordcloud2)

# Web scraping for Flipkart reviews
murl <- read_html("https://www.amazon.in/POCO-Forest-Green-128GB-Storage/dp/B0CJ6SHZFS/ref=sr_1_7?crid=82OMTH5BE8WC&dib=eyJ2IjoiMSJ9.iWrjCjJZgdHWrK7i-0B3dmFX_uxgtkvtxns4_oVWKxDxrPzBXWeuvynmay_6L0P11Uj14Zkn7thUofPvH7q5TVAt3JS-TZs9mqJZiHASv0F0IVWC6fppnCjX6B50raMlhQKTge2gvFpCmou5cn_4JrMl4NG4qKqBCKG4Cx8T0FgZLQWeKKi0OevH1emyVlLGcbsnmXMcUjluU6h5vyTSFfcOKdtCFU-7jeSa6fws3yE.73jJWg7Ufao1AirfCIJwUy208Ws342AILbfGumcJLOo&dib_tag=se&keywords=mobile&qid=1713361285&sprefix=mobile%2Caps%2C231&sr=8-7")

flipkart_reviews <- murl %>%
  html_nodes("div.t-ZTKy") %>%
  html_text()
flipkart_reviews
# Save reviews to a text file
write.table(flipkart_reviews, "hari.txt")

# Read the saved reviews
text <- readLines("hari.txt", encoding = "UTF-8")
text
# Create a corpus
corpus <- Corpus(VectorSource(text))

# Clean the text
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords('english'))#eg:the,are,is


# Create a term document matrix
tdm <- TermDocumentMatrix(corpus)

# Get word frequencies and sort them
w <- sort(rowSums(as.matrix(tdm)), decreasing = FALSE)

# Generate word cloud
set.seed(222)
wordcloud2(data.frame(word = names(w), freq = w),
           size = 0.5,
           shape = 'cardioid',
           color = 'random-dark',
           backgroundColor = "white",
           shuffle = FALSE,
           rotateRatio = 1,
           minSize = 0)

