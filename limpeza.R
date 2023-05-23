library(data.table)
library(dplyr)
library(tidyverse)
library(funModeling)

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

central_europe_countries<-c("Germany", "Austria", "Czech Republic", "Slovakia", "Poland", "Hungary", "Switzerland", "Slovenia") # vetor que identifica os países da Europa Central

central_europe <- general_data %>% filter(location %in% central_europe_countries) # filtra casos apenas no vetor

central_europe <- central_europe %>% select(location, new_cases, new_deaths)

status(central_europe) # estrutura dos dados (missing etc)
freq(central_europe) # frequência das variáveis fator
plot_num(central_europe) # exploração das variáveis numéricas
profiling_num(central_europe) # estatísticas das variáveis numéricas

central_europe %>% filter(new_cases < 0)

central_europe <- central_europe %>% filter(new_cases>=0)

# exclusão de missings
ausente <- na.omit(central_europe)