library(rvest)
library(wordcloud)

# Define the URL
url <- "https://www.amazon.in/Redmi-Note-Iceberg-256GB-Storage/product-reviews/B0BRVJ54ZP/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews"

# Function to extract reviews from a single page
extract_reviews <- function(url) {
  page <- read_html(url)
  reviews <- page %>% html_nodes(xpath = '//span[@class="a-size-base review-text review-text-content"]') %>% html_text()
  return(reviews)
}

# Initialize list to store all reviews
amazon_reviews <- list()

# Loop through multiple pages to extract reviews
for (i in 1:10) {
  reviews <- extract_reviews(url)
  amazon_reviews <- c(amazon_reviews, reviews)
  
  # Update URL for next page
  url <- gsub("ref=cm_cr_dp_d_show_all_btm", paste0("ref=cm_cr_dp_d_show_all_btm?pageNumber=", i+1), url)
}

# Write reviews to a text file
writeLines(unlist(amazon_reviews), "ML_s.tsv")

# Combine reviews into a single string
ip_rev_string <- tolower(paste(amazon_reviews, collapse = " "))

# Remove unwanted symbols and numbers
ip_rev_string <- gsub("[^A-Za-z]+", " ", ip_rev_string)

# Split the string into individual words
ip_reviews_words <- strsplit(ip_rev_string, "\\s+")[[1]]

# Load stopwords
STOPWORDS <- c("i", "me", "my", "myself", "we", "our", "ours", "ourselves", "you", "your", "yours", "yourself", "yourselves", "he", "him", "his", "himself", "she", "her", "hers", "herself", "it", "its", "itself", "they", "them", "their", "theirs", "themselves", "what", "which", "who", "whom", "this", "that", "these", "those", "am", "is", "are", "was", "were", "be", "been", "being", "have", "has", "had", "having", "do", "does", "did", "doing", "a", "an", "the", "and", "but", "if", "or", "because", "as", "until", "while", "of", "at", "by", "for", "with", "about", "against", "between", "into", "through", "during", "before", "after", "above", "below", "to", "from", "up", "down", "in", "out", "on", "off", "over", "under", "again", "further", "then", "once", "here", "there", "when", "where", "why", "how", "all", "any", "both", "each", "few", "more", "most", "other", "some", "such", "no", "nor", "not", "only", "own", "same", "so", "than", "too", "very", "s", "t", "can", "will", "just", "don", "should", "now")

# Remove stopwords
ip_reviews_words <- ip_reviews_words[!ip_reviews_words %in% STOPWORDS]

# Combine words into a single string
ip_rev_string <- paste(ip_reviews_words, collapse = " ")

# Create word cloud
wordcloud(ip_reviews_words, min.freq = 5, random.order = FALSE,
          colors = brewer.pal(11, "Dark2"))
