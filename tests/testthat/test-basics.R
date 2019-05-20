# CREATE DATA ####
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# for reproducibility of this example
set.seed(516)

# create test data
dat <- data.frame(expand.grid(day=c(1:14),id=c(1:1)))
dat$y <- rnorm(nrow(dat),5,1.5)
dat$y[1:3] <- NA # introduce NAs to check

# run function
out.list <- extract_features(df=dat, group_var="id", value_var="y", features="all", return_timing = F, verbose=F)

# convert list to data.frame (MapReduce)
final.df <- features_to_df(out.list, data.format="wide", group_var = "id")

# get feature correlations
cor.df <- feature_correlations(final.df, data.format="wide", id_var = "id")

# autocorrelation features
acorr <- final.df %>% select(contains("autocorrelation")) %>% ncol(.)

# quantile features
quantiles <- final.df %>% select(contains("quantile")) %>% ncol(.)

# prob. acute change features
pac <- final.df %>% select(contains("prob.acute")) %>% ncol(.)

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

test_that("correct missing data count returned", {
  expect_equal(final.df$f.count_NA_y[1], 3)
})

test_that("all features are calculated", {
  expect_equal(length(names(final.df)), 84)
})

test_that("all quantile features are calculated", {
  expect_equal(quantiles, 11)
})

test_that("all autocorrelation features are calculated", {
  expect_equal(acorr, 12)
})

test_that("all probability of acute change features are calculated", {
  expect_equal(pac, 11)
})