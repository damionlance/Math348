##############################
# Damion Lance
# Exercise 3.5
##############################

library(mosaic)
head(Marriage, 2)
NewMarriage <- Marriage %>% filter(race == "White" | race == "Black")

# part 1

g <-ggplot(data = NewMarriage, aes(x = age))
g + geom_histogram(bins = 10, color = "black", aes(fill = race)) + facet_wrap(race~person)

# part 2
#
# I am using color, and facets as visual cues to distinguish race and 
# bride/groom.

# part 3

plot3 <- ggplot(data = Marriage, aes(x = age))
plot3 + geom_histogram(bins = 5, color = "black", aes(fill = race)) + facet_wrap(prevconc~person) + geom_point(aes(y = prevcount, color = sign, size = delay)) + geom_smooth(aes(y = hs))