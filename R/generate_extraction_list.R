#' A Time-Series Feature Extraction Package
#'
#' @param feature_category class: string; options: 'all', 'simple', 'count', 'sigma', change', 'meta', 'distribution' , 'location'
#' @examples
#' generate_extraction_list(feature_category="simple")
#' generate_extraction_list(feature_category="all")
#' @export

generate_extraction_list <- function(feature_category) {

  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # simple features (similar to psych::describe())
  simple.features <- c('f.min','f.mean','f.median','f.max','f.sum','f.IQR','f.sd',
                       'f.variance','f.coeff.variation','f.range','f.sd.greater.range')
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # count-based features
  count.features <- c('f.count.above.mean','f.count.below.mean',
                      'f.count.negative','f.count.positive',
                      'f.count.below.1sigma','f.count.above.1sigma',
                      'f.count.below.2sigma','f.count.above.2sigma',
                      'f.count.below.3sigma','f.count.above.3sigma')
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # features based on change from t to lag(t,1)
  change.features <- c('f.entropy','f.mssd.lag1','f.mssd.lag2','f.mssd.lag3',
                       'f.mean.change','f.median.change',
                       'f.min.change','f.max.change','f.sum.change',
                       'f.prob.acute.change.1','f.prob.acute.change.2','f.prob.acute.change.3',
                       'f.prob.acute.change.4','f.prob.acute.change.5','f.prob.acute.change.6',
                       'f.prob.acute.change.7','f.prob.acute.change.8','f.prob.acute.change.9',
                       'f.prob.acute.change.95','f.prob.acute.change.99')
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # meta-features (related to dataset missingness)
  meta.features <- c('f.count_NA','f.length',
                     'f.perc.missing','f.prop.missing',
                     'f.ratio.unique.values','f.perc.unique.values')
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # distribution-based features
  distribution.features <- c('f.kurtosis','f.skew',
                             'f.quantile_10','f.quantile_25','f.quantile_30','f.quantile_40','f.quantile_50',
                             'f.quantile_60','f.quantile_70','f.quantile_75','f.quantile_80','f.quantile_90','f.quantile_95')
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # location features
  location.features <- c('f.first.min','f.first.max',
                         'f.find.peaks','f.count.peaks')
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # sigma-rule based features - inspired by anomaly detection
  sigma.features <- c('f.which.below.1sigma','f.which.above.1sigma',
                      'f.which.below.2sigma','f.which.above.2sigma',
                      'f.which.below.3sigma','f.which.above.3sigma')
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # must pass in list of lists with inner lists in order of function
  ts.features <- c('f.autocorrelation.lag1.string','f.autocorrelation.lag1.1st.val','f.autocorrelation.lag1.2nd.val',
                   'f.autocorrelation.lag2.string','f.autocorrelation.lag2.1st.val','f.autocorrelation.lag2.2nd.val',
                   'f.partial.autocorrelation.lag1.string','f.partial.autocorrelation.lag1.1st.val','f.partial.autocorrelation.lag1.2nd.val',
                   'f.partial.autocorrelation.lag2.string','f.partial.autocorrelation.lag2.1st.val','f.partial.autocorrelation.lag2.2nd.val')
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # will get around to supporting these
  #experimental.features <- c('f.ts.seasonality','f.ts.trend','f.ts.random','f.friedrich.drift','f.friedrich.diffusion','f.friedrich.Kramers.Moyal')
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # for all fft
  #fft.features <- c()
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # combine feature list
  all.features <- c(simple.features,
                    count.features,
                    change.features,
                    meta.features,
                    distribution.features,
                    location.features,
                    sigma.features,
                    #experimental.features,
                    #fft.features,
                    ts.features)
  
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  # determine features to calculate for a given run
  if(feature_category == 'all') {
    current.features <- all.features
  } else {
    if(feature_category == 'simple'){
      current.features <- simple.features
    } else {
      if(feature_category == 'distribution'){
        current.features <- distribution.features
      } else {
        if(feature_category == 'count'){
          current.features <- count.features
        } else {
          if(feature_category == 'location'){
            current.features <- location.features
          } else {
            if(feature_category == 'meta'){
              current.features <- meta.features
            } else {
              if(feature_category == 'change'){
                current.features <- change.features
              } else {
                if(feature_category == 'ts'){
                  current.features <- ts.features
                } else {
                  if(feature_category == 'sigma'){
                    current.features <- sigma.features
                  } else {
                    if(feature_category == 'fft'){
                      current.features <- fft.features
                    } else {
                        current.features <- features
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  return(current.features)
}