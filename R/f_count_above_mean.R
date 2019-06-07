#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.count.above.mean
#' @param x class: vector, data from dplyr
#' @export
f.count.above.mean <- function(x) {
  m <- mean(x,na.rm=T)
  return(sum(x > m,na.rm=T))
}
