#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.skew
#' @param x class: vector, data from dplyr
#' @export
f.skew <- function(x) {
  return(skewness(x,na.rm=T))
}