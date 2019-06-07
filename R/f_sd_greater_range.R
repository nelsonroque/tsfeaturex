#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.sd.greater.range
#' @return if sd is greater than range of data
#' @param x class: vector, data from dplyr
#' @export
f.sd.greater.range <- function(x) {
  sd_ <- sd(x,na.rm=T)
  sd.greater.range <- sd_ > f.range(x)
  return(sd.greater.range)
}
