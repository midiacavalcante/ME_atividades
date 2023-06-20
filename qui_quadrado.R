## QUI-QUADRADO COM R ##
# Carregando os pacotes
pacman::p_load(data.table, ggplot2)

# Carregando a base de dados
breast_cancer <- fread('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/breast_cancer.csv', stringsAsFactors = T)
View(breast_cancer)

# Tabela de contingência
breast_cancer_table <- table(breast_cancer$idade, breast_cancer$tumor_tamanho)
breast_cancer_table

# Gráficos de dispersão pareados das variáveis
ggplot(breast_cancer) + aes(x = tumor_tamanho, fill = idade) + geom_bar(position = "fill")

# Teste qui quadrado
breast_cancer_test <- chisq.test(breast_cancer_table)
breast_cancer_test
breast_cancer_test$observed
breast_cancer_test$expected

# Corrplot das variáveis
corrplot(breast_cancer_test$residuals, is.cor = FALSE)