#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_50
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_50 <- function(x) {
  return(quantile(x,.5,na.rm=T))
}