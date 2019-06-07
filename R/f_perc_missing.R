#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.perc.missing
#' @param x class: vector, data from dplyr
#' @return percentage missing data
#' @export
f.perc.missing <- function(x) {
  perc.missing <- (sum(is.na(x))/length(x))*100
  return(perc.missing)
}