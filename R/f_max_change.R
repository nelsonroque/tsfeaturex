#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.max.change
#' @param x class: vector, data from dplyr
#' @return Returns the max over the absolute differences between subsequent time series values which is
#' @export
f.max.change <- function(x) {
  return(max(abs(x-lag(x)),na.rm=T))
}