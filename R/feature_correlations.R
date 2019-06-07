#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name feature_correlations
#' @param df class: data.frame
#' @param id_var class: string; variable indicating identifier (no need to correlate that, right?)
#' @param data.format class: string; whether data is in 'wide' or 'long' format ('long' returns error)
#' @param view class: boolean; whether or not to show data.frame of highly correlated variables above preset threshold (default = 0.5)
#' @param r_threshold class: numeric; correlation threshold to display above
#' @keywords time series, intra-individual variability
#' @import tidyverse
#' @examples
#' feature_correlations(df, view=T, r_threshold=0.75)
#' COMING SOON: p-value support

#' @export
feature_correlations <- function(df, id_var, data.format="wide", view=F, r_threshold=0.5) {
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  # GENERATE CORRELATION MATRIX
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  # take passed in data.frame
  # get numeric columns
  # remove identifier
  # turn to a matrix
  # get correlations
  # extract rownames into column names
  # wide to long
  # filter non-1 values
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  cor.df <- df %>% 
    select_if(is.numeric) %>%
    select_(paste0("-",id_var)) %>%
    as.matrix %>%
    cor %>%
    as.data.frame %>%
    rownames_to_column(var = 'var1') %>%
    gather(var2, value, -var1) %>% 
    filter(abs(value) < 1.00)
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  # if flag, show correlations above threshold
  if(view) {
    # save dataframe of correlations
    highly.correlated <- cor.df %>% filter(value > r_threshold)
    View(highly.correlated)
  }
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  return(cor.df)
}
