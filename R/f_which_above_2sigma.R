#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.which.above.2sigma
#' @param x class: vector, data from dplyr
#' @export
f.which.above.2sigma <- function(x) {
  sd2 <- 2 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd2
  return(paste0(which(x > threshold),collapse=','))
}