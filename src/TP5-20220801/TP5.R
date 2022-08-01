data <- readRDS("schools.RDS")
# Pour verifier que tout va bien:
str(data)
head(data)

# 1)
data$scores <- (data$read + data$math)/2  
data$studprof <- data$students/data$teachers 
data$compstud <- data$computer/data$students

# le "-" devant le vecteur c(school, students, teachers, computer, read, math) indique que l'on ENLEVE ces variables
data <- subset(data, select = -c(school, students, teachers, computer, read, math))
head(data)
# ou alternativement, on ne selectionne que les variables que l'on veut garder:
# data <- subset(data, select = c(county, type, lunch, expenditure, income, scores, studprof, compstud))

# 2)
cor(subset(data, select = -c(county,type)))

#3)
attach(data)
m1 <- lm(scores ~ type + lunch + expenditure + income + studprof + compstud)
summary(m1)

#4)
# p-valeur
0.00802/2
# niveau confiance:
(1 - 0.00802/2)*100

#5)
summary(m1)
# si on enleve studprof: 
summary(lm(scores ~ type + lunch + expenditure + income + compstud)) #le r2 ne diminue presque pas 
# si on enleve expenditure:
summary(lm(scores ~ type + lunch + income + studprof + compstud)) #le r2 ne diminue presque pas
# on enleve studprof et expenditure:
summary(lm(scores ~ type + lunch + income + compstud)) #le r2 ne diminue presque pas 
# on garde le modele avec (type, lunch, income, compstud). Tous ces regresseurs sont significatifs a au moins 5%


#6)
m2 <- lm(scores ~ type + lunch + income + compstud)
summary(m2)

#7)
summary(lm(scores ~ county + type + lunch + income + compstud))

#8)
predict(m2, list('type' = "8year", 'lunch' = 50, 'income' = 10, 'compstud' = 0.2))
predict(m2, list('type' = "8year", 'lunch' = 80, 'income' = 40, 'compstud' = 0.3))

#### Alternativement:
666.85682 - 2.61069*1 -0.49575*50 + 0.54038*10 + 25.13997*0.2
666.85682 - 2.61069*1 -0.49575*80 + 0.54038*40 + 25.13997*0.3

data2 <- subset(data, type == "8year")
plot(data2$lunch, data2$income)
plot(data2$lunch, data2$compstud)
plot(data2$income, data2$compstud)

