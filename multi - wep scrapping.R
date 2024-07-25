# Load required libraries
library(rvest)
library(tm)
library(wordcloud2)

# Initialize an empty vector to store all reviews
all_reviews <- character(0)

# URL of the product reviews page
base_url <- "https://www.flipkart.com/apple-iphone-14-starlight-128-gb/p/itm3485a56f6e676?pid=MOBGHWFHABH3G73H&lid=LSTMOBGHWFHABH3G73HCNASCL&marketplace=FLIPKART&q=mobiles+5g&store=tyy%2F4io&spotlightTagId=BestsellerId_tyy%2F4io&srno=s_1_2&otracker=AS_QueryStore_OrganicAutoSuggest_3_6_na_na_na&otracker1=AS_QueryStore_OrganicAutoSuggest_3_6_na_na_na&fm=search-autosuggest&iid=79f02d3a-bd01-4bf4-9d0f-e7bff8b217d7.MOBGHWFHABH3G73H.SEARCH&ppt=sp&ppn=sp&ssid=jwzgpr0uxc0000001697706478236&qH=17973881c3a9b78c"

# Number of pages of reviews to scrape (adjust as needed)
num_pages <- 5

for (page in 1:num_pages) {
  # Construct the URL for the current page
  url <- paste0(base_url, "&page=", page)
  
  # Read the HTML of the current page
  page <- read_html(url)

  # Extract reviews using a more specific selector
  flipkart_reviews <- page %>%
    html_nodes(".t-ZTKy") %>%
    html_text()
  
  # Append the current page's reviews to the vector
  all_reviews <- c(all_reviews, flipkart_reviews)
  
  # Pause for a few seconds to be polite to the website
  Sys.sleep(2)
}

# Save all reviews to a text file
writeLines(all_reviews, "pro_reviews.txt")


#This step prepares the text data for further processing.
# Create a corpus(corpus fuction from tm package)
corpus <- Corpus(VectorSource(all_reviews))

# Clean the text
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords('english'))


# Create a term document matrix
#This matrix represents the frequency of terms (words) in the corpus.
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
           shuffle = TRUE,
           rotateRatio = 1,
           minSize = 0)
