#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.median 
#' @return calculate median of x
#' @param x class: vector, data from dplyr
#' @export
f.median <- function(x) {
  return(median(x,na.rm=T))
}