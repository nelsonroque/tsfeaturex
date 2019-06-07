#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.IQR 
#' @return calculate IQR of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.IQR <- function(x) {
  return(IQR(x,na.rm=T))
}