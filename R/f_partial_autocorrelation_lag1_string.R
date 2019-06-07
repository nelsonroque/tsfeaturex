#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.partial.autocorrelation.lag1.string
#' @param x class: vector, data from dplyr
#' @export
f.partial.autocorrelation.lag1.string <- function(x) {
  ac <- f.partial.autocorrelation(x,1)
  return(paste(ac,collapse=','))
}