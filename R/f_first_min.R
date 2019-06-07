#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.first.min
#' @param x class: vector, data from dplyr
#' @export
f.first.min <- function(x) {
  x <- x[!is.na(x)]
  wm <- which.min(x)
  if(wm == 0) {
    wm = NA
  }
  return(wm)
}
