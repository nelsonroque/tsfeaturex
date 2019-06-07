#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_40
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_40 <- function(x) {
  return(quantile(x,.4,na.rm=T))
}