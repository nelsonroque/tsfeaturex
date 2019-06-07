#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.which.above.1sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.above.1sigma <- function(x) {
  sd1 <- 1 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd1
  return(paste0(which(x > threshold),collapse=','))
}