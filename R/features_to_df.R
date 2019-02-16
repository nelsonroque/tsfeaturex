#' A Time-Series Feature Extraction Package

#' @param df.list class: list of dataframes; each dataframe result of different feature calculator
#' @param group_var class: vector of strings to group data by (ID, variable)
#' @param data.format class: string; 'wide' or 'long'; currently no support for 'wide'
#' @param verbose class: boolean; T = display status, debugging info
#' @keywords time series, intra-individual variability
#' @examples
#' features_to_df(df.list, group_var='id', data.format='long')
#' features_to_df(df.list, group_var=c('id','session'), data.format='wide')
#' @import reshape2

#' @export
features_to_df <- function(df.list, group_var, data.format = "long", verbose=F) {
  VERSION_CODE = packageVersion("featuRe")
  
  # check list to make sure it is mergeable
  if(length(df.list) > 1){
    # save all lists to dataframe
    feature.df = Reduce(function(...) merge(..., all=T), df.list)
    
    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    # depending on desired output format,
    # translate the dataset as necessary
    if(data.format == "long"){
      export.df <- feature.df
    } else {
      if(data.format == "wide") {
        
        # melt the data frame
        final.melt <- reshape2::melt(feature.df,id.vars=group_var)
        
        # name column with calculated features
        names(final.melt)[3] <- "feature"
        
        # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        # write dcast formula depending 
        # on number of arguments in group_var
        dcast.formula.lhs <- group_var[1] # assuming first index is ID column
        dcast.formula.rhs <- group_var[2:length(group_var)]
        dcast.formula.full <- paste0(dcast.formula.lhs, " ~ ", "feature +", paste0(dcast.formula.rhs,collapse="+"))
        
        # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        # go from long to wide
        export.df <- dcast(final.melt, dcast.formula.full)
        
        # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        # if currently debugging, 
        # view variable names
        if(verbose){
          print("DEBUGGING STATUS: ON")
          names(feature.df)
          print("---------------------------")
          names(final.melt)
          print("---------------------------")
        }
      }
    }
    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    # if currently debugging, 
    # view variable names
    if(verbose){
      names(export.df)
      print("---------------------------")
    }
    
    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
  } else {
    # return error dataframe if feature list is empty
    export.df <- data.frame(ERROR="empty list returned from feature extraction")
  }
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # add version number to dataframe
  export.df$PACKAGE_VERSION = VERSION_CODE
  
  # return final dataset
  return(export.df)
}