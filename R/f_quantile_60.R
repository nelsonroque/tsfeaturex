#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_60
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_60 <- function(x) {
  return(quantile(x,.6,na.rm=T))
}
