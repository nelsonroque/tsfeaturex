#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.count.negative
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.negative <- function(x) {
  return(sum(x < 0,na.rm=T))
}
