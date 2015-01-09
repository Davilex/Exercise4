#NDVI Calculator for 1990
ndviCalc1990 <- function(x) {
  ndvi <- (x[[7]] - x[[6]]) / (x[[7]] + x[[6]])
  return(ndvi)
}