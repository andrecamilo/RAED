dep <- forno$Energia
indep <- forno$Producao

plot(indep, dep)

regressao <- lm(dep~indep)
summary(regressao)

#Residuals:
    #Min 1 Q Median 3 Q Max
#- 130436 - 35025 - 8012 36093 151416
#Coefficients:
             #Estimate Std. Error t value Pr( > | t | )
#(Intercept) 2.316e+05 1.617e+04 14.32 < 2e-16 ** * (>>> coenficiente B)
#indep       3.286e+02 7.778e+00 42.25 < 2e-16 ** * (>>> coenficiente A)
#---
#Signif. codes:0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#Residual standard error:53470 on 117 degrees of freedom
#Multiple R - squared:0.9385, Adjusted R - squared:0.938 (>>> coeficoente de determinação R2)
#F - statistic:1785 on 1 and 117 DF, p - value: < 2.2e-16

# comando: a * x + b
retaRegressao <- function(x) 3.286e+02 * x + 2.316e+05
plot.function(retaRegressao, from = min(indep), to = max(indep))
points(indep, dep)
