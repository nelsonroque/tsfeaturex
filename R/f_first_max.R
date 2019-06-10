#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.first.max
#' @param x class: vector, data from dplyr
#' @export
f.first.max <- function(x) {
  x2 <- x[!is.na(x)]
  if(length(x2) == 0){
    wm = NA
  } else {
    wm <- which.max(x2)
    if(wm == 0) {
      wm = NA
    }
  }
  
  return(wm)
}