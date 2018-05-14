# glmnet vignette
# https://web.stanford.edu/~hastie/glmnet/glmnet_alpha.html
#
# this code adapted from
# https://drsimonj.svbtle.com/ridge-regression-with-glmnet
set.seed(123)
library(tidyverse)
library(glmnet)

y <- mtcars$hp
x <- mtcars %>% select(mpg, wt, drat) %>% data.matrix()
lambdas <- 10^seq(3, -2, by = -.1)

# ridge regression
fit <- glmnet(x, y, alpha = 0, lambda = lambdas)
summary(fit)

cv_fit <- cv.glmnet(x, y, alpha = 0, lambda = lambdas)
plot(cv_fit)

opt_lambda <- cv_fit$lambda.min
opt_lambda

# lasso regression
fit <- glmnet(x, y, alpha = 1, lambda = lambdas)
cv_fit <- cv.glmnet(x, y, alpha = 1, lambda = lambdas)
