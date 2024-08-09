library(palmerpenguins) #pacote para acessar dados sobre pinguins
library(dplyr) #pacote para manipular dados, como selecionar variáveis, filtrar observações e transformar variáveis 
library(ggplot2) #pacote para plotar gráficos

dados <- penguins #salvando o conjunto dos pinguins numa variável chamada dados
str(dados) #acessando a estrutura dos dados
summary(dados) #acessando um resumo dos dados
dados <- na.omit(dados) #removendo observações com valores faltantes
summary(dados) #acessando um resumo dos dados após a remoção de valores faltantes

adelie <- dados[dados$species == "Adelie",] #filtrando os pinguins da espécie Adelie

#usando o dplyr para manipular os dados

#exemplos de usos de select, filter, mutate

select(dados, species, island) #selecionando as variáveis species e island

dados |>
  select(species, island) #usando o operador pipe para selecionar as variáveis species e island

ggplot(data = dados, mapping = aes(x = body_mass_g, y = flipper_length_mm, colour = species))+
  geom_point() #plotando um gráfico de dispersão com as variáveis body_mass_g (peso do pinguim) e flipper_length_mm (comprimento da asa) e colorindo por espécie

dados |>
  filter(species == "Adelie") |>
  ggplot(mapping = aes(x = body_mass_g, y = flipper_length_mm, colour = sex))+
  geom_point(size = 2)+
  theme_minimal()+
  labs(x = "peso em gramas", y = "tamanho da asa em mm", title = "Peso versus Comprimento da asa") #plotando um gráfico de dispersão com as variáveis body_mass_g (peso do pinguim) e flipper_length_mm (comprimento da asa) e colorindo por sexo para os pinguins da espécie Adelie e adicionando títulos aos eixos e ao gráfico

dados |>
  ggplot(aes(x = island, fill = species))+
  geom_bar() #plotando um gráfico de barras com a variável island (ilha) e colorindo por espécie

dados |>
  filter(species == "Gentoo") |>
  ggplot(aes(x = sex, y = bill_length_mm))+
  geom_boxplot()+
  theme_minimal() #plotando um gráfico boxplot para a variável bill_length_mm (comprimento do bico) e para cada sexo dos pinguins da espécie Gentoo
