#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.kurtosis
#' @param x class: vector, data from dplyr %>%
#' @export
f.kurtosis <- function(x) {
  return(kurtosis(x,na.rm=T))
}