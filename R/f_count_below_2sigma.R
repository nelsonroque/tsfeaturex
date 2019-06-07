#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.count.below.2sigma
#' @param x class: vector, data from dplyr
#' @export
f.count.below.2sigma <- function(x) {
  
  sd2 <- 2 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd2
  return(sum(x < threshold))
}