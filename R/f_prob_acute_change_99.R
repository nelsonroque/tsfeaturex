#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name prob.acute.change.99
#' @param x class: vector, data from dplyr
#' @return Returns the probability of acute change (threshold = 0.99)
#' @export
f.prob.acute.change.99 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE)
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.99,1,0)
  denominator<-sum(!is.na(ac))
  pac <- sum(ac/denominator,na.rm=TRUE)
  return(pac)
}