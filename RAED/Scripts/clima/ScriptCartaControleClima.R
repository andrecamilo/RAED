fonte <- read.csv(file = "C:/Users/andrecamilo/Documents/Visual Studio 2017/Projects/R/RAED/RAED/Datasets/clima_historia_curitiba.csv", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ";", dec = ".", quote = "/", comment.char = "")

#View(fonte)

producao <- fonte$Temperature
plot(producao)
hist(producao)

i <- 1
j <- 1
x_bar <- 0
R <- 0
limit <- length(producao) / 3
for (z in 1:limit) {
    aux <- c(producao[1], producao[i - 1], producao[i + 2])
    x_bar[j] <- mean(aux)
    R[j] <- max(aux) - min(aux)
    j <- j + 1
    i <- i + 3
}


#limite superior de controle
LSC <- mean(x_bar) + 1.023 * mean(R)

#limite inferior de controle 
LIC <- mean(x_bar) - 1.023 * mean(R)

#linha central
LC <- mean(x_bar)

x_bar <- round(x_bar)

write.csv(x_bar, "xbar_clima.csv", row.names=FALSE)

