ReadBigTable <- function(directory, dictionary, infile, outfile, citycode){

  # carregar biblioteca de leitura 
  library("LaF")
  
  ## Acessar o diretorio com os dados sobre domicilios.
  setwd(directory)
  
  ## Obter o numero de linhas da tabela
  size = determine_nlines(filename = infile)
  
  ## Ler dados de mortalidade
  dat <- laf_open_fwf(filename=infile, column_widths=dictionary$tamanho, 
                      column_types = dictionary$tipo,
                      column_names = dictionary$cod)
  
  ## Selecionar o indice da cidade de Sao Jose dos Campos. O codigo da cidade
  # e definido pela variavel 'V0002'. O codigo para o municipio de 
  # Sao Jose dos Campos e 49904
  #citycode = "49904"
  
  ## Comparar o codigo de Sao Jose com os codigos de todos os municipios que estao
  # na variavel 'V0002'. A variavel 'V0002' esta na coluna 2 da tabela dat.
  index = which(dat[,2] == citycode)
  
  sjc_data = dat[index,]
  
  dim(sjc_data)
  
  ## E necessario arrumar as variaveis cujos valores sao decimais. Para isso
  # iremos multiplicar cada variavel decimal pelo valor multiplicador que esta
  # na coluna multiplica do dicionario
  index = which(dictionary$multiplica != 1)
  for(i in index){
    
    sjc_data[,i] = sjc_data[,i]*dictionary$multiplica[i]
  }
  
  ## Sumario dos dados
  #summary(sjc_data)
  #str(sjc_data)
  
  ## Verficar primeiras linhas
  #head(sjc_data, 5)
  
  
  ## Escrever tabela de dados de mortalidade.
  write.csv2(sjc_data, file=outfile)
  
  
  ## Voltar para o diretorio principal do projeto.
  setwd("~/Projetos/EstudosdoCenso/Deficiencia")
  
  
 return(sjc_data)
  
}