#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.prop.missing
#' @param x class: vector, data from dplyr %>%
#' @return percentage missing data
#' @export
f.prop.missing <- function(x) {
  prop.missing <- (sum(is.na(x))/length(x))
  return(prop.missing)
}