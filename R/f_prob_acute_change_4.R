#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name prob.acute.change.4
#' @param x class: vector, data from dplyr
#' @return Returns the probability of acute change (threshold = 0.40)
#' @export
f.prob.acute.change.4 <- function(x) {
  data.norm.x <- normalize(x)
  data.zoo <- zoo(data.norm.x)                          #this converts to zoo object
  data.zoo.lag <- stats::lag(data.zoo,-1,na.pad = TRUE) #this creates the lag variable
  ac = ifelse((data.zoo-data.zoo.lag) >= 0.40,1,0)  #this calculates the binary acute change (deals with NA)
  denominator<-sum(!is.na(ac))         #this computes the number of non-missing elements (denominator)
  pac <- sum(ac/denominator,na.rm=TRUE)     #this calculates the pac
  return(pac)
}