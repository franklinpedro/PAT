1+1 # o r é uma calculadora básica também

b <- 1 # atribuição de valor
a <- b
b <- 3

d <- 'vetor' # strings no r
class(d) # tipo de variável
class(b)

install.packages("palmerpenguins") # instalação de pacotes
library(palmerpenguins) # carregando o pacote
dados <- penguins # salvando o conjunto penguins numa variável chamada dados
ilha <- dados[,2] # salvando a coluna 2 do conjunto dados (variavel island, a ilha onde o pinguim habita) numa variável chamada ilha
table(dados[,2]) # tabela de frequência da variável ilha
barplot(table(dados[,2])) # gráfico de barras da tabela de frequência da variável ilha

dados$island # acessando a variável island do conjunto dados a partir do nome da variável; usamos $ para isso
dados$sex # acessando a variável sex
dados$body_mass_g # acessando a variável body_mass_g (peso do pinguim)
mean(dados$body_mass_g, na.rm = TRUE) # média do peso dos pinguins sem contar os dados faltantes
dados$species # acessando a variável species

dados$species == "Adelie" # operação lógica que retorna TRUE para os pinguins da espécie Adelie e FALSE para os demais

especies <- as.character(unique(dados$species)) # salvando as espécies de pinguins numa variável chamada especies
especies[3] # acessando a terceira espécie de pinguim
sum(dados$species == "Adelie") # contando quantos pinguins são da espécie Adelie

adelie <- dados[dados$species == "Adelie",] # salvando os pinguins da espécie Adelie numa variável chamada adelie

mean(adelie$body_mass_g, na.rm = TRUE) # média do peso dos pinguins da espécie Adelie
is.na(dados$body_mass_g) # operação lógica que retorna TRUE para os dados faltantes e FALSE para os demais para a variável body_mass_g
sum(is.na(dados$body_mass_g)) # contando quantos dados faltantes temos na variável body_mass_g


dados_spam <- read.csv(file = "spam.csv", header = TRUE) # lendo o arquivo spam.csv e salvando na variável dados_spam

table(dados_spam$v1) # tabela de frequência da variável v1
