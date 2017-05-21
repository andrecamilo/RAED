#exemplo 1
mu <- 50
stddev <- 1
N <- 10000
pop <- rnorm(N, mean = mu, sd = stddev)
plot(density(pop), main = "Population Density", xlab = "X", ylab = "")


#exemplo 2
n <- 30
samp.means <- rnorm(N, mean = mu, sd = stddev / sqrt(n))
lines(density(samp.means))

#Exemplo 3
mu <- 50
stddev <- 1
N <- 10000
pop <- rnorm(N, mean = mu, sd = stddev)

n <- 30
samp.means <- rnorm(N, mean = mu, sd = stddev / sqrt(n))
max.samp.means <- max(density(samp.means)$y)

plot(density(pop), main = "Population Density",
    ylim = c(0, max.samp.means),
    xlab = "X", ylab = "")
lines(density(samp.means))



#Outros exemplos
A <- c(1, 2, 3, 4, 5)
B <- c(6,7,8,9,10)

# media dos elementos de A
mean(A)

#desvio padrão
sd(A)

#minimos e maximos
min(A)
max(B)

clima

plot(A, B)

? plot


#box splot
x = c(5, 5, 5, 13, 7, 11, 11, 9, 8, 9)
y = c(11, 8, 4, 5, 9, 5, 10, 5, 4, 10)
boxplot(x, y) #para plotar no mesmo gráfico (comparação)
boxplot(x);
boxplot(y) #para plotar em gráficos diferentes



# grafico de pizza 
a <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12)
names(a) <- c("a", "b", "c", "d", "e", "f")
pie(a, col = c("red", "blue", "green", "gray", "brown", "black"))



#quartis
z <- c(5, 2, 6, 9, 10, 13, 15)
summary(z)q <- c(48, 49,  45, 47, 49, 51, 56, 57, 50, 49)
quantile(q)