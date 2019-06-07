#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.max 
#' @return calculate max of x
#' @param x class: vector, data from dplyr
#' @export
f.max <- function(x) {
  return(max(x,na.rm=T))
}