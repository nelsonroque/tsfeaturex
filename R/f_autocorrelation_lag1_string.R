#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.autocorrelation.lag1.string
#' @param x class: vector, data from dplyr
#' @export
f.autocorrelation.lag1.string <- function(x) {
  ac <- f.autocorrelation(x,1)
  return(paste(ac,collapse=','))
}