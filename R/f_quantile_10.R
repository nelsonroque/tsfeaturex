#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_10
#' @param x class: vector, data from dplyr
#' @export
f.quantile_10 <- function(x) {
  return(quantile(x,.1,na.rm=T))
}