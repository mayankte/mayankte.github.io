corr <- function(directory = 'specdata' , threshold = 0) {
        pwd <- getwd()
        setwd(directory)
        vc <- c()
        vc <- as.numeric(vc)
        for( i in seq_along(dir())){
                if(as.integer(i/10) == 0){
                        name <- paste('00',i,'.csv',sep="")
                } else if(as.integer(i/100) == 0){
                        name <- paste('0',i,'.csv',sep="")
                } else {
                        name <- paste(i,'.csv',sep="")
                } 
                df <- read.csv(name, comment.char="#", header = T, 
                               stringsAsFactors=FALSE)
                if(length(df[complete.cases(df), c(1)]) > threshold){
                        df <- df[complete.cases(df), ]
                        vc <- append(vc,cor(df$sulfate,df$nitrate))
                }
                
                
        }
        
        setwd(pwd)
        return(vc)
        
}
