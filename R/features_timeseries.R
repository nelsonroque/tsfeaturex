#' A Time-Series Feature Extraction Package
#'

#' @name f.autocorrelation
#' @param x class: vector, data from dplyr %>%
#' @export
f.autocorrelation <- function(x,lag) {
  x2 <- x[!is.na(x)]
  if(length(x2) > 2) {
    a <- acf(x2,plot=F,lag.max=lag)$acf
  } else {
    a <- NA
  }
  return(a)
}

#' @name f.partial.autocorrelation
#' @param x class: vector, data from dplyr %>%
#' @export
f.partial.autocorrelation <- function(x,lag) {
  x2 <- x[!is.na(x)]
  if(length(x2) > 2) {
    a <- pacf(x2,plot=F,lag.max=lag)$acf
  } else {
    a <- NA
  }
  return(a)
}

#' @name f.autocorrelation.lag1.string
#' @param x class: vector, data from dplyr %>%
#' @export
f.autocorrelation.lag1.string <- function(x) {
  ac <- f.autocorrelation(x,1)
  return(paste(ac,collapse=','))
}

#' @name f.autocorrelation.lag1.1st.val
#' @param x class: vector, data from dplyr %>%
#' @export
f.autocorrelation.lag1.1st.val <- function(x) {
  ac <- f.autocorrelation(x,1)
  return(ac[1])
}

#' @name f.autocorrelation.lag1.2nd.val
#' @param x class: vector, data from dplyr %>%
#' @export
f.autocorrelation.lag1.2nd.val <- function(x) {
  ac <- f.autocorrelation(x,1)
  return(ac[2])
}

#' @name f.autocorrelation.lag2.string
#' @param x class: vector, data from dplyr %>%
#' @export
f.autocorrelation.lag2.string <- function(x) {
  ac <- f.autocorrelation(x,2)
  return(paste(ac,collapse=','))
}

#' @name f.autocorrelation.lag2.1st.val
#' @param x class: vector, data from dplyr %>%
#' @export
f.autocorrelation.lag2.1st.val <- function(x) {
  ac <- f.autocorrelation(x,2)
  return(ac[1])
}

#' @name f.autocorrelation.lag2.2nd.val
#' @param x class: vector, data from dplyr %>%
#' @export
f.autocorrelation.lag2.2nd.val <- function(x) {
  ac <- f.autocorrelation(x,2)
  return(ac[2])
}

#' @name f.partial.autocorrelation.lag1.string
#' @param x class: vector, data from dplyr %>%
#' @export
f.partial.autocorrelation.lag1.string <- function(x) {
  ac <- f.partial.autocorrelation(x,1)
  return(paste(ac,collapse=','))
}

#' @name f.partial.autocorrelation.lag1.1st.val
#' @param x class: vector, data from dplyr %>%
#' @export
f.partial.autocorrelation.lag1.1st.val <- function(x) {
  ac <- f.partial.autocorrelation(x,1)
  return(ac[1])
}

#' @name f.partial.autocorrelation.lag1.2nd.val
#' @param x class: vector, data from dplyr %>%
#' @export
f.partial.autocorrelation.lag1.2nd.val <- function(x) {
  ac <- f.partial.autocorrelation(x,1)
  return(ac[2])
}

#' @name f.partial.autocorrelation.lag2.string
#' @param x class: vector, data from dplyr %>%
#' @export
f.partial.autocorrelation.lag2.string <- function(x) {
  ac <- f.partial.autocorrelation(x,2)
  return(paste(ac,collapse=','))
}

#' @name f.partial.autocorrelation.lag2.1st.val
#' @param x class: vector, data from dplyr %>%
#' @export
f.partial.autocorrelation.lag2.1st.val <- function(x) {
  ac <- f.partial.autocorrelation(x,2)
  return(ac[1])
}

#' @name f.partial.autocorrelation.lag2.2nd.val
#' @param x class: vector, data from dplyr %>%
#' @export
f.partial.autocorrelation.lag2.2nd.val <- function(x) {
  ac <- f.partial.autocorrelation(x,2)
  return(ac[2])
}