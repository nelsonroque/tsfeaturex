#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.count.above.1sigma
#' @param x class: vector, data from dplyr
#' @export
f.count.above.1sigma <- function(x) {
  
  sd1 <- 1 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd1
  return(sum(x > threshold))
}