fonte <- read.csv(file = "C:/Users/andrecamilo/Documents/Visual Studio 2017/Projects/R/RAED/RAED/Datasets/clima_historia_curitiba.csv", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ";", dec = ".", quote = "/", comment.char = "")

Temperatura <- fonte$Temperature
VelocidadeVento <- fonte$Windspeed
plot(VelocidadeVento, Temperatura)

regressao <- lm(Temperatura~VelocidadeVento)
summary(regressao)

#Coefficients:
            #Estimate Std. Error t value Pr( > | t | )
#(Intercept) 14.00800 0.33130 42.282 < 2e-16 ** *
#VelocidadeVento 0.09494 0.01908 4.976 1.45e-06 ** *

# comando: a * x + b
retaRegressao <- function(x)(0.09494) * x + 14.00800
plot.function(retaRegressao, from = min(VelocidadeVento), to = max(VelocidadeVento))
points(VelocidadeVento, Temperatura)

predicao <- retaRegressao(4000)
predicao
predicao <- retaRegressao(200)
predicao