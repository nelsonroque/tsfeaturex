#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_30
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_30 <- function(x) {
  return(quantile(x,.3,na.rm=T))
}