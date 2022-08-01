data <- readRDS("cdc.RDS")
# Pour verifier que tout va bien:
str(data)
head(data)

# 1)
dim(data) 
attach(data)

#2)
data$genhlth
data[,1]

data$genhlth[1:10]
data[1:10,1]

levels(data$genhlth)

#3)
# Voir correctif

#4)
attach(data)
IMC <- weight / (height/100)^2

#5)
hist(IMC)
hist(IMC, breaks = 50)
### Attention, le mot "Frequency" veut dire "Effectifs" en francais,
### et non frequences. L'aire sous l'histogramme est donc egale a 20 000 dans cet exemple. 
### Mieux vaut renommer les axes et le titre:
hist(IMC, breaks = 50, ylab = "Effectifs", main = "Histogramme de l'IMC")

#6)
summary(IMC)
sd(IMC)


#7)
xbar <- mean(IMC)
s <- sd(IMC)
n <- 20000
quant <- qt(1 - 0.001/2, df = n - 1)
ciL <- xbar - (s/sqrt(n))*quant
ciU <- xbar + (s/sqrt(n))*quant
c(ciL, ciU)  

#8)
### Dans le resultat affiche, on ne s'interesse (pour l'instant) qu'au "99.9 % confidence interval"
t.test(IMC, conf.level = 0.999)

#9)
quant <- qt(1 - 0.0001, df = n - 1)
25 + (s/sqrt(n))*quant

#10)
summary(genhlth)
summary(genhlth)/20000

#11)
summary(smoke100)
# si on essaie de faire un histogramme, R indique correctement que la variable n'est pas quantitative:
hist(smoke100)
# pour faire un graphe en barres, on utilise simplement plot():
plot(smoke100)

#12)
table(smoke100, gender)

#13)
plot(smoke100, gender, xlab = "smoke100", ylab = "gender")
plot(genhlth, smoke100, ylab = "smoke100")
plot(genhlth, IMC, xlab = "genhlth", ylab = "weight")
plot(weight, wtdesire, xlim = c(0,200), ylim = c(0,200))

