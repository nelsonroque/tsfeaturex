#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.partial.autocorrelation.lag1.1st.val
#' @param x class: vector, data from dplyr
#' @export
f.partial.autocorrelation.lag1.1st.val <- function(x) {
  ac <- f.partial.autocorrelation(x,1)
  return(ac[1])
}