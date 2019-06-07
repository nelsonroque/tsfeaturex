#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.count.below.3sigma
#' @param x class: vector, data from dplyr
#' @export
f.count.below.3sigma <- function(x) {
  
  sd3 <- 3 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd3
  return(sum(x < threshold))
}