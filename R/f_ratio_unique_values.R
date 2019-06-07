#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.ratio.unique.values
#' @param x class: vector, data from dplyr
#' @return Returns the ratio of unique values, that are present in the time series more than once.
#' @export
f.ratio.unique.values <- function(x) {
  return((length(unique(x))/length(x)))
}