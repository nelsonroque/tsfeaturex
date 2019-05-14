# R package: tsfeaturex

[![DOI](https://zenodo.org/badge/170967121.svg)](https://zenodo.org/badge/latestdoi/170967121)

## Description
Calculate many features (over 50) of a time series.

## Dependencies 

- tidyverse (citation)

## Imports

- e1071 (citation)
- entropy (citation)
- Langevin (citation)
- Hmisc (citation)
- forecast (citation)
- stats (citation)
- zoo (citation)
- viridis (citation)
- psych (citation)

## Special Thanks
- Inspiration for automatic feature extraction: https://github.com/blue-yonder/tsfresh
- Dr. Nilam Ram for code on probability of acute change
- Github user 'stas-g' for peak-finding code: https://github.com/stas-g/findPeaks

## Acknowledgements

Development supported by National Institute on Aging Grant T32 AG049676 to The Pennsylvania State University. 

## Roadmap

- Push to CRAN (June 2019)
- Extracting numerical features from text data (Q2 2019)
- More features (Fast Fourier Transform (FFT), Time-Series Components (Seasonality, trend, random), Friedrich coefficients (Q3 2019)
- Extracting numerical features from image data (Q4 2019)

# Statement of Need

In today's digital world, data collection and storage costs are quite low. Humans are collectively outputting 2.5 quintillion bytes of data every day; by 2020, each person will generate ~ 1.7 MB every second [@ibmstats].  At this scale, intensive longitudinal data about humans' behavior facilitates new discovery about the patterning of thought and action and potentially better prediction and optimization of health and well-being.  In raw, form the 2.5 quintillion bytes of raw data generated daily are difficult to interpret -- noisy time-series. Extraction of features from the time-series, however, allows:

1. Researchers to reduce the dimensionality of their time-series data (e.g., reducing millions of time-stamped observations to, for example, summary feature vector of length 100); 

2. Summary characterizations of time-series data that may be used as predictors, correlates, or outcomes in study of between-person differences; and 

3. Improved and detailed description of human behavior streams (e.g., characterizing a behavioral time series in terms of its features; the mean is 'X', the range is 'Y', the peaks are at 'T12' and 'T30').

Short data streams are easily summarized using basic features (e.g., mean, standard deviation, IQR). However, as the time-series get longer, numerous other features may be needed and/or can be accessed. Study of intraindividual variability has outlined the wide variety of time-series features that can be used to characterize between-person differences and within-person change - with features such as probability of acute change (PAC) or mean square of successive differences (MSSD) providing useful information about individuals' cognitive, emotional, and behavioral dynamics (for more info on intraindividual variability metrics, see: [@Jahng2008]).

## References

[@ibmstats]
[@Jahng2008]

# Installation:

```
devtools::install_github("nelsonroque/tsfeaturex")
```

# Report a bug
File an issue here on Github: (https://github.com/nelsonroque/tsfeaturex/issues/new?assignees=&labels=&template=bug_report.md&title=) or reach out directly (nelsonroquejr@gmail.com)

# Request a New Feature
Request a new feature on Github: (https://github.com/nelsonroque/tsfeaturex/issues/new?assignees=&labels=&template=feature_request.md&title=) or reach out directly (nelsonroquejr@gmail.com)

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
final.df <- features_to_df(out.list, data.format="wide", group_var = "id")

# get feature correlations
cor.df <- feature_correlations(final.df, data.format="wide", id_var = "id")

# view results
View(final.df)