#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.partial.autocorrelation
#' @param x class: vector, data from dplyr %>%
#' @export
f.partial.autocorrelation <- function(x,lag) {
  x2 <- x[!is.na(x)]
  if(length(x2) > 2) {
    a <- pacf(x2,plot=F,lag.max=lag)$acf
  } else {
    a <- NA
  }
  return(a)
}