pollutantmean <- function(directory, pollutant, id = 1:332) {
    vlen <- length(id)    
    allpolldata <- vector(mode="list", vlen)
    for(i in 1:vlen) {
        fname <- paste(paste(directory, formatC(id[i], 2, format ="d", flag = "0") , sep = "/"), "csv", sep = ".")        
        csvdata <- read.csv(fname)
        allpolldata[[i]] <- csvdata[,pollutant]
    }
    mean(c(allpolldata, recursive = TRUE), na.rm = TRUE)    
}
