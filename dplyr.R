library(dplyr)

# carregando a base de dados (Perfil dos vacinados Covid-19 2023)
PerfilVacinados <- read.csv2("http://dados.recife.pe.gov.br/dataset/7ccb3816-0d62-49e1-b39a-3159870883b0/resource/ca7fb968-3a2c-44ff-a2e8-730d1a689407/download/vacinados.csv", sep = ";", encoding = "UTF-8")

# sumário (coluna grupo)
count(PerfilVacinados, grupo)

# sumário com agrupamento
PerfilVacinados %>% group_by(grupo) %>% summarise(avg = mean(idade))

#manipulando casos

#selecionando casos
PerfilVacinados %>% group_by(grupo, sexo) %>% summarise (avg = mean(idade)) 
PerfilVacinados %>% summarise (avg = mean(idade))

#ordenando casos
arrange(PerfilVacinados, grupo) #crescente
arrange(PerfilVacinados, desc(grupo)) # decrescente

#manipulando colunas

# selecionando colunas
PerfilVacinados %>% select(idade, sexo, raca_cor) %>% arrange(idade)

# renomendo coluna
PerfilVacinados %>% rename(cor = raca_cor)