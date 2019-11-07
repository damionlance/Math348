################
## Damion Lance
## Exam 2 Notes
## 11/7/2019
################

library(mdsr)
library(nycflights13)

# CHAPTER 7:
#   Statistical foundations

# sample_n: samples n entries from data set
##  size: number of samples to take

flight_sample <- flights %>% filter(dest == "SFO", !is.na(arr_delay)) %>% sample_n(size = 25)
flight_sample

# favstats: Returns some helpful stats on a sample
##  ~ x: parameter to take stats by
##  data: dataframe to analyze

favstats( ~ arr_delay, data = flight_sample)

# qdata: Used for finding quantiles
##  p: probability

# when will you be late only 2% of the time (on time 98%)
qdata( ~ arr_delay, p = .98, data = flight_sample)

# tally: tabulate catagorical data
##  ~ x: what tou're counting by
##  data: data frame to analyze
##  format: "proportion", "count", "percent" etc

# if 194 minuets early will work 98% of the time
tally(~ arr_delay < 194, data = flight_sample, format = "proportion")

##
##  Bootstrap
##

# Sample from sample a lot of times, with do() command
bootstrap <- do(500) * mean( ~ arr_delay, data = sample_n(flight_sample, size = 25, replace=TRUE))
favstats( ~ mean, data = bootstrap)

#########

# Linear regression model:
# lm: linear regressions function
##  x ~ y1 + y2 + y3...: variable by multiple variables (or singular)
##  data: dataframe to use
model_linear <- lm(arr_delay ~ hour, data = flight_sample

# msummary: model summary
##  model: some model to analye
msummary(model_linear)

## Chapter 8 
##    Supervised Learning

# split the data
## n <- nrow(data)
## test_idx <- sample_int(n, size = round(.2 * n))
## train <- data[-test_idx, ]
## test <- data[test_idx, ]

# use predict(model, newdata) to predict

# rpart: a single decision tree
##  x ~ y1 + y2 + ...: same as other models
## data:  `````

# plotting decision trees with partykit
# library(partykit)
# plot(as.party(decision_tree))

# Confusion Matrix: Used to find accuracy of model
# tally(guess ~ real, data = TRAINING, format = "count")

# Random Forests: bunch of decision trees, aggregated by majority rule.
##    Similar to bootstrap
##  library(randomforest)
##  forest <- randomForest(x ~ y, data, ntree, mtry)
###   ntree: number of trees just use 201
###   mtry:  3
## Confusion Matrix for forest:
### sum(diag(forest$confusion)) / nrow(train)

# k-nearest neighbors...
#   Coding is similar to tree

# naive Bayes
# library(e1071)
# nbModel <- naiveBayes(x~y, data)
# predicted_nb <- predict(nbModel, data)
# get confusion matrix and divide by total

# neural nets
# library(nnet)
# nnet(x~y, data, size) (use 5 for size)

# null model
# mod_null <- glm(var ~ 1, data, family = binomial)

# ROC curves
#

######## ANOVA AND CHI_SQUARE
## 1
ANOVA <- aov(Sepal.Length ~ Species, data=iris)
summary(ANOVA)

# We can see here that our p-value is extremely low (2*10^-16), this means that we have a very low chance to reject our null hypothesis

boxplot(Sepal.Length ~ Species, data=iris)
TukeyHSD(ANOVA)

# Using this post hoc test we can see that there are differences in the iris length

## 2
die <- c(66, 63, 61, 35, 49, 26)
dieResults <- chisq.test(die)
dieResults
dieResults$residuals
# We can see that our p-value is smaller than our .05 cutoff, and thus seems reasonable


# DICTIONARY OF COMMON TERMS:
#   sample: a set of observations dran from the population
#   quantile: Quantiles are divisions of the probability distrobution in intervals with equal probabilities
#       second quantile is the median
#   confidence interval: (2*standard deviation) +/- mean is the confidence interval of 95%, equivalent to 5%
#       p-value
#   p-value: allows you to reject the null if the p-value is sufficiently small
#   Null hypothesis: random chance i.e. no effect
#   R-squared: 0-100%, 0 means no corrolation, 100 means variables explain all of variation
#       larger the R2 the more accurate the model
#   Confounding variable: variable that is misleading
