# chamando a base de dados
LicenciamentoUrbanistico <- read.csv2("http://dados.recife.pe.gov.br/dataset/7ccb3816-0d62-49e1-b39a-3159870883b0/resource/ca7fb968-3a2c-44ff-a2e8-730d1a689407/download/vacinados.csv", sep = ";", encoding = "UTF-8")

install.packages("funModeling")
library(funModeling)

install.packages("tidyverse")
library(tidyverse)


glimpse(LicenciamentoUrbanistico) # olhar os dados de maneira geral
status(LicenciamentoUrbanistico) # verificar a estrutura dos dados
freq(LicenciamentoUrbanistico) # ver a frequência das variáveis fator
plot_num(LicenciamentoUrbanistico) # variáveis numéricas
profiling_num(LicenciamentoUrbanistico) # estatísticas das variáveis numéricas