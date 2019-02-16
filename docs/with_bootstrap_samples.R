# load library
library(tsfeaturex)
library(viridis)

for(i in 1:10) {
  # for reproducibility
  set.seed(i) # iterate seeds through 600
  
  # create test data
  df <- data.frame(expand.grid(day=c(1:180),id=c(1:80)))
  df$y <- rnorm(nrow(df),5,10)
  #df$y[1:3] <- NA # introduce NAs to check
  
  # run function
  # should take ~ 3.3 seconds to process 50 participants, each with 7 day series
  out.list <- extract_features(df,"id",value_var = "y", features = "all", data_confirm = T, return_timing = F)
  
  # convert list to data.frame (MapReduce)
  final.df <- features_to_df(out.list)
  
  # view results for row 1, verify that f.min_y = 4.517403 
  final.df[1,]
  
  # get feature correlations dataframe
  fc <- feature_correlations(df = final.df, 
                             id_var = "id",
                             view=T,
                             r_threshold = 0.8)
  
  EXPORT_STAMP = format(Sys.time(), "%Y%m%d_%H%M%S")
  feature_corr_heatmap(fc,paste0("~/Github/tmp/featureseeds/",EXPORT_STAMP))
  #Sys.sleep(0.69)
}