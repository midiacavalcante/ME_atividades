# extrair / carregar arquivos texto

# arquivos de texto com read.csv2
PerfilVacinadosCovid19 <- read.csv2('http://dados.recife.pe.gov.br/dataset/7ccb3816-0d62-49e1-b39a-3159870883b0/resource/ca7fb968-3a2c-44ff-a2e8-730d1a689407/download/vacinados.csv', sep = ';', encoding = 'UTF-8'
)

# arquivos json
install.packages('rjson')
library(rjson)

DicionariodeDadosPerfilVacinados <- fromJSON(file= "http://dados.recife.pe.gov.br/dataset/7ccb3816-0d62-49e1-b39a-3159870883b0/resource/224d1cba-d5fa-415b-979e-a15f21ee88b2/download/metadados_perfilvacinados.json" )

DicionariodeDadosPerfilVacinados <- as.data.frame(DicionariodeDadosPerfilVacinados)

# arquivos xml
install.packages('XML')
library(XML)

SwissProt <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/SwissProt/SwissProt.xml")
