#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.first.max
#' @param x class: vector, data from dplyr %>%
#' @export
f.first.max <- function(x) {
  x <- x[!is.na(x)]
  wm <- which.max(x)
  if(wm == 0) {
    wm = NA
  }
  return(wm)
}