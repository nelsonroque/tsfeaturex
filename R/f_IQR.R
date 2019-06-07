#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.IQR 
#' @param x class: vector, data from dplyr
#' @return calculate IQR of x
#' @export
f.IQR <- function(x) {
  return(IQR(x,na.rm=T))
}