# load library
devtools::install_github("nelsonroque/tsfeaturex", force=T)
library(tsfeaturex)

# for reproducibility of this example
set.seed(516)

# create test data
dat <- data.frame(expand.grid(day=c(1:7),id=c(1:100)))
dat$y <- rnorm(nrow(dat),5,1.5)
dat$y[1:3] <- NA # introduce NAs to check

# run function
out.list <- extract_features(df=dat,group_var="id",value_var="y",features="all", verbose=F, return_timing = F)

# convert list to data.frame (MapReduce)
final.df <- features_to_df(out.list, data.format="wide", group_var = "id")

# get feature correlations
cor.df <- feature_correlations(final.df, data.format="wide", id_var = "id")

# view results
View(final.df)
