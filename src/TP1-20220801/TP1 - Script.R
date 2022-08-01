data <- readRDS("boysgirls.RDS")

# 1)
head(data)
tail(data)
str(data)

#2)
data[10,3] # = 4952 
#En 1638, 4952 filles etaient baptisees a Londres

#3)
data$boys

#4)
attach(data) #Attention, lorsque vous allez creer une nouvelle variable (ex: data$total), celle-ci ne sera pas consideree comme "attached"
              # Il faudra donc run a nouveau la commande attach(NomDeLaBaseDeDonnees)
boys

#5)
plot(year, girls) # ou :
plot(data$year, data$girls)

plot(year, girls, type = "l")
plot(data$year, data$girls, type = "l", xlab = "Annee", ylab = "Filles", main = "Nombre de baptemes de filles")

#6)
total <- boys + girls
data$total <- total
# Pour verifier:
head(data)

#7)
prop <- boys/total
plot(year,prop)
plot(data$year,prop, ylim = c(0,1))
# proportion tres constante, et toujours superieure a 0.5.

#8)
year[prop > 0.52]
length(year[prop > 0.52])
#23 annees

#9)
mean(boys)
median(boys)
var(boys)

mean(girls)
median(girls)
var(girls)

boxplot(boys) #En moyenne, 5907 garçons sont baptises chaque annee. 
#Le milieu de la distribution des garçons baptises se trouve a 6073. C'est-a-dire qu'il y autant d'annees durant lesquelles 
# nous avons constate plus de 6073 garçons baptises que d'annees durant lesquelles nous avons constate moins de 6073 garçons baptises.
#La valeur minimale de garçons baptises se trouve autour de 3000 alors que le maximum se situe autour de 8500 (a verifier avec commandes min() et max()).
#Le premier quantile est situe aux alentours de 4700 garçons baptises alors que le troisième quantile est situe autour de 7600 garçons baptises. (voir avec fonction quantile())
boxplot(girls) 
