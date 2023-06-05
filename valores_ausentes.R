library(data.table)
library(funModeling)
library(tidyverse)

# Importando a base de dados (Velocidade das Vias - Quantitativo por v. média)
Lombadas2022Janeiro <- fread("http://dados.recife.pe.gov.br/dataset/71bd11f4-f312-4896-aa07-faecf4b0cad2/resource/54664913-928a-4967-8126-2e298a3728e4/download/janeirolomb2022.csv")

# Identificando e removendo valores ausentes
status(Lombadas2022Janeiro) # estrutura dos dados (missing etc)

# Complete-case analysis – listwise deletion
dim(Lombadas2022JaneiroCompleto <- na.omit(Lombadas2022Janeiro))

# Variação de Complete-case analysis – listwise deletion
dim(Lombadas2022JaneiroCompleto <- Lombadas2022Janeiro %>% filter(!is.na(qtd_51a60km)))

# Estimando se o NA é MCAR, MAR ou MANR
# Shadow Matrix do livro R in Action

Lombadas2022Janeiro <- fread("http://dados.recife.pe.gov.br/dataset/71bd11f4-f312-4896-aa07-faecf4b0cad2/resource/54664913-928a-4967-8126-2e298a3728e4/download/janeirolomb2022.csv")

head(Lombadas2022Janeiro) # observa a base

x <- as.data.frame(abs(is.na(Lombadas2022Janeiro))) # cria a matrix sombra
head(x) # observa a matriz sombra

y <- x[which(sapply(x, sd) > 0)] # mantém apenas variáveis que possuem NA
cor(y) # observa a correlação entre variáveis

cor(Lombadas2022Janeiro, y, use="pairwise.complete.obs") # no caso, x não é numérico

# Shadow Matrix 

MatrixLombadas2022Janeiro <- as.data.frame(abs(is.na(Lombadas2022Janeiro))) # cria a matrix sombra

MatrixLombadas2022Janeiro <- Lombadas2022Janeiro[which(sapply(MatrixLombadas2022Janeiro, sd) > 0)] # mantém variáveis com NA
round(cor(Lombadas2022Janeiro), 3) # calcula correlações