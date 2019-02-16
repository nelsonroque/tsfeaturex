#' A Time-Series Feature Extraction Package
#'
#' UTILITY FUNCTIONS ####
#' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @name normalize transforms data to 0-1
#' @param x class: vector, data from dplyr %>%
#' @export
normalize <- function(x) {
  v <- (x-min(x))/(max(x)-min(x))
  return(v)
}

#' SIMPLE FEATURES ####
#' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#' @name f.min calculate min of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.min <- function(x) {
  return(min(x,na.rm=T))
}

#' @name f.max calculate max of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.max <- function(x) {
  return(max(x,na.rm=T))
}

#' @name f.median calculate median of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.median <- function(x) {
  return(median(x,na.rm=T))
}

#' @name f.mean calculate median of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.mean <- function(x) {
  return(mean(x,na.rm=T))
}

#' @name f.sum calculate sum of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.sum <- function(x) {
  return(sum(x,na.rm=T))
}

#' @name f.sd calculate sd of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.sd <- function(x) {
  return(sd(x,na.rm=T))
}

#' @name f.IQR calculate IQR of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.IQR <- function(x) {
  return(IQR(x,na.rm=T))
}

#' @name f.variance calculate variance of x
#' @param x class: vector, data from dplyr %>%
#' @export
f.variance <- function(x) {
  return(sd(x,na.rm=T)**2)
}

#' @name f.coeff.variation
#' @param x class: vector, data from dplyr %>%
#' @export
f.coeff.variation <- function(x) {
  return(sd(x,na.rm=T)/mean(x,na.rm=T))
}

#' @name f.range
#' @param x class: vector, data from dplyr %>%
#' @export
f.range <- function(x) {
  r = range(x,na.rm=T)
  rg = r[2] - r[1]
  return(rg)
}

#' BINARY FEATURES ####
#' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#' @name f.sd.greater.range
#' @param x class: vector, data from dplyr %>%
#' @export
f.sd.greater.range <- function(x) {
  sd_ <- sd(x,na.rm=T)
  sd.greater.range <- sd_ > f.range(x)
  return(sd.greater.range)
}

#' COUNT-BASED FEATURES ####
#' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#' @name f.count.negative
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.negative <- function(x) {
  return(sum(x < 0,na.rm=T))
}

#' @name f.count.positive
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.positive <- function(x) {
  return(sum(x > 0,na.rm=T))
}

#' @name f.count.above.mean
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.above.mean <- function(x) {
  m <- mean(x,na.rm=T)
  return(sum(x > m,na.rm=T))
}

#' @name f.count.below.mean
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.below.mean <- function(x) {
  m <- mean(x,na.rm=T)
  return(sum(x < m,na.rm=T))
}

#' @name f.count.above.1sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.above.1sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd1 <- 1 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd1
  return(sum(x > threshold))
}

#' @name f.count.below.1sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.below.1sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd1 <- 1 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd1
  return(sum(x < threshold))
}

#' @name f.count.above.2sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.above.2sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd2 <- 2 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd2
  return(sum(x > threshold))
}

#' @name f.count.below.1sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.below.2sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd2 <- 2 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd2
  return(sum(x < threshold))
}

#' @name f.count.above.3sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.above.3sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd3 <- 3 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd3
  return(sum(x > threshold))
}

#' @name f.count.below.3sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.count.below.3sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd3 <- 3 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd3
  return(sum(x < threshold))
}

#' CHANGE-BASED FEATURES ####
#' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#' @name f.mssd.lag1
#' @param x class: vector, data from dplyr %>%
#' @export
#	Returns the MSSD, lag1; Von Neuman et al. (1941) discussed the Mean Square of Successive Differences as a measure of variability that takes into account gradual shifts in mean
f.mssd.lag1 <- function(x) {
  x2 <- x[!is.na(x)]
  return(mssd(x2,lag=1))
}

#' @name f.mssd.lag2
#' @param x class: vector, data from dplyr %>%
#' @export
#	Returns the MSSD, lag2; Von Neuman et al. (1941) discussed the Mean Square of Successive Differences as a measure of variability that takes into account gradual shifts in mean
f.mssd.lag2 <- function(x) {
  x2 <- x[!is.na(x)]
  return(mssd(x2,lag=2))
}

#' @name f.mssd.lag3
#' @param x class: vector, data from dplyr %>%
#' @export
#	Returns the MSSD, lag3; Von Neuman et al. (1941) discussed the Mean Square of Successive Differences as a measure of variability that takes into account gradual shifts in mean
f.mssd.lag3 <- function(x) {
  x2 <- x[!is.na(x)]
  return(mssd(x2,lag=3))
}

#' @name f.mean.change
#' @param x class: vector, data from dplyr %>%
#' @export
#	Returns the mean over the absolute differences between subsequent time series values which is
f.mean.change <- function(x) {
  return(mean(abs(x-lag(x)),na.rm=T))
}

