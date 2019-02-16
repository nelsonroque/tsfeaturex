#' A Time-Series Feature Extraction Package

#' @name feature_corr_heatmap
#' @param df class: data.frame
#' @param out.path class: string; where to save correlation heatmap
#' @keywords time series, intra-individual variability
#' @import tidyverse
#' @examples
#' feature_corr_heatmap(df, out.path)

#' @export

feature_corr_heatmap <- function(cor.df,out.path=NA) {
  # display plot 
  corr.plot <- ggplot(cor.df,
                      aes(var1,var2,
                          fill=value)) + 
    geom_tile() +
    #scale_fill_gradient2(low = "blue", 
    #                     high = "red", 
    #                     mid = "white", 
    #                     midpoint = 0, 
    #                     limit = c(-1,1), 
    #                     space = "Lab", 
    #                     name="Pearson\nCorrelation") +
    scale_fill_viridis() +
    theme_minimal() +
    #theme(axis.text.x = element_text(size = 8, angle = 45, 
    #                                 vjust = 1, hjust = 1),
    theme(axis.text = element_blank(),
          axis.title = element_blank(),
          axis.ticks = element_blank(),
          legend.position = "none") +
  print(corr.plot)
  
  # output the file if desired
  if(!is.na(out.path)){
    ggsave(paste0(out.path,"corr_heatmap.png"))
  }
  
  return(corr.plot)
}