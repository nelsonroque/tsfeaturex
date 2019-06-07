#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_80
#' @param x class: vector, data from dplyr
#' @export
f.quantile_80 <- function(x) {
  return(quantile(x,.80,na.rm=T))
}