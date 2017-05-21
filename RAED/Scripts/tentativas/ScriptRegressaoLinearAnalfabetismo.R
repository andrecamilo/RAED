x <- taxa$Localidade
y <- taxa$"2015_per"

#grafico de dispersao
plot(x, y)

#modelo de regressao linear
regressao <- lm(y ~ x)
summary(reg)

reta <- function(x)(-5.020e-04) * x + (1.520e+00)

plot.function(reta, from = min(x), to = max(x))
points(x, y)

predicao <- reta(20)

predicao




