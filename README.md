# R package: tsfeaturex

[![DOI](https://zenodo.org/badge/170967121.svg)](https://zenodo.org/badge/latestdoi/170967121)

## Description
Calculate many features (over 50) of a time series.

## Special Thanks
- Inspiration for automatic feature extraction: https://github.com/blue-yonder/tsfresh
- Dr. Nilam Ram for code on probability of acute change
- Github user 'stas-g' for peak-finding code: https://github.com/stas-g/findPeaks

## Acknowledgements

Development supported by National Institute on Aging Grant T32 AG049676 to The Pennsylvania State University. 

## Roadmap

- More features (Fast Fourier Transform (FFT), Time-Series Components (Seasonality, trend, random), Friedrich coefficients (Q1 2019)
- Extracting numerical features from text data (Q2 2019)
- Extracting numerical features from image data (Q4 2019)

# Installation:

```
devtools::install_github("nelsonroque/tsfeaturex")
```

# Usage:

```r
# load library
library(tsfeaturex)

# for reproducibility of this example
set.seed(516)

# create test data
dat <- data.frame(expand.grid(day=c(1:7),id=c(1:100)))
dat$y <- rnorm(nrow(dat),5,1.5)
dat$y[1:3] <- NA # introduce NAs to check

# run function
out.list <- extract_features(df=dat,group_var="id",value_var="y",features="all")

# convert list to data.frame (MapReduce)
final.df <- features_to_df(out.list, data.format="wide")

# get feature correlations
cor.df <- feature_correlations(final.df, data.format="wide")

# view results
View(final.df)
