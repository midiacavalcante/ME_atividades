library(dplyr)

# carregando base de dados original (Licenciamento urbanístico)
LicenciamentoUrbanistico <- read.csv2("http://dados.recife.pe.gov.br/dataset/e2bd8f0b-1d62-4323-8159-8ebd6ed9eb4a/resource/77c885c4-76ca-45eb-9209-06c5d217122d/download/licenciamento_urbanistico.csv", sep = ";", encoding = "UTF-8")

LicenciamentoUrbanistico <- LicenciamentoUrbanistico[-3,] # retirando a terceira linha

# carregando base de dados atualizada
LicenciamentoUrbanisticoNew <- read.csv2("http://dados.recife.pe.gov.br/dataset/e2bd8f0b-1d62-4323-8159-8ebd6ed9eb4a/resource/77c885c4-76ca-45eb-9209-06c5d217122d/download/licenciamento_urbanistico.csv", sep = ";", encoding = "UTF-8")

View(LicenciamentoUrbanisticoNew)

# comparando usando chave primária
LicenciamentoUrbanisticoIncremento <- (!LicenciamentoUrbanisticoNew$data_conclusao %in% LicenciamentoUrbanistico$data_conclusao)

# comparando linha a linha
setdiff(LicenciamentoUrbanisticoNew, LicenciamentoUrbanistico)

# juntando as duas bases
LicenciamentoUrbanistico <- rbind(LicenciamentoUrbanistico, LicenciamentoUrbanistico[LicenciamentoUrbanisticoIncremento,])