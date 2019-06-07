#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_25
#' @param x class: vector, data from dplyr
#' @export
f.quantile_25 <- function(x) {
  return(quantile(x,.25,na.rm=T))
}