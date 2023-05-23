library(data.table)
library(dplyr)
library(tidyverse)

general_data<-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

central_europe_countries<-c("Germany", "Austria", "Czech Republic", "Slovakia", "Poland", "Hungary", "Switzerland", "Slovenia") # vetor que identifica os países da Europa Central

central_europe<- general_data %>% filter(location %in% central_europe_countries) # filtra casos apenas no vetor

mcentral <- central_europe %>% group_by(location) %>% mutate(row = row_number()) %>% select(location, new_cases, row) # cria matriz dos países, agrupando por local, criando uma nova linha com index e selecionando apenas algumas variáveis

# filtra dados para garantir que todos os países tenham mesmo nro de casos
result <- mcentral %>% group_by(location) %>% filter(row == max(row))
mcentral <- mcentral %>% filter(row<=min(result$row))

# pivota o data frame de long para wide
mcentral <- mcentral %>% pivot_wider(names_from = row, values_from = new_cases) %>% remove_rownames %>% column_to_rownames(var="location") 