## Esse script é usado para extrair somente os dados do municipio de Sao Jose
# dos Campos das tabelas da amostra do Censo de 2010.

ExtractData <-function(citycode){

  # limpar memória do R
  rm(list=ls(all=TRUE))
  
  ## Ir para o diretorio principal do projeto.
  setwd("~/Projetos/EstudosdoCenso/Deficiencia")
  
  # Carregar funcoes definidas pelo usuario
  source('ReadBigTable.R')
  
  ##############################################################################
  #################### Extrair os dados da tabela pessoas ######################
  #############################################################################
  
  # Diretorio onde esta a tabela com os dados das pessoas
  #directory = "~/Projetos/EstudosdoCenso/Deficiencia/SP1/Pessoas"
  directory = "~/Projetos/EstudosdoCenso/Deficiencia"
  
  # Carregar o arquivo com o dicionario das variaveis da tabela das pessoas.
  setwd("~/Projetos/EstudosdoCenso/Deficiencia/Dicionarios")
  dictionary = read.csv2(file='DicionarioPessoas.csv', header=TRUE,
                               stringsAsFactors = FALSE)
  ## Ir para o diretorio principal do projeto.
  setwd("~/Projetos/EstudosdoCenso/Deficiencia")
  
  # Nome do arquivo texto que contem os dados das pessoas
  infile = 'Amostra_Pessoas_35_outras.txt'
  
  # Nome do arquivo csv de saida que contem os dados das pessoas de SJC
  outfile = 'SJCpess.csv'
  
  ## Selecionar o indice da cidade de Sao Jose dos Campos. O codigo da cidade
  # e definido pela variavel 'V0002'. O codigo para o municipio de 
  # Sao Jose dos Campos e 49904
  #sjc_cod = citycode
  
  pess = ReadBigTable(directory = directory, dictionary = dictionary,
                      infile = infile, outfile = outfile, citycode = citycode)
  
  
  ##############################################################################
  #################### Extrair os dados da tabela domicilios ######################
  #############################################################################
  
  # Diretorio onde esta a tabela com os dados dos domicilios
  #directory = "~/Projetos/EstudosdoCenso/Deficiencia/SP1/domicilios"
  directory = "~/Projetos/EstudosdoCenso/Deficiencia"
  
  # Carregar o arquivo com o dicionario das variaveis da tabela dos domicilios.
  setwd("~/Projetos/EstudosdoCenso/Deficiencia/Dicionarios")
  dictionary = read.csv2(file='DicionarioDomicilios.csv', header=TRUE,
                         stringsAsFactors = FALSE)
  ## Ir para o diretorio principal do projeto.
  setwd("~/Projetos/EstudosdoCenso/Deficiencia")
  
  # Nome do arquivo texto que contem os dados dos domicilios
  infile = 'Amostra_Domicilios_35_outras.txt'
  
  # Nome do arquivo csv de saida que contem os dados dos domicilios de SJC
  outfile = 'SJCdom.csv'
  
  ## Selecionar o indice da cidade de Sao Jose dos Campos. O codigo da cidade
  # e definido pela variavel 'V0002'. O codigo para o municipio de 
  # Sao Jose dos Campos e 49904
  #sjc_cod = "49904"
  
  dom = ReadBigTable(directory = directory, dictionary = dictionary,
                      infile = infile, outfile = outfile, citycode = citycode)
  
  
  
  ##############################################################################
  #################### Extrair os dados da tabela emigracao ######################
  #############################################################################
  
  # Diretorio onde esta a tabela com os dados de emigracao
  #directory = "~/Projetos/EstudosdoCenso/Deficiencia/SP1/Emigracao"
  directory = "~/Projetos/EstudosdoCenso/Deficiencia"
  
  # Carregar o arquivo com o dicionario das variaveis da tabela de emigracao.
  setwd("~/Projetos/EstudosdoCenso/Deficiencia/Dicionarios")
  dictionary = read.csv2(file='DicionarioEmigracao.csv', header=TRUE,
                         stringsAsFactors = FALSE)
  ## Ir para o diretorio principal do projeto.
  setwd("~/Projetos/EstudosdoCenso/Deficiencia")
  
  # Nome do arquivo texto que contem os dados de emigracao
  infile = 'Amostra_Emigracao_35_outras.txt'
  
  # Nome do arquivo csv de saida que contem os dados de emigracao de SJC
  outfile = 'SJCemigra.csv'
  
  ## Selecionar o indice da cidade de Sao Jose dos Campos. O codigo da cidade
  # e definido pela variavel 'V0002'. O codigo para o municipio de 
  # Sao Jose dos Campos e 49904
  #sjc_cod = "49904"
  
  emigra = ReadBigTable(directory = directory, dictionary = dictionary,
                     infile = infile, outfile = outfile, citycode = citycode)
  
  ##############################################################################
  ################## Extrair os dados da tabela mortalidade ####################
  #############################################################################
  
  # Diretorio onde esta a tabela com os dados de mortalidade.
  #directory = "~/Projetos/EstudosdoCenso/Deficiencia/SP1/Mortalidade"
  directory = "~/Projetos/EstudosdoCenso/Deficiencia"
  
  # Carregar o arquivo com o dicionario das variaveis da tabela de mortalidade.
  setwd("~/Projetos/EstudosdoCenso/Deficiencia/Dicionarios")
  dictionary = read.csv2(file='DicionarioMortalidade.csv', header=TRUE,
                         stringsAsFactors = FALSE)
  ## Ir para o diretorio principal do projeto.
  setwd("~/Projetos/EstudosdoCenso/Deficiencia")
  
  # Nome do arquivo texto que contem os dados de mortalidade
  infile = 'Amostra_Mortalidade_35_outras.txt'
  
  # Nome do arquivo csv de saida que contem os dados de mortalidade de SJC
  outfile = 'SJCmort.csv'
  
  ## Selecionar o indice da cidade de Sao Jose dos Campos. O codigo da cidade
  # e definido pela variavel 'V0002'. O codigo para o municipio de 
  # Sao Jose dos Campos e 49904
  #sjc_cod = "49904"
  
  mort = ReadBigTable(directory = directory, dictionary = dictionary,
                     infile = infile, outfile = outfile, citycode = citycode)
  
  ##########################################################################
  ########### Criar uma lista com cada uma das tabelas anteriores ##########
  #########################################################################
  
  # Criar lista
  lista = list(pess, dom, emigra, mort)
  
  ## Nomear tabelas da lista
  names(lista) = c('pessoas', 'domicilios', 'emigracao', 'mortalidade')
 
  return(lista)
  
}
