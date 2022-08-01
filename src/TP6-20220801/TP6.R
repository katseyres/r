data <- readRDS("schools.RDS")
# Pour verifier que tout va bien:
str(data)
head(data)

data$scores <- (data$read + data$math)/2  

# 1) 
attach(data)
m1 <- lm(scores ~ income)
summary(m1)

plot(income, scores, xlim = c(0,60), ylim = c(600,720))
abline(m1)

# 2) 
m2 <- lm(scores ~ sqrt(income))
summary(m2)
m3 <- lm(scores ~ log(income))
summary(m3)

# on definit une sequence de valeur pour 'income' de longueur 100 pour faire des predictions
income_values <- seq(min(income), max(income), length = 100)
pred1 <- predict(m1, list('income' = income_values))
pred2 <- predict(m2, list('income' = income_values))
pred3 <- predict(m3, list('income' = income_values))
plot(income, scores, xlim = c(0,60), ylim = c(600,720))
lines(income_values, pred1, lwd = 2)
lines(income_values, pred2, lwd = 2, col = "blue")
lines(income_values, pred3, lwd = 2, col = "red")
legend("topleft", lty = c(1,1), lwd = 2, c("linéaire", "racine carré", "logarithme"), col = c("black", "blue", "red"))

# on continue avec le modele m3

#3)

predict(m3, list('income' = 11)) - predict(m3, list('income' = 10))
predict(m3, list('income' = 21)) - predict(m3, list('income' = 20))
predict(m3, list('income' = 22)) - predict(m3, list('income' = 20))


#4)
plot(fitted(m3), resid(m3), xlab = "valeurs ajustées", ylab = "résidus", ylim = c(-45,45))
abline(h = 0)

qqnorm(resid(m3))
qqline(resid(m3))

#########################################################################################
#########################################################################################
#########################################################################################
data <- readRDS("hawks.RDS")
str(data)
head(data)

#1)
attach(data)
m1 <- lm(Wing ~ Feather)
summary(m1)

#2)
plot(Feather, Wing, xlim = c(0,500), ylim = c(50,350))
abline(m1)

#3)
dataRT <- subset(data, Species == "RT")
dataSS <- subset(data, Species == "SS")
dataCH <- subset(data, Species == "CH")
plot(dataRT$Feather, dataRT$Wing, xlim = c(0,500), ylim = c(50,350), xlab = "Feather", ylab = "Wing")
points(dataSS$Feather, dataSS$Wing, col = "blue", pch = 5)
points(dataCH$Feather, dataCH$Wing, col = "red", pch = 2)
legend("topleft", pch = c(1,2,5), c("RT", "SS", "CH"), col = c("black", "blue", "red"))

#4)
m2 <- lm(Wing ~ Feather + Species)
summary(m2)

# on definit une sequence de valeurs differente pour chaque variete
feather_valuesRT <- seq(min(dataRT$Feather), max(dataRT$Feather), length = 100)
feather_valuesSS <- seq(min(dataSS$Feather), max(dataSS$Feather), length = 100)
feather_valuesCH <- seq(min(dataCH$Feather), max(dataCH$Feather), length = 100)
predRT <- predict(m2, list('Feather' = feather_valuesRT, 'Species' = rep("RT", 100)))
predSS <- predict(m2, list('Feather' = feather_valuesSS, 'Species' = rep("SS", 100)))
predCH <- predict(m2, list('Feather' = feather_valuesCH, 'Species' = rep("CH", 100)))

# faire d'abord le meme graphe qu'a la question precedente: 
plot(dataRT$Feather, dataRT$Wing, xlim = c(0,500), ylim = c(50,350), xlab = "Feather", ylab = "Wing")
points(dataSS$Feather, dataSS$Wing, col = "blue", pch = 5)
points(dataCH$Feather, dataCH$Wing, col = "red", pch = 2)
legend("topleft", pch = c(1,2,5), c("RT", "SS", "CH"), col = c("black", "blue", "red"))

# puis ajouter les droites estimees:
lines(feather_valuesRT, predRT, lwd = 2)
lines(feather_valuesSS, predSS, lwd = 2, col = "blue")
lines(feather_valuesCH, predCH, lwd = 2, col = "red")

