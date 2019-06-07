#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.sd 
#' @return calculate sd of x
#' @param x class: vector, data from dplyr
#' @export
f.sd <- function(x) {
  return(sd(x,na.rm=T))
}