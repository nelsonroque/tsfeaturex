#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.min.change
#' @param x class: vector, data from dplyr
#' @return Returns the min over the absolute differences between subsequent time series values which is
#' @export
f.min.change <- function(x) {
  return(min(abs(x-lag(x)),na.rm=T))
}
