#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.quantile_70
#' @param x class: vector, data from dplyr
#' @export
f.quantile_70 <- function(x) {
  return(quantile(x,.70,na.rm=T))
}