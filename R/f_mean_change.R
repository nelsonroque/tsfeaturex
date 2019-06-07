#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.mean.change
#' @param x class: vector, data from dplyr %>%
#' @return Returns the mean over the absolute differences between subsequent time series values which is
#' @export
f.mean.change <- function(x) {
  return(mean(abs(x-lag(x)),na.rm=T))
}