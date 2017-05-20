locacao

x <- locacao$cnt
y <- locacao$weathersit

#grafico de dispersao
plot(x, y)

#modelo de regressao linear
reg <- lm(y ~ x)
summary(reg)

reta <- function(x)(-0.069746) * x + (0.540734)

plot.function(reta, from = min(x), to = max(x))
points(x, y)

predicao <- reta(20)

predicao




