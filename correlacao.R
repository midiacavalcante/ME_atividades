# PACOTES #
pacman::p_load(data.table)

# LEITURA PARA TESTE DE CORRELAÇÃO #
airquality

cor.test(airquality$Wind, airquality$Temp)
# H0: variáveis são independentes / não têm associação. p-valor (p-value) > 0.05
# H1: variáveis são dependentes / há associação. p-valor (p-value) <= 0.05