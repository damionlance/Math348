## 4.1
# 1: Summarize
# 2: Mutate
# 3: Arrange
# 4: Filter
# 5: Select

## 4.2

library(mdsr)
library(nycflights13)
head(flights)
cancelled <- mutate(flights, cancelled=ifelse(is.na(dep_time), 1, 0)) %>% group_by(month) %>% summarise(proportion=sum(cancelled)/n())
Exer4p2 <- ggplot(data = cancelled, aes(x = factor(month)))
Exer4p2 + geom_point(aes(y = proportion))

## 4.3

dataExer4p3 <- mutate(flights, weekNum=day%%52)
group_by(flights, tailnum) %>% summarise(N=n()) %>% arrange(desc(N))

# most used: N725MQ
dataExer4p3 <- filter(flights, tailnum=="N725MQ") %>% summarise(N=n())

## Not sure about how to make this work... piping into summarise only returns one number

Exer4p3 <- ggplot(data=dataExer4p3, aes(x=weekNum, y = N))
Exer4p3 + geom_point()
