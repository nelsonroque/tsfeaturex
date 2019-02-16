#' A Time-Series Feature Extraction Package
#'

#' @name f.which.below.1sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.below.1sigma <- function(x) {
  sd1 <- 1 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd1
  return(paste0(which(x < threshold),collapse=','))
}

#' @name f.which.above.1sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.above.1sigma <- function(x) {
  sd1 <- 1 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd1
  return(paste0(which(x > threshold),collapse=','))
}

#' @name f.which.below.2sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.below.2sigma <- function(x) {
  sd2 <- 2 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd2
  return(paste0(which(x < threshold),collapse=','))
}

#' @name f.which.above.2sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.above.2sigma <- function(x) {
  sd2 <- 2 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd2
  return(paste0(which(x > threshold),collapse=','))
}

#' @name f.which.below.3sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.below.3sigma <- function(x) {
  sd3 <- 3 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd3
  return(paste0(which(x < threshold),collapse=','))
}

#' @name f.which.above.3sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.above.3sigma <- function(x) {
  sd3 <- 3 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd3
  return(paste0(which(x > threshold),collapse=','))
}