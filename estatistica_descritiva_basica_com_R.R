# Base USArrests é nativa do R
USArrests

# Tabela da frequência absoluta da variável Murder
table(USArrests$Murder)

# Tabela da frequência relativa da variável Murder
prop.table(table(USArrests$Murder))

# Média da variável Murder
mean(USArrests$Murder)

# Mediana da variável Murder
median(USArrests$Murder)

# Separatrizes da variável Murder
quantile(USArrests$Murder, probs=0.75)
quantile(USArrests$Murder, probs=0.10)
quantile(USArrests$Murder, probs=0.95)

# Desvio padrão da variável Murder
sd(USArrests$Murder)

# Sumário descritivo básico das variáveis
summary(USArrests)

# Sumário descritivo completo das variáveis com o pacote fBasics
pacman::p_load(fBasics)
basicStats(USArrests[ , c(1:4)])