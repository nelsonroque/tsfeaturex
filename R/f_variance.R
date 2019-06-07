#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.variance 
#' @return calculate variance of x
#' @param x class: vector, data from dplyr
#' @export
f.variance <- function(x) {
  return(sd(x,na.rm=T)**2)
}