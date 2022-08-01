data <- readRDS("spotify.RDS")
str(data)
head(data)

#1)
attach(data)
plot(like, mode, xlab = "like", ylab = "mode")
plot(like, danceability, xlab = "like", ylab = "danceability")

#2)
m1 <- glm(like ~ mode + danceability, family = "binomial")
summary(m1)
### Coefficients des deux equations (il est pratique de 
### les sauvegarder dans des objets pour les utiliser plus tard):
bmin <- c(coef(m1)[1], coef(m1)[3])
bmaj <- c(coef(m1)[1] + coef(m1)[2], coef(m1)[3])

#3)
exp(bmin[1] + bmin[2]*0.35) # = 0.66, donc une cote de 2 contre 3
0.66353*exp(-0.27162)
exp(bmaj[1] + bmaj[2]*0.35) # = 0.51, donc une cote de 2 contre 4

#4)
c35 <- exp(bmin[1] + bmin[2]*0.35) 
c45 <- exp(bmin[1] + bmin[2]*0.45) 
c55 <- exp(bmin[1] + bmin[2]*0.55)
c55/c45
c45/c35
exp(bmin[2]*0.1)
### En effet, on a trouve trois fois la meme reponse.
### on peut faire le meme calcul pour les chansons en majeur.

#5)
bmin[1]/bmin[2]
bmaj[1]/bmaj[2]

#6)
#length peut etre choisi librement: il faut le choisir assez grand pour que l'apparence de la courbe est lisse
dance <- seq(0,1, length = 100) 
predmin <- 1/(1 + exp(-bmin[1] - bmin[2]*dance))
predmaj <- 1/(1 + exp(-bmaj[1] - bmaj[2]*dance))
# Ou alternativement:
predmin <- predict(m1, list('danceability' = dance, mode = rep("mineur", 100)), type = "response")
predmaj <- predict(m1, list('danceability' = dance, mode = rep("majeur", 100)), type = "response")

plot(dance, predmin, type = "l", lwd = 3,  xlab = "danceability", ylab = "probabilité d'aimer une chanson", ylim = c(0,1))
lines(dance, predmaj, col = "blue", lwd = 2)
legend("topleft", c("mineur", "majeur"), lty = rep(1,2), col = c("black", "blue"), lwd = 3, cex = 1.25 )

#7)
data$duration <- data$duration_ms/1000
attach(data)
# l'avertissement est montre car nous avons deja utilise la fonction "attach"

#8)
cor(subset(data, select = -c(like, mode, duration_ms)))

#9)
mtemp <- glm(like ~ mode + duration + danceability + tempo + instrumentalness + loudness, family = "binomial")
summary(mtemp)

m2 <- glm(like ~ mode + duration + danceability + tempo + instrumentalness, family = "binomial")
summary(m2)

#10)
l <- 1000
dura <- seq(min(duration), max(duration), length = l) 
dance <- rep(mean(danceability), l)
temp <- rep(mean(tempo), l)
instru <- rep(mean(instrumentalness),l)
newdatamin <- list(duration = dura, mode = rep("mineur", l), danceability = dance, tempo = temp, instrumentalness = instru)
newdatamaj <- list(duration = dura, mode = rep("majeur", l), danceability = dance, tempo = temp, instrumentalness = instru)
predmin2 <- predict(m2, newdatamin, type = "response")
predmaj2 <- predict(m2, newdatamaj, type = "response")

plot(dura, predmin2, type = "l", lwd = 3,  xlab = "duration", ylab = "probabilité d'aimer une chanson", ylim = c(0,1))
lines(dura, predmaj2, col = "blue", lwd = 2)
legend("topleft", c("mineur", "majeur"), lty = rep(1,2), col = c("black", "blue"), lwd = 3, cex = 1.25 )

#11)
song1 <- list(duration = 340.707, mode = "majeur", danceability = 0.516, tempo = 119.972, instrumentalness = 0)
song2 <- list(duration = 267.024, mode = "majeur", danceability = 0.896, tempo = 134.962, instrumentalness = 0.000258)
predsong1m1 <- predict(m2, song1, type = "response")
predsong1m2 <- predict(m1, list(mode = "majeur", danceability = 0.516), type = "response")
predsong2m1 <- predict(m2, song2, type = "response")
predsong2m2 <- predict(m1, list(mode = "majeur", danceability = 0.896), type = "response")


