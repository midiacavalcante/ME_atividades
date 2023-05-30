install.packages("ade4")
install.packages("arules")
install.packages("forcats")
library(ade4)
library(arules)
library(forcats)

# Carregando a base de dados (Perfil das pessoas vacinadas Covid-19)
PerfilVacinados <- read.csv2("http://dados.recife.pe.gov.br/dataset/7ccb3816-0d62-49e1-b39a-3159870883b0/resource/9664de94-9f07-4adc-848d-b6ef56510762/download/vacinados.csv")

str(PerfilVacinados)

View(PerfilVacinados)

# Convertendo em fatores (colunas 3 a 5)
for(i in 3:5) {
  PerfilVacinados[,i] <- as.factor(PerfilVacinados[,i]) } 

str(PerfilVacinados)

# Filtro por tipo de dado
factorPerfilVacinados <- unlist(lapply(PerfilVacinados, is.factor))  
PerfilVacinadosFactor <- PerfilVacinados[ , factorPerfilVacinados]

str(PerfilVacinadosFactor)

# One Hot Encoding
PerfilVacinadosDummy <- acm.disjonctif(PerfilVacinadosFactor)

# forcats - usando tidyverse para fatores
fct_count(PerfilVacinadosFactor$raca_cor) # conta os fatores

fct_anon(PerfilVacinados$raca_cor) # anonimiza os fatores

fct_lump(PerfilVacinados$raca_cor, n = 1) # reclassifica os fatores em mais comum e outros
