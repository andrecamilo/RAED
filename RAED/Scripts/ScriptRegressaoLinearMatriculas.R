#MatrculasnaEducaodeJovenseAdultosnaRedePblica
#http://www.observatoriodopne.org.br/downloads/9
#Observatório do Plano Nacional de Educação

#matriculas <- read.csv(file = "C:/Users/andrecamilo/Documents/Visual Studio 2017/Projects/R/RAED/RAED/Datasets/matriculas.csv", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ";", dec = ".", quote = "/", comment.char = "")

View(matrculas)

dep <- matrculas$X2012
indep <- matrculas$X2013

plot(indep, dep)

regressao <- lm(dep~indep)
summary(regressao)

# comando: a * x + b
retaRegressao <- function(x) 3.286e+02 * x + 2.316e+05
plot.function(retaRegressao, from = min(indep), to = max(indep))
points(indep, dep)

predicao <- retaRegressao(4000)
predicao
predicao <- retaRegressao(200)
predicao