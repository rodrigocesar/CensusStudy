DownloadData <- function(){
  
  
  library('utils')
  ## Ir para o diretorio principal do projeto.
  setwd("~/Projetos/EstudosdoCenso/Deficiencia")
  
  
  ## Fazer download dos dados da amostra do censo de 2010 diretamente do 
  # site do IBGE
  download.file(paste("ftp://ftp.ibge.gov.br/Censos/Censo_Demografico_2010/",
                      "Resultados_Gerais_da_Amostra/Microdados/SP1.zip",sep=""),
                paste("C:/Users/rodrigo.silva/Documents/Projetos/EstudosdoCenso/",
                      "Deficiencia/SP1.zip", sep="") )
  
  ## Fazer download da documentacao dos dados da amostra do censo de 2010 
  # diretamente do  site do IBGE
  download.file(paste("ftp://ftp.ibge.gov.br/Censos/Censo_Demografico_2010/",
                      "Resultados_Gerais_da_Amostra/Microdados",
                      "/Documentacao.zip",sep=""),
                paste("C:/Users/rodrigo.silva/Documents/Projetos/EstudosdoCenso/",
                      "Deficiencia/Documentacao.zip", sep="") )
     
  
  ## Descompactar os dados da amostra 2010.
  unzip(zipfile = "SP1.zip", overwrite=TRUE, junkpaths=TRUE)
  #zip.file.extract(file = "SP1.zip", unzip = getOption("unzip"))
  #unz(description = "SP1.zip", filename = 'xxx')
  
  ## Descompactar os dados da documentacao da amostra 2010.
  unzip(zipfile = "Documentacao.zip", exdir = "Documentacao")
  
    
}  
