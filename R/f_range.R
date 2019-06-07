#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.range
#' @param x class: vector, data from dplyr
#' @return Range of data
#' @export
f.range <- function(x) {
  r = range(x,na.rm=T)
  rg = r[2] - r[1]
  return(rg)
}