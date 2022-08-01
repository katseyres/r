data <- readRDS("salaires.RDS")
str(data)
head(data)
attach(data)

#1) 
mean(salary)
dataf <- subset(data, sex == "female")
mean(dataf$salary)

summary(rank)
100*(64/397)

#2)
### Faire graphe ou calculer les proportions
plot(sex,discipline, xlab = "sexe", ylab = "département") #A = theorique, B = applique

table(sex, discipline)
# proportion des hommes dans A (theorique):
163/(163+18)
# proportion des hommes dans B (appliquee):
195/(195+21)


#3)
m1 <- lm(salary ~ yrs.since.phd)
summary(m1)

#4)
predict(m1, list(yrs.since.phd = 10))

#5)
plot(fitted(m1), resid(m1), xlab = "valeurs ajustées", ylab = "résidus")

#6)
m2 <- lm(salary ~ yrs.since.phd + sex)
plot(yrs.since.phd, salary, xlab = "Années depuis l'obtention du doctorat", 
       ylab = "salaire (milliers de dollars par an)", xlim = c(0,60), ylim = c(0,250))

yrslist <- seq(min(yrs.since.phd), max(yrs.since.phd), length = 100)
predf <- predict(m2, list('yrs.since.phd' = yrslist, 'sex' = rep("female", 100)))
predh <- predict(m2, list('yrs.since.phd' = yrslist, 'sex' = rep("male", 100)))

lines(yrslist, predf, lwd = 2, col = "red")
lines(yrslist, predh, lwd = 2, col = "blue")
legend("topleft", c("female", "male"), col = c("red", "blue"), lty = c(1,1), lwd = 2)


#7) 
summary(m2)

#8)
confint(m2, level = 0.99)

#9)
summary(m2)
0.0915/2
100*(1 - 0.0915/2)


#10) 
m3 <- lm(salary ~ rank + discipline + yrs.since.phd + sex)
predict(m3, list(yrs.since.phd = 10, rank = "associate", discipline = "B", sex = "female"))

#11) 
summary(m3)
0.26242/2

plot(rank, yrs.since.phd)
plot(rank, sex)

#12) 

#13)
m4 <- glm(sex ~ salary, family = "binomial")
summary(m4)
exp(0.018463)

m5 <- glm(sex ~ salary + rank, family = "binomial")
summary(m5)

