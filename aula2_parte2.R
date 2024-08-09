library(rvest) # pacote para web scraping

url <- "https://edition.cnn.com/2024/05/30/science/lunar-time-zone-scale-nasa-artemis-scn/index.html" # url da notícia

html <- read_html(url) # ler o html da página
html |> 
  html_elements("h1") |> # selecionar o título da notícia que é um elemento h1
  html_text2() # extrair o texto do título

texto <- html |>
  html_elements("p.paragraph") |> # selecionar os parágrafos da notícia que são elementos p com a classe paragraph
  html_text2() # extrair o texto dos parágrafos

noticia <- data.frame(texto)
noticia
