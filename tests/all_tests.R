#devtools::install_github('tsfeaturex','nelsonroque')

# simulate loading of package
library(tsfeaturex)

# for reproducibility
set.seed(516)

# create test data
df <- data.frame(expand.grid(day=c(1:30),id=c(1:6)))
df$y <- rnorm(nrow(df),5,1.5)
#df$y[1:3] <- NA # introduce NAs to check

# specify grouping and data variable (what would eventually be function args)
group_var <- c("id")
value_var <- "y"
features <- 'all'

# create vector with all arguments for testing
all.args <- c('simple','distribution','count','location','meta','change','sigma','all')

# loop through all possible function arguments
for(test in all.args) {
  print(paste0("FEATURE EXTRACTION MODE: ", test))
  print("---------------------------------")
  
  # run function
  out.list <- extract_features(df,group_var,value_var,test, return_timing = F)
  
  # convert list to data.frame (MapReduce)
  final.df <- features_to_df(out.list)
}