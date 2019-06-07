#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.mean 
#' @return calculate median of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.mean <- function(x) {
  return(mean(x,na.rm=T))
}