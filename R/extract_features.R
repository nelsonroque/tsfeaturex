#' A Time-Series Feature Extraction Package
#' 
#' @param df class: data.frame
#' @param group_var class: string, or vector of strings; description: column name(s) to group by
#' @param value_var class: string; description: column name with value 'y' in data
#' @param features class: pre-defined string or list of vectors; Pre-defined strings are: 'all', 'simple', 'change', 'meta', 'count','intensive'
#' @param custom_feature_list class: pre-defined string or list of vectors; if features="custom", can supply a vector of features of interest
#' @param data_confirm class: boolean; T = confirming data is in long format
#' @param return_timing class: boolean; T = return dataframe with timing for each feature
#' @param verbose class: boolean; T = display status, debugging info
#' @examples
#' extract_features(df,group_var='id',value_var='y',features='simple')
#' extract_features(df,group_var=c('id','month'),'y',features='all')
#' @export
#' @import entropy
#' @import zoo
#' @importFrom e1071 kurtosis skewness
#' @importFrom Langevin Langevin1D
#' @importFrom psych mssd

extract_features <- function(df, group_var, value_var, features='all', custom_feature_list=NA, data_confirm=T, return_timing=T, verbose=T){
  VERSION_CODE = packageVersion("tsfeaturex")   
  #' storing for multiple downstream purposes
  
  if(!data_confirm){
    #' request acknowledgement from user if they did not pass in the parameter
    print("By running this script, you are acknowledging:")
    print("-- your data is in long format")
    print("-- you are aware of the precision of your input/output variables (be mindful of significant digits)")
    print("-- you are aware missing data is filtered (considere imputation approaches prior to feature extraction")
    print("-- if you use this package, you will cite it: https://zenodo.org/badge/latestdoi/170967121")
  } else {
    
    #' check if custom feature list provided
    if(features == "custom") {
      if(is.na(custom_feature_list)){
        stop("ERROR: If 'features' is set to 'custom', you must supply a vector of functions from within the package")
      } else {
        #' if custom features provided, save into common namespace
        current.features <- custom_feature_list
      }
    } else {
      #' otherwise, get a vector of features based on the provided category
      current.features <- generate_extraction_list(features)
    }
      
    #' 
    
    #' create list to store feature data
    feature_list = list()
    
    #' create dataframe to return feature timing data
    feature_timing_df = data.frame()
    
    #' 
    
    #' start timer
    SESSION_START_TIME <- Sys.time()
    SESSION_START_TIMESTAMP = format(SESSION_START_TIME, "%m_%d_%Y-%H_%M_%S")
    
    #' process all features
    for(feature_ in current.features) {
        
      #' start feature timer
      PROCESS_START_TIME = Sys.time()
      PROCESS_START_TIMESTAMP = format(PROCESS_START_TIME, "%m/%d/%Y %H:%M:%S")
            
      #' extract function name, assuming first argument
      func_name <- feature_[1]
            
      #' construct function call
      if(length(feature_) > 1) {
        func_var_str <- paste(func_name,func_args,sep='_')
        func_args <- feature_[2:length(feature_)]
        method_constructor <- paste(func_name,'(',value_var,',',paste(func_args,sep=','),')')
      } else {
        func_args <- ''
        func_var_str <- paste(func_name,sep='_')
        method_constructor <- paste(func_name,'(',value_var,')')
      }
            
      #' construct feature method add in support for NAs
      new_method <- method_constructor
            
      #' create variable name
      new_var_name <- paste0(func_var_str,'_', value_var)
            
      #' start feature extraction timer
      FEATURE_START_TIME = Sys.time()
      FEATURE_START_TIMESTAMP = format(FEATURE_START_TIME, "%m/%d/%Y %H:%M:%S")
            
      #' run one feature calculation
      df_output <- df %>%
        group_by_(.dots = group_var) %>%
        summarise_(.dots = setNames(new_method, new_var_name))
            
      #' save each feature as list object
      feature_list[[feature_]] <- df_output
            
      #' end feature timer
      PROCESS_END_TIME = Sys.time()
      
      #' calculate elapsed time
      feature_elapsed_time = difftime(PROCESS_END_TIME,FEATURE_START_TIME,units='secs')
      process_elapsed_time = difftime(PROCESS_END_TIME,PROCESS_START_TIME,units='secs')
            
      #' create export dataset with timing features
      feature_export_df <- data.frame(feature = func_name,
                                      session_start_timestamp = SESSION_START_TIME,
                                      process_start_timestamp = PROCESS_START_TIMESTAMP,
                                      feature_start_timestamp = FEATURE_START_TIMESTAMP,
                                      process_start_timer = as.numeric(PROCESS_START_TIME)*1000,
                                      feature_start_timer = as.numeric(FEATURE_START_TIME)*1000,
                                      process_end_timer = as.numeric(PROCESS_END_TIME)*1000)
            
      #' bind to full dataset of timing details
      feature_timing_df <- rbind(feature_timing_df,feature_export_df)
            
      #' print function name
      if(verbose) {
        print(paste0("(v.",VERSION_CODE,") ","EXTRACTING: ", func_name," | Elapsed time (secs):",feature_elapsed_time))
      }
    }
        
    #' print run time
    ELAPSED_TIME = difftime(Sys.time(),SESSION_START_TIME,units='secs')
    print(paste0("(v.",VERSION_CODE,")"," EXTRACTING: total run time | Elapsed time (secs): ",ELAPSED_TIME))
        
    #' view timings by feature if desired
    if(return_timing) {
      TIMING_FN <- paste0("FEATURE_EXTRACTION_SESSION",SESSION_START_TIMESTAMP,".csv")
      write.csv(feature_timing_df,TIMING_FN,row.names=F)
      print(paste0("TIMING FILE WRITTEN TO WORKING DIRECTORY: ",TIMING_FN))
      View(feature_timing_df)
    }
    
    #' return list of features
    return(feature_list)
  }
}