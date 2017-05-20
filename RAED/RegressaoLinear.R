clima

Dep <- clima$DryBulbCelsius
Indep <- clima$RelativeHumidity#grafico de dispersaoplot(Indep, Dep)#regressao linear modelReg <- lm(Dep~Indep)summary(Reg)reta <- function(x)(0.21539) * x + (17.96862)plot.function(reta, from = min(Indep), to = max(Indep))points(Indep, Dep)predicao <- reta(20)predicao