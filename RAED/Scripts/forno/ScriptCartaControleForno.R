#Passo 1:Inspeção visual nos dados
#Passo 2:Carregar dados no R
#Passo 3:Plotar o gráfico no tempo
#Passo 4:Plotar o histograma e inspecionar normalidade
#Hist(x)
#teiro(continuação)
#Passo 5:Especificar o tamanho de amostra e montar X_bar
#Passo 6:Calcular os LSC e LIC da carta de X_bar
#Para n = 3, A2 = 1, 023
#Passo 7:Exportar X_bar para o excel e montar o gráfico
#Round(x_bar)
#Write.csv(x_bar, “x_bar.csv”, row.names = “FALSE”)
#Passo 8:Fazer as análises

#library(readxl)
#forno <- read_excel("../Datasets/Forno.xlsx")

View(forno)

producao <- forno$Producao
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

write.csv(x_bar, "xbar.csv", row.names=FALSE)

