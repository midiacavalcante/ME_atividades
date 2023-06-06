## Carregar pacotes que serão usados
pacman::p_load(dplyr, ggplot2)

airquality

# Gráfico de Caixas Univariado
airquality %>% ggplot(aes(y = Wind)) + geom_boxplot()

# Gráfico de Caixas Multivariado
airquality %>% ggplot(aes(y = Wind, x = Temp)) + geom_boxplot()

# Histograma
airquality %>% ggplot(aes(x = Wind)) + geom_histogram()

# Densidade
airquality %>% ggplot(aes(x = Wind)) + geom_density()