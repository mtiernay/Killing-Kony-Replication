# The purpose of this file is create a 
# dataset on matched treatments

#setwd()
rm(list = ls(all = TRUE))


library(foreign)
library(MatchIt)
library(Matching)


############################################################################
#Read Stata Data File                                                      #    
#################################################################s###########

leaders <- read.dta("/Users/tiernay/Desktop/leaders/leaders_matching.dta")
attach(leaders)


##############################
# Rebel internal shock, 1 year
out.reb.int.1 <- matchit(match_reb_int_1 ~ rebel_external_shock + regular_state_shock+  irregular_state_shock +
					lntimeatstate + tc + strong + parity + lpw + ef + ethnic + lngdppc + demdum + act2 + lnpop,
					data= leaders, method="nearest", replace=TRUE, ratio=2)	

# Overview of the match
#out.reb.int.1
#out.reb.int.1$match.matrix

# Check for balance
#summary(out.reb.int.1)
#plot(out.reb.int.1)

# Generate dataset of matched results and convert into Stata datafile 
data.out.reb.int.1 <- match.data(out.reb.int.1)
write.dta(data.out.reb.int.1,file="/Users/tiernay/Desktop/leaders/match_reb_int_1.dta")



##############################
# Rebel external shock, 1 year
out.reb.ex.1 <- matchit(match_reb_ex_1 ~ rebel_internal_shock + regular_state_shock+  irregular_state_shock +
					lntimeatstate + tc + strong + parity + lpw + ef + ethnic + lngdppc + demdum + act2 + lnpop,
					data= leaders, method="nearest", replace=TRUE, ratio=2)	

# Overview of the match
#out.reb.ex.1
#out.reb.ex.1$match.matrix

# Check for balance
#summary(out.reb.ex.1)
#plot(out.reb.ex.1)

# Generate dataset of matched results and convert into Stata datafile 
data.out.reb.ex.1 <- match.data(out.reb.ex.1)
write.dta(data.out.reb.ex.1,file="/Users/tiernay/Desktop/leaders/match_reb_ex_1.dta")





##############################
# Government regular shock, 1 year
out.gov.reg.1 <- matchit(match_gov_reg_1 ~ rebel_internal_shock + rebel_external_shock +  irregular_state_shock +
					lntimeatstate + tc + strong + parity + lpw + ef + ethnic + lngdppc + demdum + act2 + lnpop,
					data= leaders, method="nearest", replace=TRUE, ratio=2)	

# Overview of the match
#out.gov.reg.1
#out.gov.reg.1$match.matrix

# Check for balance
#summary(out.gov.reg.1)
#plot(out.gov.reg.1)

# Generate dataset of matched results and convert into Stata datafile 
data.out.gov.reg.1 <- match.data(out.gov.reg.1)
write.dta(data.out.gov.reg.1,file="/Users/tiernay/Desktop/leaders/match_gov_reg_1.dta")









##############################
# Government irregular shock, 1 year
out.gov.irreg.1 <- matchit(match_gov_irreg_1 ~ rebel_internal_shock + rebel_external_shock +  regular_state_shock +
					lntimeatstate + tc + strong + parity + lpw + ef + ethnic + lngdppc + demdum + act2 + lnpop,
					data= leaders, method="nearest", replace=TRUE, ratio=2)	

# Overview of the match
#out.gov.irreg.1
#out.gov.irreg.1$match.matrix

# Check for balance
#summary(out.gov.irreg.1)
#plot(out.gov.irreg.1)

# Generate dataset of matched results and convert into Stata datafile 
data.out.gov.irreg.1 <- match.data(out.gov.irreg.1)
write.dta(data.out.gov.irreg.1,file="/Users/tiernay/Desktop/leaders/match_gov_irreg_1.dta")



