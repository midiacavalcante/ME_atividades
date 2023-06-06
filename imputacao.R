library(data.table)
library(Hmisc)
library(VIM)

## imputação numérica
# preparação da base, colocando NA aleatórios

# Base de dados AirQuality, nativa do R
airquality

airqualityDT <- airquality %>% setDT() #copiar base iris, usando a data.table

(airqualityNASeed <- round(runif(10, 1, 50))) # criamos 10 valores aleatórios

(airquality$wind[airqualityNASeed] <- NA) # imputamos NA nos valores aleatórios

# tendência central
airqualityDT$Wind <- impute(airqualityDT$Wind, fun = mean) # média
airqualityDT$Wind <- impute(airquality$Wind, fun = median) # mediana

is.imputed(airqualityDT$Wind) # teste se o valor foi imputado
table(is.imputed(airqualityDT$Wind)) # tabela de imputação por sim / não

# predição
airqualityDT$Wind[airqualityNASeed] <- NA # recolocamos os NA

regairquality <- lm(Wind ~ ., data = airqualityDT) # criamos a regressão
airqualityNAIndex <- is.na(airqualityDT$Wind) # localizamos os NA
airqualityDT$Wind[airqualityNAIndex] <- predict(regairquality, newdata = airqualityDT[airqualityNAIndex, ]) # imputamos os valores preditos

## Hot deck
# imputação aleatória
airqualityDT$Wind[airqualityNASeed] <- NA # recolocamos os NA

(airqualityDT$Wind <- impute(airqualityDT$Wind, "random")) # fazemos a imputação aleatória

# imputação por instâncias /semelhança
airqualityDT$Wind[airqualityNASeed] <- NA # recolocamos os NA
airqualityDT2 <- kNN(airqualityDT)