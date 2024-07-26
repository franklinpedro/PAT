library(dplyr)
library(rvest)
library(stringr)
library(tidytext)
library(janeaustenr)
library(ggplot2)
library(SnowballC)
library(textdata)
library(tidyr)
library(wordcloud)

dados <- read.csv("russian_tweets.csv")

str(dados)
unique(dados$language)

stop_words <- add_row(stop_words, word = "rt", lexicon = "custom")

stop_words <- add_row(stop_words, word = "t.co", lexicon = "custom")

stop_words <- add_row(stop_words, word = "https", lexicon = "custom")

stop_words <- add_row(stop_words, word = "http", lexicon = "custom")

stop_words <- add_row(stop_words, word = "amp", lexicon = "custom")

conjunto_pronto <- dados |>
  filter(language == "English") |>
  unnest_tokens(output = word, input = content, token = "words") |>
  anti_join(stop_words) |>
  mutate(word = wordStem(word)) |>
  count(word, sort = TRUE)

wordcloud(conjunto_pronto$word, conjunto_pronto$n, max.words = 20, colors = brewer.pal(8, "Dark2"))


livros <- austen_books() |>
  group_by(book) |>
  mutate(capitulo = cumsum(str_detect(text, pattern = regex("^Chapter\\s+(\\d+|[IVXLCDM])", ignore_case = TRUE)))) |>
  ungroup()

livros |>
  unnest_tokens(output = word, input = text, token = "words") |>
  anti_join(stop_words) |>
  mutate(word = wordStem(word))

livros |>
  unnest_tokens(output = word, input = text, token = "words") |>
  inner_join(get_sentiments("bing")) |>
  count(book, capitulo, sentiment) |>
  spread(sentiment, n, fill = 0) |>
  mutate(sentimento = positive - negative) |>
  ggplot(aes(x = capitulo, y = sentimento, fill = book))+
  geom_col(show.legend = FALSE)+
  facet_wrap(~book, scales = "free_x")
