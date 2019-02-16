#' A Time-Series Feature Extraction Package
#'

#' @name f.length 
#' @return calculate length of x
#' @param x class: vector, data from dplyr %>%
#' @return Returns the length of observations
#' @export
f.length <- function(x) {
  return(length(x))
}

#' @name f.count.NA
#' @param x class: vector, data from dplyr %>%
#' @return custom function to count NAs
#' @export
f.count_NA <- function(x) {
  return(sum(is.na(x)))
}

#' @name f.perc.unique.values
#' @param x class: vector, data from dplyr %>%
#' @return Returns the ratio of unique values, that are present in the time series more than once.
#' @export
f.perc.unique.values <- function(x) {
  return((length(unique(x))/length(x))*100)
}

#' @name f.ratio.unique.values
#' @param x class: vector, data from dplyr %>%
#' @return Returns the ratio of unique values, that are present in the time series more than once.
#' @export
f.ratio.unique.values <- function(x) {
  return((length(unique(x))/length(x)))
}

#' @name f.perc.missing
#' @param x class: vector, data from dplyr %>%
#' @return percentage missing data
#' @export
f.perc.missing <- function(x) {
  perc.missing <- (sum(is.na(x))/length(x))*100
  return(perc.missing)
}

#' @name f.prop.missing
#' @param x class: vector, data from dplyr %>%
#' @return percentage missing data
#' @export
f.prop.missing <- function(x) {
  prop.missing <- (sum(is.na(x))/length(x))
  return(prop.missing)
}