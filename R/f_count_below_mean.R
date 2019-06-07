#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.count.below.mean
#' @param x class: vector, data from dplyr
#' @export
f.count.below.mean <- function(x) {
  m <- mean(x,na.rm=T)
  return(sum(x < m,na.rm=T))
}