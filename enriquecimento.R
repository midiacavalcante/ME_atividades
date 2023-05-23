# carregando pacotes
pacman::p_load(dplyr, tidyverse)

# carregando as bases de dados
LicenciamentoUrbanistico <- read.csv2("http://dados.recife.pe.gov.br/dataset/e2bd8f0b-1d62-4323-8159-8ebd6ed9eb4a/resource/77c885c4-76ca-45eb-9209-06c5d217122d/download/licenciamento_urbanistico.csv", sep = ";", encoding = "UTF-8")

LicenciamentoSanitario <- read.csv2("http://dados.recife.pe.gov.br/dataset/3a4869e7-7021-485e-97fb-f25cd6422ea6/resource/6bb70e99-b7b9-4b2a-a213-adc757e3337a/download/licenciamento_sanitario.csv", sep = ";", encoding = "UTF-8" )

# usando o join nessa dupla de bases
licenciamento_urbanistico_sanitario <- left_join(LicenciamentoUrbanistico, LicenciamentoSanitario, by = c("data_entrada" = "razao_social"))