pacman::p_load(ccaPP, lsa, minerva, Rfast, data.table)

# Criando função para rodar várias associações
multi.cor <- function(x, y) {
  c(
    cor = cor(x, y), # Correlação
    dcor = dcor(x, y), # Distance correlation
    cosine = cosine(x, y), # Distância do Cosseno 
    maxCor = maxCorProj(x, y), # Maximal correlation
    MIC = mine (x, y) #  Maximal Information Coefficient
  )
}

# Base airquality, nativa do R
airquality

plot(airquality)

corList <- multi.cor(airquality$Wind, airquality$Temp)
names(corList)
corList <- corList[c(1,5,6,7, 15)]
corList

# Exemplo 2 quadrática
k <- airquality$Wind
l <- airquality$Temp

plot(k, l)

corList <- multi.cor(k, l)
corList <- corList[c(1,5,6,7, 15)]
corList