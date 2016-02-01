library(randomForest)

mpg_fit<-
  randomForest(mpg~disp+wt+hp, mtcars)

saveRDS(mpg_fit, "mpg_fit.Rdata")