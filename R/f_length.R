#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.length 
#' @return calculate length of x
#' @param x class: vector, data from dplyr
#' @return Returns the length of observations
#' @export
f.length <- function(x) {
  return(length(x))
}