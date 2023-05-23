pacman::p_load(data.table, dplyr, tidyverse, validate)

general_data<-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

central_europe_countries<-c("Germany", "Austria", "Czech Republic", "Slovakia", "Poland", "Hungary", "Switzerland", "Slovenia") # vetor que identifica os países da Europa Central

central_europe<- general_data %>% filter(location %in% central_europe_countries) # filtra casos apenas no vetor

central_europe <- central_europe %>% select(location, new_cases, new_deaths)

regras_central_europe <- validator(new_cases >= 0, new_deaths >= 0)

validacao_central_europe <- confront(central_europe, regras_central_europe)

summary(validacao_central_europe)

plot(validacao_central_europe)