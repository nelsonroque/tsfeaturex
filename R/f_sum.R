#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.sum 
#' @return calculate sum of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.sum <- function(x) {
  return(sum(x,na.rm=T))
}