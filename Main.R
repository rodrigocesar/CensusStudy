## Script principal 


######################################################################
############ Carregar funcoes definidas pelo usuario #################
######################################################################

## funcao para baixar os dados da amostra do site do IBGE
source('DownloadData.R') 

## funcao para ler as tabelas
source('ReadBigTable.R') 

## funcao para extrair os dados por municipio
source('ExtractData.R') 

######################################################################
#################### Declarar variaveis globais ######################
######################################################################

citycode <<- '49904'


######################################################################
######### Fazer Download dos dados da amostra do Censo 2010 ##########
######################################################################

DownloadData()

######################################################################
############## Extrair os dados de Sao Jose dos Campos ###############
######################################################################

data = ExtractData(citycode = citycode)
