#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.partial.autocorrelation.lag2.1st.val
#' @param x class: vector, data from dplyr %>%
#' @export
f.partial.autocorrelation.lag2.1st.val <- function(x) {
  ac <- f.partial.autocorrelation(x,2)
  return(ac[1])
}