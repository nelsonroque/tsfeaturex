#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_20
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_20 <- function(x) {
  return(quantile(x,.2,na.rm=T))
}