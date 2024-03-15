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

View(Titanic)

install.packages("tidyverse")
remove.packages("rlang")
install.packages("rlang")
library(tidyverse)

install.packages("starwarsdb")
library(starwarsdb)

library(Titanic)

data(package = "starwarsdb")

Titanic %>% select(Survived) %>% View()

install.packages("Lahman")
library(Lahman)
library(dplyr)
library(ggplot2)
library(caret)

head(teams)

teams <- Teams

moreonteams <- teams %>% 
  mutate(runspergame = R/W+L)


