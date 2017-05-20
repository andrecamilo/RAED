library(reshape2)
library(ggplot2)
library(plyr)

#primeiro passo, vamos abrir o txt criado no notepad++ utilizando o caracter ">" como separador
#para eliminar algum dos caracteres do html
passo1 <- read.table("ilha 2014.txt", header=F, sep = ">")
head(passo1)

#V1   V2  V3                             V4   V5                     V6                         V7
#1 </td </tr <tr <td class=line-number value=22 </td <td class=line-content  var dt  = 1388530800000; 
#2 </td </tr <tr <td class=line-number value=23 </td <td class=line-content            var vlr = 30.2;
#3 </td </tr <tr <td class=line-number value=24 </td <td class=line-content dados_temp.push([dt,vlr]);
#4 </td </tr <tr <td class=line-number value=25 </td <td class=line-content  var dt  = 1388530800000; 
#5 </td </tr <tr <td class=line-number value=26 </td <td class=line-content              var vlr = 70;
#6 </td </tr <tr <td class=line-number value=27 </td <td class=line-content  dados_umi.push([dt,vlr]);

#teremos então uma planilha com 7 variaveis, sendo apenas a ultima importante pra nos
#agora vamos criar um oitava variavel (fator) discriminando o que á cada uma dessas linhas
# sendo, "var dt" a data em milisegundos apartir de 1970, "var vlr" o valor do parametro (indicado na linha subsequente)

passo1$fat<-factor(rep(c("data","valor","parametro"),(length(passo1)-1)/3)) #criando fatores
passo2<-passo1[7:8] #eliminando as colunas inuteis

#devido a presença de alguns caracteres foi necessario separar cada uma das variaveis

dia<- subset(passo2, fat=="data") #separando cada uma das variaveis
valor<- subset(passo2, fat=="valor") #separando cada uma das variaveis
parametro<- subset(passo2, fat=="parametro") #separando cada uma das variaveis

#retirando os caracteres inuteis

dia$V7 <- gsub("var dt  = ", "", dia$V7) #retirando "var dt"
dia$V7 <- gsub(";", "", dia$V7) #retirando ";"
valor$V7 <- gsub("var vlr = ", "", valor$V7) #retirando "var vlr"
valor$V7 <- gsub(";", "", valor$V7) #retirando ";"

param<-as.factor(parametro$V7) #transformando a coluna em fator
value<-as.numeric(valor$V7) #tranformando a coluna em numero
datadia <- as.POSIXct((as.numeric(dia$V7)+0.1)/1000, origin="1970-01-01", tz="America/Sao_Paulo") #transformando a data de milisegundos para uma data

im2014 <- data.frame(diahora=datadia,parametro=param,valor=value) #juntando tudo!


#agora vamos testar!
ggplot(im2014, aes(x=diahora, y=valor, group=parametro)) + geom_line() + facet_wrap(~parametro, ncol = 1, scales = 'free_y') +  theme_bw()


write.table(im2014,"im2014.csv",dec=",", sep=";") #salvando sua tabela


#reorganizando a tabela
im14re<-reshape(im2014, v.names = "valor", idvar = "diahora",timevar = "parametro", direction = "wide")

#renomeando as variaveis
names(im14re)[2] <- "temp"
names(im14re)[3] <- "umi"
names(im14re)[4] <- "po"
names(im14re)[5] <- "pres"
names(im14re)[6] <- "rad"
names(im14re)[7] <- "pre"
names(im14re)[8] <- "vdd"
names(im14re)[9] <- "vvel"

im14re$ano <- with(im14re, 1900 + as.POSIXlt(im14re$diahora)$year) #adicionando uma coluna com o ano
im14re$mes <- with(im14re, factor(as.POSIXlt(im14re$diahora)$mon, label=month.abb)) #adicionando uma coluna com o mes

#mais testes
ggplot(im14re, aes(x=diahora, y=temp)) +  geom_line() +  theme_bw()

ggplot(im14re, aes(factor(mes), temp)) + geom_jitter(alpha=.4) + geom_boxplot(aes(fill = factor(mes))) 

ggplot(im14re, aes(x=temp)) + geom_histogram(binwidth = 0.5, aes(y = ..density..), alpha=0.5) +
  geom_density(colour="red") + facet_wrap(~mes, ncol = 1, scales = 'free_y')

#salvando a nova tabela
write.table(im14re,"im2014re.csv",dec=",", sep=";")

#"O grande segredo para a plenitude é muito simples: compartilhar."-Sócrates