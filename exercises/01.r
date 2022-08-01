getwd()
data <- readRDS("../src/TP1-20220801/boysgirls.RDS")

# 1
head(data)
tail(data)
str(data)

# 2
data[10,3]

# 3
data$boys

# 4
attach(data)
data$boys

# 5
plot(data$year, data$girls, type="l", ylab="filles baptisées", xlab="années", main="Nombres de filles baptistées par année")

# 6
total <- data$boys + data$girls
data$total<-total
total

# 7
data$boysP<- data$boys / data$total
data$boysP
plot(data$year, data$boysP, ylim=c(0, 1), ylab="% de garçons baptisés", xlab="années", main="Pourcentage de garçons baptisés par année", type="l")

# 8
length(data$year[data$boysP > 0.52])

# 9
boyData <- c(median(data$boys), mean(data$boys), var(data$boys))
girlData <- c(median(data$girls), mean(data$girls), var(data$girls))
X <- data.frame(boyData, girlData)
rownames(X)<-c("median", "mean", "variance")
boxplot(boyData, girlData)






