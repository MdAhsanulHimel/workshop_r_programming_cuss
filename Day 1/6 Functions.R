
# function

inch.to.cm <- function(x) {
  cm <- x * 2.54
  return(cm)
}
inch.to.cm(x = 10)
inch.to.cm(10)

find_mean <- function(x){
  vac_tot <- sum(x)
  vac_len <- length(x)
  vac_mean <- vac_tot / vac_len
  return(vac_mean)
}

find_mean(c(10,12,14,15,9,11))
mean(c(10,12,14,15,9,11))


mean(c(10,12,14,15,NA,11))
mean(c(10,12,14,15,NA,11), na.rm = TRUE)
find_mean(c(10,12,14,15,NA,11), na.rm = TRUE)

find_mean <- function(x, ...){
  vac_tot <- sum(x, ...)           # total of non-missing values
  vac_len <- sum(!is.na(x))        # number of non-missing observations
  vac_mean <- vac_tot / vac_len    # calculate mean
  return(vac_mean)
}
