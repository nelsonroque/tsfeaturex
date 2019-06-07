#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_95
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_95 <- function(x) {
  return(quantile(x,.95,na.rm=T))
}