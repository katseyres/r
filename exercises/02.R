getwd()
data<-readRDS("../src/TP2-20220801/cdc.rds")

# 1
dim(data) # lignes x colonnes

# 2
head(data$genhlth, 10)
head(data["genhlth"], 10)
summary(data$genhlth)

# 3
summary(data$genhlth)   # qualitative
summary(data$exerany)   # qualitative
summary(data$hlthplan)  # qualitative
summary(data$smoke100)  # qualitative
summary(data$height)    # quantitative
summary(data$weight)    # quantitative
summary(data$wtdesire)  # quantitative
summary(data$age)       # quantitative
summary(data$gender)    # qualitative

# 4
IMC<- data$weight / (data$height / 100)**2

# 5
hist(IMC)
hist(IMC, breaks=50) # plus précis

# 6
mean(IMC)
sd(IMC)
# ...

# 7











