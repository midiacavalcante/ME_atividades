ls() # lista todos os objetos no R: "naZero", "colunas_iguais", "colunas_iguais_2019", "itm", "sinistrosRecife2019Raw", "sinistrosRecife2020Raw", "sinistrosRecife2021Raw", "sinistrosRecifeRaw"

# vamos ver quanto cada objeto está ocupando

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
} # sinistrosRecifeRaw ocupa mais espaço: 2478928

# agora, vamos remover

gc()

rm(list = c("colunas_iguais", "colunas_iguais_2019" ,"itm",
            "sinistrosRecife2019Raw", "sinistrosRecife2020Raw", "sinistrosRecife2021Raw"))

saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")
