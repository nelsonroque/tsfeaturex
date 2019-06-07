#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.count.positive
#' @param x class: vector, data from dplyr
#' @export
f.count.positive <- function(x) {
  return(sum(x > 0,na.rm=T))
}