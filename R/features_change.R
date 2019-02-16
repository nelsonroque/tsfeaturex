#' A Time-Series Feature Extraction Package
#'

#' @name f.mssd.lag1
#' @param x class: vector, data from dplyr %>%
#' @return Returns the MSSD, lag1; Von Neuman et al. (1941) discussed the Mean Square of Successive Differences as a measure of variability that takes into account gradual shifts in mean
#' @export
f.mssd.lag1 <- function(x) {
  x2 <- x[!is.na(x)]
  return(mssd(x2,lag=1))
}

#' @name f.mssd.lag2
#' @param x class: vector, data from dplyr %>%
#' @return Returns the MSSD, lag2; Von Neuman et al. (1941) discussed the Mean Square of Successive Differences as a measure of variability that takes into account gradual shifts in mean
#' @export
f.mssd.lag2 <- function(x) {
  x2 <- x[!is.na(x)]
  return(mssd(x2,lag=2))
}

#' @name f.mssd.lag3
#' @param x class: vector, data from dplyr %>%
#' @return Returns the MSSD, lag3; Von Neuman et al. (1941) discussed the Mean Square of Successive Differences as a measure of variability that takes into account gradual shifts in mean
#' @export
f.mssd.lag3 <- function(x) {
  x2 <- x[!is.na(x)]
  return(mssd(x2,lag=3))
}

#' @name f.mean.change
#' @param x class: vector, data from dplyr %>%
#' @return Returns the mean over the absolute differences between subsequent time series values which is
#' @export
f.mean.change <- function(x) {
  return(mean(abs(x-lag(x)),na.rm=T))
}

#' @name f.median.change
#' @param x class: vector, data from dplyr %>%
#' @return Returns the median over the absolute differences between subsequent time series values which is
#' @export
f.median.change <- function(x) {
  return(median(abs(x-lag(x)),na.rm=T))
}

#' @name f.max.change
#' @param x class: vector, data from dplyr %>%
#' @return Returns the max over the absolute differences between subsequent time series values which is
#' @export
f.max.change <- function(x) {
  return(max(abs(x-lag(x)),na.rm=T))
}

#' @name f.min.change
#' @param x class: vector, data from dplyr %>%
#' @return Returns the min over the absolute differences between subsequent time series values which is
#' @export
f.min.change <- function(x) {
  return(min(abs(x-lag(x)),na.rm=T))
}

#' @name f.sum.change
#' @param x class: vector, data from dplyr %>%
#' @return Returns the sum over the absolute differences between subsequent time series values which is
#' @export
f.sum.change <- function(x) {
  return(sum(abs(x-lag(x)),na.rm=T))
}

#' @name prob.acute.change.1
#' @param x class: vector, data from dplyr %>%
#' @return Returns the probability of acute change (threshold = 0.1)
#' @export
f.prob.acute.change.1 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.1,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}

#' @name prob.acute.change.2
#' @param x class: vector, data from dplyr %>%
#' @return Returns the probability of acute change (threshold = 0.2)
#' @export
f.prob.acute.change.2 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.2,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}

#' @name prob.acute.change.3
#' @param x class: vector, data from dplyr %>%
#' @return Returns the probability of acute change (threshold = 0.3)
#' @export
f.prob.acute.change.3 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.3,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}

#' @name prob.acute.change.4
#' @param x class: vector, data from dplyr %>%
#' @return Returns the probability of acute change (threshold = 0.4)
#' @export
f.prob.acute.change.4 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.4,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}

#' @name prob.acute.change.5
#' @param x class: vector, data from dplyr %>%
#' @return Returns the probability of acute change (threshold = 0.5)
#' @export
f.prob.acute.change.5 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.5,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}

#' @name prob.acute.change.6
#' @param x class: vector, data from dplyr %>%
#' @return Returns the probability of acute change (threshold = 0.6)
#' @export
f.prob.acute.change.6 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.6,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}

#' @name prob.acute.change.7
#' @param x class: vector, data from dplyr %>%
#' @return Returns the probability of acute change (threshold = 0.7)
#' @export
f.prob.acute.change.7 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.7,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}

#' @name prob.acute.change.8
#' @param x class: vector, data from dplyr %>%
#' @return Returns the probability of acute change (threshold = 0.8)
#' @export
f.prob.acute.change.8 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.8,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}

#' @name prob.acute.change.9
#' @param x class: vector, data from dplyr %>%
#' @return Returns the probability of acute change (threshold = 0.9)
#' @export
f.prob.acute.change.9 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.9,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}

#' @name prob.acute.change.95
#' @param x class: vector, data from dplyr %>%
#' @return Returns the probability of acute change (threshold = 0.95)
#' @export
f.prob.acute.change.95 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.95,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}

#' @name prob.acute.change.99
#' @param x class: vector, data from dplyr %>%
#' @return Returns the probability of acute change (threshold = 0.99)
#' @export
f.prob.acute.change.99 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.99,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}