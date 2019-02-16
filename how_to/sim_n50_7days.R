# remove old versions of package (you always want the fresh one!)
remove.packages('featuRe') 

# install latest from github
devtools::install_github("nelsonroque/featuRe")

# load library
library(featuRe)

# for reproducibility
set.seed(420) # iterate seeds through 600

# create test data
df <- data.frame(expand.grid(day=c(1:7),id=c(1:50)))
df$y <- rnorm(nrow(df),5,1.5)
df$y[1:3] <- NA # introduce NAs to check

# run function
# should take ~ 3.3 seconds to process 50 participants, each with 7 day series
out.list <- extract_features(df,"id","y","all",data_confirm = T)

# convert list to data.frame (MapReduce)
final.df <- features_to_df(out.list)

# view results for row 1, verify that f.min_y = 4.517403 
final.df[1,]

# get feature correlations dataframe
feature_correlations(df = final.df, 
                     group_var = "id",
                     r_threshold = 0.8)

