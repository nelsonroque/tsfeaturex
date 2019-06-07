#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.mssd.lag3
#' @param x class: vector, data from dplyr
#' @return Returns the MSSD, lag3; Von Neuman et al. (1941) discussed the Mean Square of Successive Differences as a measure of variability that takes into account gradual shifts in mean
#' @export
f.mssd.lag3 <- function(x) {
  x2 <- x[!is.na(x)]
  return(mssd(x2,lag=3))
}