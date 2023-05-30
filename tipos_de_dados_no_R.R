# Criando uma estrutura de fatores

# Cinco países com mais copas do mundo

País <- c("Brasil", "Alemanha", "Italia", "Argentina", "Uruguai")

# Variável Pais como fator

as.factor(País)

País <- c(5, 4, 4, 2, 2)
recode <- c(Brasil = 5, Alemanha = 4, Italia = 4, Argentina = 2, Uruguai = 2)
(País <- factor(País, levels = recode, labels = names(recode)))

# Verificando

is.numeric(País)
is.character(País)
is.factor(País)
