#' A Time-Series Feature Extraction Package
#'

#' @name f.first.min
#' @param x class: vector, data from dplyr %>%
#' @export
f.first.min <- function(x) {
  x <- x[!is.na(x)]
  wm <- which.min(x)
  if(wm == 0) {
    wm = NA
  }
  return(wm)
}

#' @name f.first.max
#' @param x class: vector, data from dplyr %>%
#' @export
f.first.max <- function(x) {
  x <- x[!is.na(x)]
  wm <- which.max(x)
  if(wm == 0) {
    wm = NA
  }
  return(wm)
}

#' @name f.find.peaks
#' @param x class: vector, data from dplyr %>%
#' @export
f.find.peaks <- function (x, m = 3){
  x <- x[!is.na(x)]
  shape <- diff(sign(diff(x, na.pad = FALSE)))
  pks <- sapply(which(shape < 0), FUN = function(i){
    z <- i - m + 1
    z <- ifelse(z > 0, z, 1)
    w <- i + m + 1
    w <- ifelse(w < length(x), w, length(x))
    if(all(x[c(z : i, (i + 2) : w)] <= x[i + 1])) return(i + 1) else return(numeric(0))
  })
  pks <- unlist(pks)
  return(paste0(pks,collapse=','))
}

#' @name f.count.peaks
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.peaks <- function (x, m = 3){
  x <- x[!is.na(x)]
  shape <- diff(sign(diff(x, na.pad = FALSE)))
  pks <- sapply(which(shape < 0), FUN = function(i){
    z <- i - m + 1
    z <- ifelse(z > 0, z, 1)
    w <- i + m + 1
    w <- ifelse(w < length(x), w, length(x))
    if(all(x[c(z : i, (i + 2) : w)] <= x[i + 1])) return(i + 1) else return(numeric(0))
  })
  pks <- unlist(pks)
  return(length(pks))
}