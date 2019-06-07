#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.min 
#' @return calculate min of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.min <- function(x) {
  return(min(x,na.rm=T))
}