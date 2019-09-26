###################################
## Damion Lance
###################################

## imports
library(mdsr)
library(nycflights13)

# 4.4
planesData <- rename(planes, manufactureYear = year)
joinedPlaneData <- inner_join(flights, planesData) %>% select(manufactureYear, tailnum) %>% arrange(desc(tailnum))
joinedPlaneData

# We can see that the oldest plane to fly out of NYC is plane ID 'N999DN'

n_distinct(select(joinedPlaneData, tailnum))

# Here we can see that there are 3322 uniquely ID'd planes that took off from NYC

# 4.5

sum(is.na(select(distinct(joinedPlaneData), manufactureYear)))

# there are 70 planes with NA manufacture year

numManufacturers <- select(planes, manufacturer)
numManufacturers
# INCOMPLETE: couldn't figure out...

# 4.9
library(Lahman)
head(Teams)
TeamsUpdated <- mutate(Teams, BA=H/AB, SLG=(((H-X2B-X3B-HR)+(2*(X2B))+(3*(X3B))+(4*(HR))))/AB)
TeamsUpdated <- filter(TeamsUpdated, yearID>=1954)
slugging <- ggplot(data = TeamsUpdated)
slugging + geom_smooth(aes(x=yearID, y = SLG)) + facet_wrap(~lgID)
# The American League has consistantly better slugging percentage. This is probably
# due to the fact that in the National League, the pitchers (who normally
# aren't batting specialists) have to bat, whereas in the American League, the
# pitchers only pitch