#' @name f.median.change
#' @param x class: vector, data from dplyr %>%
#' @export
#	Returns the median over the absolute differences between subsequent time series values which is
f.median.change <- function(x) {
  return(median(abs(x-lag(x)),na.rm=T))
}

#' @name f.max.change
#' @param x class: vector, data from dplyr %>%
#' @export
#	Returns the max over the absolute differences between subsequent time series values which is
f.max.change <- function(x) {
  return(max(abs(x-lag(x)),na.rm=T))
}

#' @name f.min.change
#' @param x class: vector, data from dplyr %>%
#' @export
#	Returns the min over the absolute differences between subsequent time series values which is
f.min.change <- function(x) {
  return(min(abs(x-lag(x)),na.rm=T))
}

#' @name f.sum.change
#' @param x class: vector, data from dplyr %>%
#' @export
#	Returns the sum over the absolute differences between subsequent time series values which is
f.sum.change <- function(x) {
  return(sum(abs(x-lag(x)),na.rm=T))
}

#' @name prob.acute.change.1
#' @param x class: vector, data from dplyr %>%
#' @export
#	Returns the probability of acute change (threshold = 0.1)
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
#' @export
#	Returns the probability of acute change (threshold = 0.2)
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
#' @export
#	Returns the probability of acute change (threshold = 0.3)
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
#' @export
#	Returns the probability of acute change (threshold = 0.4)
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
#' @export
#	Returns the probability of acute change (threshold = 0.5)
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
#' @export
#	Returns the probability of acute change (threshold = 0.6)
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
#' @export
#	Returns the probability of acute change (threshold = 0.7)
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
#' @export
#	Returns the probability of acute change (threshold = 0.8)
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
#' @export
#	Returns the probability of acute change (threshold = 0.9)
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
#' @export
#	Returns the probability of acute change (threshold = 0.95)
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
#' @export
#	Returns the probability of acute change (threshold = 0.99)
f.prob.acute.change.99 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.99,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}

#' META-DATASET FEATURES ####
#' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#' @name f.length calculate length of x
#' @param x class: vector, data from dplyr %>%
#' @export
#' Returns the length of observations
f.length <- function(x) {
  return(length(x))
}

#' @name f.count_NA
#' @param x class: vector, data from dplyr %>%
#' @export
#' custom function to count NAs
f.count_NA <- function(x) {
  return(sum(is.na(x)))
}

#' @name f.perc.unique.values
#' @param x class: vector, data from dplyr %>%
#' @export
#' Returns the ratio of unique values, that are present in the time series more than once.
f.perc.unique.values <- function(x) {
  return((length(unique(x))/length(x))*100)
}

#' @name f.ratio.unique.values
#' @param x class: vector, data from dplyr %>%
#' @export
#' Returns the ratio of unique values, that are present in the time series more than once.
f.ratio.unique.values <- function(x) {
  return((length(unique(x))/length(x)))
}

#' @name f.perc.missing
#' @param x class: vector, data from dplyr %>%
#' @export
#' percentage missing data
f.perc.missing <- function(x) {
  perc.missing <- (sum(is.na(x))/length(x))*100
  return(perc.missing)
}

#' @name f.prop.missing
#' @param x class: vector, data from dplyr %>%
#' @export
#' percentage missing data
f.prop.missing <- function(x) {
  prop.missing <- (sum(is.na(x))/length(x))
  return(prop.missing)
}

#' ENTROPY-BASED FEATURES ####
#' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#' @name f.entropy
#' @param x class: vector, data from dplyr %>%
#' @export
#	Returns Shannon Entropy
f.entropy <- function(x) {
  x2 <- x[!is.na(x)]
  x3 <- table(x2)
  return(entropy::entropy(x3))
}

#' DISTRIBUTION-BASED FEATURES ####
#' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

#' LOCATION-BASED FEATURES ####
#' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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

#' SIGMA-RULE-BASED FEATURES ####
#' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#' @name f.which.below.1sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.below.1sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd1 <- 1 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd1
  return(paste0(which(x < threshold),collapse=','))
}

#' @name f.which.above.1sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.above.1sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd1 <- 1 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd1
  return(paste0(which(x > threshold),collapse=','))
}

#' @name f.which.below.2sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.below.2sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd2 <- 2 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd2
  return(paste0(which(x < threshold),collapse=','))
}

#' @name f.which.above.2sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.above.2sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd2 <- 2 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd2
  return(paste0(which(x > threshold),collapse=','))
}

#' @name f.which.below.3sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.below.3sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd3 <- 3 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m - sd3
  return(paste0(which(x < threshold),collapse=','))
}

#' @name f.which.above.3sigma
#' @param x class: vector, data from dplyr %>%
#' @export
f.which.above.3sigma <- function(x) {
  #' inspiration: https://anomaly.io/anomaly-detection-normal-distribution/
  sd3 <- 3 * sd(x,na.rm=T)
  m <- mean(x,na.rm=T)
  threshold = m + sd3
  return(paste0(which(x > threshold),collapse=','))
}


#' TIME-SERIES BASED FEATURES ####
#' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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