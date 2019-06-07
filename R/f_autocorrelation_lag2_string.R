#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.autocorrelation.lag2.string
#' @param x class: vector, data from dplyr
#' @export
f.autocorrelation.lag2.string <- function(x) {
  ac <- f.autocorrelation(x,2)
  return(paste(ac,collapse=','))
}