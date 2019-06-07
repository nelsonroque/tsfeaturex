#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.partial.autocorrelation.lag2.string
#' @param x class: vector, data from dplyr %>%
#' @export
f.partial.autocorrelation.lag2.string <- function(x) {
  ac <- f.partial.autocorrelation(x,2)
  return(paste(ac,collapse=','))
}