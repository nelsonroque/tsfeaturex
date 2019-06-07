#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_90
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_90 <- function(x) {
  return(quantile(x,.90,na.rm=T))
}