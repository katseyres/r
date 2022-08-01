data <- readRDS("schools.RDS")
# Pour verifier que tout va bien:
str(data)
head(data)

# 1)
data$scores <- (data$read + data$math)/2  
data$studprof <- data$students/data$teachers 
head(data)

# 2)
attach(data)
m1 <- lm(scores ~ studprof)
summary(m1)

#3)
beta1 <- -2.2798
n <- 420
sd <- 0.4798
confintL <- beta1 - qt(0.975, df = n - 2)*sd
confintU <- beta1 + qt(0.975, df = n - 2)*sd
c(confintL,confintU)

# Plus court (la premiere ligne donne l'intervalle de confiance pour beta0 et la deuxieme ligne pour beta1)
confint(m1)
confint(m1, level = 0.9999)

#4)
beta1 <- -2.2798
n <- 420
sd <- 0.4798
pval <- 2*pt(beta1/sd, n -2) 
pval
#donne la meme chose que "Pr(>|t|)" dans summary(m1):
summary(m1)
#niveau de confiance maximal:
100*(1 - pval) 

#5)
0.5*pval
#niveau de confiance maximal:
100*(1 - 0.5*pval) 

#6)
r <- cor(studprof, scores)
r^2

ybar <- mean(scores)
SST <- sum((scores - ybar)^2)
SSE <- sum((fitted(m1) - ybar)^2)
SSR <- sum((scores - fitted(m1))^2)

### meme reponse que r^2:
SSE/SST
1 - SSR/SST

### on peut aussi simplement regarder le resume:
summary(m1)

#7)
plot(studprof, scores, xlab = "rapport entre élèves et professeurs", ylab = "performances moyennes", xlim = c(10,30), ylim = c(600, 720))
abline(m1)

#8)
m2 <-  lm(scores ~ income)
summary(m2)

#9)
m3 <-  lm(scores ~ lunch)
summary(m3)

m4 <-  lm(scores ~ expenditure)
summary(m4)

#10)
# On continue avec le modele m3
plot(lunch, scores, xlab = "pourcentage d'élèves qui ont droit aux repas à prix réduits", ylab = "performances moyennes", ylim = c(600,720))
abline(m3, lwd = 2)

# Pour l'utilisation de la fonction subset, voir l'enonce du TP3
meanincome <- mean(income)
data1 <- subset(data, income <= meanincome)
data2 <- subset(data, income > meanincome)
# attention, dans les lignes ci-dessous, on doit acceder au donnes avec le symbole $ 
# on evite de taper attach(data1) et attach(data2) car ils ont les memes noms de variables!

# pour l'utilisation de "legend" et pour les graphiques en general, voir l'enonce du TP1
points(data1$lunch, data1$scores, col = "red")
points(data2$lunch, data2$scores, col = "blue")
legend("topright", pch = c(1,1), c("revenu inférieur à la moyenne", "revenu supérieur à la moyenne"), col = c("red", "blue"))

lowincome <- lm(data1$scores ~ data1$lunch)
highincome <- lm(data2$scores ~ data2$lunch)
abline(lowincome, col = "red", lwd = 2)
abline(highincome, col = "blue", lwd = 2)


