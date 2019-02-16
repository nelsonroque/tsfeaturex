#' A Time-Series Feature Extraction Package
#'

#' @name f.kurtosis
#' @param x class: vector, data from dplyr %>%
#' @export
f.kurtosis <- function(x) {
  return(kurtosis(x,na.rm=T))
}

#' @name f.skew
#' @param x class: vector, data from dplyr %>%
#' @export
f.skew <- function(x) {
  return(skewness(x,na.rm=T))
}

#' @name f.quantile_10
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_10 <- function(x) {
  return(quantile(x,.1,na.rm=T))
}

#' @name f.quantile_20
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_20 <- function(x) {
  return(quantile(x,.2,na.rm=T))
}

#' @name f.quantile_25
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_25 <- function(x) {
  return(quantile(x,.25,na.rm=T))
}

#' @name f.quantile_30
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_30 <- function(x) {
  return(quantile(x,.3,na.rm=T))
}

#' @name f.quantile_40
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_40 <- function(x) {
  return(quantile(x,.4,na.rm=T))
}

#' @name f.quantile_50
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_50 <- function(x) {
  return(quantile(x,.5,na.rm=T))
}

#' @name f.quantile_60
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_60 <- function(x) {
  return(quantile(x,.6,na.rm=T))
}

#' @name f.quantile_70
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_70 <- function(x) {
  return(quantile(x,.70,na.rm=T))
}

#' @name f.quantile_75
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_75 <- function(x) {
  return(quantile(x,.75,na.rm=T))
}

#' @name f.quantile_80
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_80 <- function(x) {
  return(quantile(x,.80,na.rm=T))
}

#' @name f.quantile_90
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_90 <- function(x) {
  return(quantile(x,.90,na.rm=T))
}

#' @name f.quantile_95
#' @param x class: vector, data from dplyr %>%
#' @export
f.quantile_95 <- function(x) {
  return(quantile(x,.95,na.rm=T))
}