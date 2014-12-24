complete <- function(directory, id = 1:332) {
    vlen <- length(id)
    nobs <- vector("numeric", length = vlen)
    for(i in 1:vlen) {
        fname <- paste(paste(directory, formatC(id[i], 2, format ="d", flag = "0") , sep = "/"), "csv", sep = ".")
        csvdata <- read.csv(fname)
        good <- complete.cases(csvdata)
        nobs[i] <- nrow(csvdata[good,])
    }
    data.frame(id, nobs)
}
