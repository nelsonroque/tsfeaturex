#' A Time-Series Feature Extraction Package
#'

#' @name f.count.negative
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.negative <- function(x) {
  return(sum(x < 0,na.rm=T))
}

#' @name f.count.positive
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.positive <- function(x) {
  return(sum(x > 0,na.rm=T))
}

#' @name f.count.above.mean
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.above.mean <- function(x) {
  m <- mean(x,na.rm=T)
  return(sum(x > m,na.rm=T))
}

#' @name f.count.below.mean
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.below.mean <- function(x) {
  m <- mean(x,na.rm=T)
  return(sum(x < m,na.rm=T))
}

#' @name f.count.above.1sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.above.1sigma <- function(x) {
  
  sd1 <- 1 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd1
  return(sum(x > threshold))
}

#' @name f.count.below.1sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.below.1sigma <- function(x) {
  
  sd1 <- 1 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd1
  return(sum(x < threshold))
}

#' @name f.count.above.2sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.above.2sigma <- function(x) {
  
  sd2 <- 2 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd2
  return(sum(x > threshold))
}

#' @name f.count.below.1sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.below.2sigma <- function(x) {
  
  sd2 <- 2 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd2
  return(sum(x < threshold))
}

#' @name f.count.above.3sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.above.3sigma <- function(x) {
  
  sd3 <- 3 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd3
  return(sum(x > threshold))
}

#' @name f.count.below.3sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.below.3sigma <- function(x) {
  
  sd3 <- 3 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd3
  return(sum(x < threshold))
}
