#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.autocorrelation.lag1.2nd.val
#' @param x class: vector, data from dplyr %>%
#' @export
f.autocorrelation.lag1.2nd.val <- function(x) {
  ac <- f.autocorrelation(x,1)
  return(ac[2])
}