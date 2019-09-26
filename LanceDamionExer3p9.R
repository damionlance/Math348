library(mdsr)
library(nasaweather)
head(storms)

storm <- ggplot(data = storms) + geom_point(aes(x = wind, y = pressure, color = type))
storm
