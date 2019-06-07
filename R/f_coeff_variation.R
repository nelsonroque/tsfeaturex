#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.coeff.variation
#' @return ...
#' @param x class: vector, data from dplyr
#' @export
f.coeff.variation <- function(x) {
  return(sd(x,na.rm=T)/mean(x,na.rm=T))
}