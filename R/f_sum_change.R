#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.sum.change
#' @param x class: vector, data from dplyr
#' @return Returns the sum over the absolute differences between subsequent time series values which is
#' @export
f.sum.change <- function(x) {
  return(sum(abs(x-lag(x)),na.rm=T))
}