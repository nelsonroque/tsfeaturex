#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name normalize 
#' @return transforms data to 0-1
#' @param x class: vector, data from dplyr %>%
#' @export
normalize <- function(x) {
  v <- (x-min(x))/(max(x)-min(x))
  return(v)
}