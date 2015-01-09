# Calculates the change in NDVI
NDVIchange <- function(x,y) {
  box <- intersect(extent(x),extent(y))
  clippedx <- crop(x,box)
  clippedy <- crop(y,box)
  change <- clippedy - clippedx
  return(change)
}