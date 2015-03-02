

rankall <- function(outcome, num = "best") {
        ## Read outcome data
        outdat <- read.csv('outcome-of-care-measures.csv', header = T,
                           stringsAsFactors = FALSE)
        statechk <- outdat[, c(7)]
        outchk <- c('heart attack', 'heart failure', 'pneumonia')
        
        ## Check that state and outcome are valid
        # if(!(state %in% statechk))
        #        stop('invalid state')
        if(!(outcome %in% outchk))
                stop('invalid outcome')
        ## For each state, find the hospital of the given rank
        name <- colnames(outdat[2])
        if(outcome == 'heart attack'){
                rate <- colnames(outdat[11])
        } else if(outcome == 'heart failure'){
                rate <- colnames(outdat[17])
        } else {
                rate <- colnames(outdat[23])
        }
        
        chk <- outdat[, c('State', name, rate)]
        names(chk) <- c('state', 'hospital', 'rate')
        result <- lapply(split(chk, chk$state ), function(dat1){
                dat1[rate] <- as.numeric(dat1[, c(3)])
                dat1[name] <- as.character(dat1[, c(2)])
                datsort <- dat1[order(dat1[rate], dat1[name]), ]
                datsort <- datsort[complete.cases(datsort), ]
        }
        )
        
        
        if(num == 'worst'){
                
                hospital <- c()
                state <- c()
                for (i in 1:(length(result))){
                        num <- nrow(result[[i]])
                        hospital <- append(hospital,as.character(result[[i]]$hospital[num]))
                        state <- append(state, names(result[i]))
                }
                return(data.frame(hospital, state))
                
        } else if(num == 'best'){
                num <- 1
        } else if(!(num %in% c(1:nrow(datsort)))){
                return(NA)
        } else{
        }
        
        hospital <- c()
        state <- c()
        for (i in 1:(length(result))){
                hospital <- append(hospital, as.character(result[[i]]$hospital[num]))
                state <- append(state, names(result[i]))
        }
        return(data.frame(hospital, state))
        
}
