data <- readRDS("grades.RDS")
# Pour verifier que tout va bien:
str(data)
head(data)

# 1)
table(data$gender)/76
plot(data$gender, data$iq)

dataF <- subset(data, gender == "female")
mean(dataF$iq)

dataH <- subset(data, gender == "male")
mean(dataH$iq)

#2)

### On peut simplement utiliser la fonction t.test:
t.test(dataF$grade_average, conf.level = 0.99)
t.test(dataH$grade_average, conf.level = 0.99)

### Par calcul direct, c'est un peu plus de travail:
nF <- 31 # 31 femmes
xbarF <- mean(dataF$grade_average)
sF <- sd(dataF$grade_average)
quantF <- qt(1 - 0.01/2, df = nF - 1)
ciLF <- xbarF - (sF/sqrt(nF))*quantF
ciUF <- xbarF + (sF/sqrt(nF))*quantF
c(ciLF, ciUF)  

nH <- 45 # 45 hommes
xbarH <- mean(dataH$grade_average)
sH <- sd(dataH$grade_average)
quantH <- qt(1 - 0.01/2, df = nH - 1)
ciLH <- xbarH - (sH/sqrt(nH))*quantH
ciUH <- xbarH + (sH/sqrt(nH))*quantH
c(ciLH, ciUH) 


#3)
nF <- 31 # 31 femmes
quant <- qt(1 - 0.05/2, df = nF - 1)
lower <- 110 - (sd(dataF$iq)/sqrt(nF))*quant
upper <- 110 + (sd(dataF$iq)/sqrt(nF))*quant
c(lower,upper)

#4)
a <- (lower - 105)/(sd(dataF$iq)/sqrt(nF))
b <- (upper - 105)/(sd(dataF$iq)/sqrt(nF))
pt(b, df = nF-1) - pt(a, df = nF - 1)

#5)
tstat <- (mean(dataF$iq) - 110)/(sd(dataF$iq)/sqrt(nF))
2*pt(tstat, df = nF - 1)
# Verification avec t.test:
t.test(dataF$iq, mu = 110)
# niveau de confiance:
100*(1 - 0.115)

#6)
pt(tstat, df = nF - 1)
# Verification avec t.test:
t.test(dataF$iq, mu = 110, alternative = "less")
# niveau de confiance:
100*(1 - 0.05748)

#7)
attach(data)
plot(iq, grade_average, ylim = c(0,20), xlab = "QI", ylab = "Notes moyennes")

#8)
abline(h = mean(grade_average))
abline(v = mean(iq))
cor(iq, grade_average)

#9)
m1 <- lm(grade_average ~ iq)
## lm est l'abbreviation de 'linear model'

#10)
m1
summary(m1)

#11)
# La fonction predict est tres pratique. Son deuxieme argument doit etre une liste avec le meme nom que la variable explicative
predict(m1, list('iq' = c(100, 105, 108, 113)))

# si non, on peut aussi proceder par calcul direct
beta <- c(-4.75282, 0.15105)
(beta[1] + beta[2]*100)
(beta[1] + beta[2]*105)
(beta[1] + beta[2]*108)
(beta[1] + beta[2]*113)


#12)
beta1 <- cov(iq, grade_average)/var(iq)
beta0 <- mean(grade_average) - beta1*mean(iq)

#13)
plot(iq, grade_average, ylim = c(0,20), xlab = "QI", ylab = "Notes moyennes")
abline(m1)
points(iq, fitted(m1), col = "red")
### fitted(m1) donne les valeurs ajustees; les memes valeurs peuvent etre obtenus avec 
beta0 + beta1*iq

#14)
(beta[1] + beta[2]*74)

iq
# On observe que l'individu 61 a un QI de 74. 
# Alternativement, on peut obtenir l'indice 61 avec
which(iq == 74)
# C'est plus pratique si n est grand! 

# pour calculer le residu, on peut le faire par calcul direct:
grade_average[61] - fitted(m1)[61]
# ou
grade_average[61] - predict(m1, list('iq' = c(74)))
# ou en utilisant
resid(m1)[61]


