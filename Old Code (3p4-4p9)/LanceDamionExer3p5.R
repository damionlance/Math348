library(mdsr)
head(MLB_teams, 4)
g <- ggplot(data = MLB_teams, aes(x = W, y = payroll))
g + geom_point(aes(color = teamID, shape = lgID, size = attendance)) + facet_wrap(~yearID) + geom_smooth(aes(y = attendance*100)) + geom_histogram(stat = "identity", aes(y = metroPop*10))