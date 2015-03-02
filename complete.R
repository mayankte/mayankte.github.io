complete <- function(directory = 'specdata',id = 1:332){
        pwd <- getwd()
        setwd(directory)
        idname <- c()
        nobs <- c()
        for (i in id){
                if(as.integer(i/10) == 0){
                        name <- paste('00',i,'.csv',sep="")
                } else if(as.integer(i/100) == 0){
                        name <- paste('0',i,'.csv',sep="")
                } else {
                        name <- paste(i,'.csv',sep="")
                } 
                df <- read.csv(name, comment.char="#", header = T, 
                               stringsAsFactors=FALSE)
                idname <- append(idname,i)
                nobs <- append(nobs, length(df[complete.cases(df), c(1)]))       
                
        }
        
        setwd(pwd)
        data <- data.frame(id = idname, nobs = nobs)
        return(data)
}
