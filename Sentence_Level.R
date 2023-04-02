library(pdftools)
library(wordcloud)
library(twitteR)
library(RJSONIO)
library(bitops)
library(RCurl)
library(ROAuth)
library(openssl)
library(SnowballC)
library(syuzhet)
library(tm)

CK <- "6G9y1jxawTCyCUgBEkovOOL1M"
CS <- "4ipFT3cRM5g6JFzVcnLUO0TkLlYE61GwbzsWIEkLh1bxOjRIoK"
AT <-  "958353730306363392-o7cvDKaA3xrnrA1R7gdoBafw4hVQpj3"
AS<- "ySQ7fayMyenTPMEQS4TqWwziwYmQofQon6rhCh3CYVBcE"


setup_twitter_oauth(CK, CS, AT, AS)
tweets <- searchTwitter("Urjit Patel", since="2018-12-10",n=2000)
urjittweets<- twListToDF(tweets)
write.csv(urjittweets, file = "Urjit_Tweets.csv")
urjit_sent <- get_sentiment(urjittweets$text)
sum(urjit_sent)

tweets <- searchTwitter("Shaktikanta Das", since="2018-12-10",n=2000)
Shaktikantatweets<- twListToDF(tweets)
write.csv(Shaktikantatweets, file = "Shaktikanta_Tweets.csv")
Shaktikanta_sent <- get_sentiment(Shaktikantatweets$text)
sum(Shaktikanta_sent)

corpusurjit <- Corpus(VectorSource(urjittweets))
corpusshakthikanth <- Corpus(VectorSource(Shaktikantatweets))

corpusurjit <- tm_map(corpusurjit, tolower)
corpusurjit <- tm_map(corpusurjit, removePunctuation)
corpusurjit <- tm_map(corpusurjit, removeWords, c(stopwords("english")))
corpusurjit <- tm_map(corpusurjit, stemDocument)

corpusshakthikanth <- tm_map(corpusshakthikanth, tolower)
corpusshakthikanth <- tm_map(corpusshakthikanth, removePunctuation)
corpusshakthikanth <- tm_map(corpusshakthikanth, removeWords, c(stopwords("english")))
corpusshakthikanth <- tm_map(corpusshakthikanth, stemDocument)

wordcloud(corpusurjit, colors = rainbow(7), max.words = 50)
wordcloud(corpusshakthikanth, colors = rainbow(7), max.words = 50)
