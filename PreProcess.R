

## Fazer download dos dados da amostra do censo de 2010 diretamente do 
# site do IBGE
download.file(paste("ftp://ftp.ibge.gov.br/Censos/Censo_Demografico_2010/",
                    "Resultados_Gerais_da_Amostra/Microdados/SP2-RM.zip",sep=""),
              paste("C:/Users/rodrigo.silva/Documents/Projetos/EstudosdoCenso/",
                    "Deficiencia/SP2-RM.zip", sep="") )
   

## Descompactar os dados da amostra 2010.
unzip(zipfile = "SP2-RM.zip")


## Ir para o diretorio que contem os dado da amostra do censo 2010.
setwd("~/Projetos/EstudosdoCenso/Deficiencia/SP2-RM")

## Alguns diretorios possuem nomes escritos com caracteres especiais, são eles:
# Domicílios e Emigração que aparecem como "Domic¡lios" e "Emigra‡Æo". 
# Portanto, vamos corrigir o nome destes diretorios

## Renomear diretorio "Domic¡lios" para "Domicilios"
file.rename(from = file.path("Domic¡lios"), to = file.path("Domicilios"))

## Renomear diretorio "Emigra‡Æo" para "Emigracao"
file.rename(from = file.path("Emigra‡Æo"), to = file.path("Emigracao"))




