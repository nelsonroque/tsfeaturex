#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.autocorrelation
#' @param x class: vector, data from dplyr %>%
#' @export
f.autocorrelation <- function(x,lag) {
  x2 <- x[!is.na(x)]
  if(length(x2) > 2) {
    a <- acf(x2,plot=F,lag.max=lag)$acf
  } else {
    a <- NA
  }
  return(a)
}