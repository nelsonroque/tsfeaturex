#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.autocorrelation.lag2.2nd.val
#' @param x class: vector, data from dplyr
#' @export
f.autocorrelation.lag2.2nd.val <- function(x) {
  ac <- f.autocorrelation(x,2)
  return(ac[2])
}