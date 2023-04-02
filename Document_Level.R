library(pdftools)
library(tm)
library(wordcloud)
library(syuzhet)

cmie <- pdf_text("CMIE Airlines.pdf")
icra <- pdf_text("ICRA Airlines.pdf")


corpuscmie <- Corpus(VectorSource(cmie))
corpusicra <- Corpus(VectorSource(icra))

wordcloud(corpusicra, colors = rainbow(7), max.words = 50)
wordcloud(corpuscmie, colors = rainbow(7), max.words = 50)

corpuscmie <- tm_map(corpuscmie, tolower)
corpuscmie <- tm_map(corpuscmie, removePunctuation)
corpuscmie <- tm_map(corpuscmie, removeWords, c(stopwords("english")))
corpuscmie <- tm_map(corpuscmie, stemDocument)

corpusicra <- tm_map(corpusicra, tolower)
corpusicra <- tm_map(corpusicra, removePunctuation)
corpusicra <- tm_map(corpusicra, removeWords, c(stopwords("english")))
corpusicra <- tm_map(corpusicra, stemDocument)

icra_sent <- get_sentences(icra)
cmie_sent <- get_sentences(cmie)

icra_senti <- get_sentiment(icra_sent)
cmie_senti <- get_sentiment(cmie_sent)

simple_plot(icra_senti)
simple_plot(cmie_senti)

sum(icra_senti)
sum(cmie_senti)
