#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.first.min
#' @param x class: vector, data from dplyr
#' @export
f.first.min <- function(x) {
  x2 <- x[!is.na(x)]
  if(length(x2) == 0){
    wm = NA
  } else {
    wm <- which.min(x2)
    if(wm == 0) {
      wm = NA
    }
  }
  
  return(wm)
}
