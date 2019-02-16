#' A Time-Series Feature Extraction Package
#'

#' @name normalize 
#' @return transforms data to 0-1
#' @param x class: vector, data from dplyr %>%
#' @export
normalize <- function(x) {
  v <- (x-min(x))/(max(x)-min(x))
  return(v)
}

#' @name f.min 
#' @return calculate min of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.min <- function(x) {
  return(min(x,na.rm=T))
}

#' @name f.max 
#' @return calculate max of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.max <- function(x) {
  return(max(x,na.rm=T))
}

#' @name f.median 
#' @return calculate median of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.median <- function(x) {
  return(median(x,na.rm=T))
}

#' @name f.mean 
#' @return calculate median of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.mean <- function(x) {
  return(mean(x,na.rm=T))
}

#' @name f.sum 
#' @return calculate sum of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.sum <- function(x) {
  return(sum(x,na.rm=T))
}

#' @name f.sd 
#' @return calculate sd of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.sd <- function(x) {
  return(sd(x,na.rm=T))
}

#' @name f.IQR 
#' @return calculate IQR of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.IQR <- function(x) {
  return(IQR(x,na.rm=T))
}

#' @name f.variance 
#' @return calculate variance of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.variance <- function(x) {
  return(sd(x,na.rm=T)**2)
}

#' @name f.coeff.variation
#' @return ...
#' @param x class: vector, data from dplyr %>%
#' @export
f.coeff.variation <- function(x) {
  return(sd(x,na.rm=T)/mean(x,na.rm=T))
}

#' @name f.range
#' @return Range of data
#' @param x class: vector, data from dplyr %>%
#' @export
f.range <- function(x) {
  r = range(x,na.rm=T)
  rg = r[2] - r[1]
  return(rg)
}