## Operaciones

a <- 5
b <- 6

a + b

sum(a, b)

ages <- c(31, 22)
ages

names <- c("Jim", "Pam")

friends <- data.frame(names, ages)
friends

str(friends)
View(friends)

friends$names
friends$ages

friends[1,1]
friends[1,]
friends[,1]

# Datasets ya cargados en el entorno
data()
