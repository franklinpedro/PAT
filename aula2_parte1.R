library(dplyr) # para manipulação de dados
library(tidytext) # para manipulação de texto
library(SnowballC) # para manipulação de texto
library(ggplot2) # para visualização de dados
library(wordcloud) # para visualização de palavras numa nuvem

mensagens <- read.csv("spam.csv") # importar os dados

mensagens <- mensagens |>
  select(v1,v2) |>
  mutate(classificacao = v1, texto = v2)|>
  select(classificacao, texto) # renomear as colunas e selecionar as colunas de interesse

mensagens_spam <- 
  mensagens |>
  filter(classificacao == "spam") # filtrar as mensagens que são spam e guardar numa variável 

mensagens_spam |>
  select(texto) |> # selecionar a coluna de texto
  unnest_tokens(output = words, input = texto, token = "words") |> # dividir o texto em palavras (tokenizacao por palavras)
  count(words, sort = TRUE) # contar as palavras e ordenar

stop_words <- add_row(stop_words, word = "ur", lexicon = "custom") # adicionar a palavra "ur" à lista de stop words

mensagens_spam |>
  select(texto) |>
  unnest_tokens(output = word, input = texto, token = "words") |>
  anti_join(stop_words) |> # remover as stop words
  count(word, sort = TRUE) |> 
  head(n = 10) |> # selecionar as 10 palavras mais frequentes
  mutate(word = reorder(word, n)) |> # ordenar as palavras por frequência
  ggplot(aes(y = word, x = n))+
  geom_col() +
  theme_minimal() # criar um gráfico de barras com as palavras mais frequentes
