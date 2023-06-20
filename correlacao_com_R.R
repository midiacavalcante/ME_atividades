## CORRELAÇÃO COM R ##
# Carregando os pacotes
pacman::p_load(corrplot, dplyr, ggplot2)

# Carregando a base de dados (nativa do R, peso de pintinhos ao longo do tempo)
ChickWeight

# Base de dados sem Chick e Diet (variáveis categóricas)
ChickWeightNoChickDiet <- ChickWeight %>% select(-Chick, -Diet)

# Tabela de correlação com todas as variáveis
cor(ChickWeightNoChickDiet)

# Gráficos de dispersão pareados das variáveis
pairs(ChickWeightNoChickDiet)

# Corrplot das variáveis
ChickWeightCor <- cor(ChickWeightNoChickDiet)
corrplot(ChickWeightCor, method = "number", order = 'alphabet')
corrplot(ChickWeightCor, order = 'alphabet') 
