
best <- function(state, outcome) {
        ## Read outcome data
        outdat <- read.csv('outcome-of-care-measures.csv', header = T,
                           stringsAsFactors = FALSE)
        statechk <- outdat[, c(7)]
        outchk <- c('heart attack', 'heart failure', 'pneumonia')
        
        
        ## Check that state and outcome are valid
        if(!(state %in% statechk))
                stop('invalid state')
        if(!(outcome %in% outchk))
                stop('invalid outcome')
        
        ## Return hospital name in that state with lowest 30-day death
        name <- colnames(outdat[2])
        if(outcome == 'heart attack'){
                rate <- colnames(outdat[11])
        } else if(outcome == 'heart failure'){
                rate <- colnames(outdat[17])
        } else {
                rate <- colnames(outdat[23])
        }
        
        dat <- outdat[complete.cases(outdat[ outdat$State == state, c(rate)]), c('State',name,rate)]
        dat1 <- dat[which(dat$State == state), ]
        dat1[rate] <- as.numeric(dat1[, c(3)])
        dat1[name] <- as.character(dat1[, c(2)])
        datsort <- dat1[order(dat1[rate], dat1[name]), ]  
        print(as.character(datsort[1 ,2]))
}
