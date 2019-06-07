#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name f.autocorrelation.lag2.1st.val
#' @param x class: vector, data from dplyr
#' @export
f.autocorrelation.lag2.1st.val <- function(x) {
  ac <- f.autocorrelation(x,2)
  return(ac[1])
}