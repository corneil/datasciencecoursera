corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    id <- c(1:332)
    vlen <- length(id)
    cordata <- vector("numeric", length = vlen)
    for(i in 1:vlen) {
        fname <- paste(paste(directory, formatC(id[i], 2, format ="d", flag = "0") , sep = "/"), "csv", sep = ".")
        csvdata <- read.csv(fname)
        good <- complete.cases(csvdata)
        gooddata <- csvdata[good,]
        if(nrow(gooddata) >= threshold) {
            cordata[i] <- cor(gooddata[,"sulfate"],gooddata[,"nitrate"])
        } else {
            cordata[i] <- NA
        }
    }   
    cordata[!is.na(cordata)]
}
