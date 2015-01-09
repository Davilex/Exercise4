# AD-Scripting, Astrid Bos & David Scholte-Albers
# 08 January 2014


# Start with empty environment
rm(list=ls())

# Import packages
library(raster)
library(rgdal)

# Check working directory
getwd()

# Call functions
source('R/ndviCalc2014.R')
source('R/ndviCalc1990.R')
source('R/cloudmask.R')
source('R/NDVIchange.R')

# Landsat data
LC8 <- list.files(path="data/2014/", full.names=T, pattern = ".tif")
Stack2014 <- stack(LC8)

LT5 <- list.files(path="data/1990/", full.names=T, pattern = ".tif")
Stack1990 <- stack(LT5)

redLC8 <- Stack2014[[5]]
nirLC8 <- Stack2014[[6]]

redLT5 <- Stack1990[[6]]
nirLT5 <- Stack1990[[7]]

# NDVI
NDVI2014 <- calc(x=Stack2014, fun=ndviCalc2014)
NDVI1990 <- calc(x=Stack1990, fun=ndviCalc1990)

# Cloud Mask
cloudFree2014 <- overlay(x=NDVI2014, y=Stack2014[[1]], fun=cloudmask)
cloudFree1990 <- overlay(x=NDVI1990, y=Stack1990[[1]], fun=cloudmask)

# NDVI Change
plot(NDVIchange(cloudFree1990, cloudFree2014),main="NDVI change 1990 - 2014", 
     xlab="Latitude", ylab="Longitude", col=rainbow(20, start =0.0, end=0.3))