#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.entropy
#' @param x class: vector, data from dplyr %>%
#' @return Returns Shannon Entropy
#' @export
f.entropy <- function(x) {
  x2 <- x[!is.na(x)]
  x3 <- table(x2)
  return(entropy::entropy(x3))
}