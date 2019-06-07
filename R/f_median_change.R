#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.median.change
#' @param x class: vector, data from dplyr
#' @return Returns the median over the absolute differences between subsequent time series values which is
#' @export
f.median.change <- function(x) {
  return(median(abs(x-lag(x)),na.rm=T))
}