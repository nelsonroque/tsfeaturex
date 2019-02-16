#' A Time-Series Feature Extraction Package

#' @param df class: data.frame
#' @param plot class: boolean; whether or not to plot feature correlations as heatmap
#' @param view class: boolean; whether or not to show data.frame of highly correlated variables above preset threshold (default = 0.5)
#' @param r_threshold class: numeric; correlation threshold to display above
#' @keywords time series, intra-individual variability
#' @import tidyverse
#' @examples
#' feature_correlations(df, view=T, r_threshold=0.75)
#' COMING SOON: p-value support

#' @export
feature_correlations <- function(df, data.format="wide", group_var, plot=T, view=F,r_threshold=0.5) {
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
    select_(paste0("-id")) %>%
    as.matrix %>%
    cor %>%
    as.data.frame %>%
    rownames_to_column(var = 'var1') %>%
    gather(var2, value, -var1) %>% 
    filter(abs(value) < 1.00)
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  # DISPLAY PLOT (IF REQUESTED)
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  if(plot) {
    # display plot 
    corr.plot <- ggplot(cor.df,
           aes(var1,var2,
               fill=value)) + 
      geom_tile() +
      scale_fill_gradient2(low = "blue", 
                           high = "red", 
                           mid = "white", 
                           midpoint = 0, 
                           limit = c(-1,1), 
                           space = "Lab", 
                           name="Pearson\nCorrelation") +
      theme_minimal() +
      theme(axis.text.x = element_text(size = 8, angle = 45, 
                                       vjust = 1, hjust = 1))
    print(corr.plot)
  }
  
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
