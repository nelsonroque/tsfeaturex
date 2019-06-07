#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_75
#' @param x class: vector, data from dplyr
#' @export
f.quantile_75 <- function(x) {
  return(quantile(x,.75,na.rm=T))
}