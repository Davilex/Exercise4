# Create a cloud mask
cloudmask <- function(x,y){
  x[y != 0] <- NA
  return(x)
}