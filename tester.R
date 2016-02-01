mpg_fit<-
  readRDS("mpg_fit.Rdata")

predict_mpg<-function(disp, wt, hp){
  new_data<-data.frame(disp=as.numeric(disp), 
                       wt=as.numeric(wt),
                       hp=as.numeric(hp))
  predict(mpg_fit, newdata = new_data)
}

library(jug)

jug() %>%
  post("/mpg_api", decorate(predict_mpg)) %>%
  simple_error_handler() %>%
  serve_it()
