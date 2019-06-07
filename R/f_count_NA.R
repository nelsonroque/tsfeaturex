#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.count.NA
#' @param x class: vector, data from dplyr
#' @return custom function to count NAs
#' @export
f.count_NA <- function(x) {
  return(sum(is.na(x)))
}