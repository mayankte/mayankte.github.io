## Reads multiple user identified csv files from a given directory,  and calculates mean values as per user 
## specified Vector

pollutantmean <- function(directory = "specdata" 
                          ,pollutant='sulfate',id = 1:332){
        
        pwd <- getwd()
        setwd(directory)
        sm <- 0
        len <- 0
                for (i in id){
                if(as.integer(i/10) == 0){
                        name <- paste('00',i,'.csv',sep="")
                } else if (as.integer(i/100) == 0){
                        name <- paste('0',i,'.csv',sep="")
                } else {
                        name <- paste(i,'.csv',sep="")
                }
        df <- read.csv(name, header=T, comment.char="#", stringsAsFactors=FALSE)
        na <- is.na(df[pollutant])
        df <- df[!na, c(pollutant)]
        len <- len + length(df)
        sm <- sm + sum(df)
                }
        setwd(pwd)
        return(sm/len)
}


## TestCase
pollutantmean("specdata", "nitrate", 70:72)
        
