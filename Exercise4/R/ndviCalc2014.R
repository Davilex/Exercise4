#NDVI Calculator for 2014

ndviCalc2014 <- function(x) {
  ndvi <- ((x[[6]] - x[[5]]) / (x[[6]] + x[[5]]))
  return(ndvi)
}