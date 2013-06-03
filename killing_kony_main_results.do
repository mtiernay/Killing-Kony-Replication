***
* This .do file replicates the results from "Killing Kony: Leadership Change and Civil War Termination" 
* in the Journal of Conflict Resolution

clear
set more off

use "killing_kony.dta"






***************************************************************************
*Models 1-4 in Table 1

*1 year
stcox  res1 ris1 rss1 time_regular1 iss1 tc strong parity lpw time_lpw ef ethnic lngdppc demdum act2 time_act2 lnpop , nohr cluster(confid)

*2 years
stcox  res2 ris2 rss2 time_regular2 iss2 tc strong parity lpw time_lpw ef ethnic lngdppc demdum act2 time_act2 lnpop , nohr cluster(confid)

*3 years
stcox  res3 ris3 rss3 time_regular3 iss3 tc strong parity lpw time_lpw ef ethnic lngdppc demdum act2 time_act2 lnpop , nohr cluster(confid)

*4 years
stcox  res4 ris4 rss4 time_regular4 iss4 tc strong parity lpw time_lpw ef ethnic lngdppc demdum act2 time_act2 lnpop , nohr cluster(confid)







***************************************************************************
* Table 4

* Model 1 in Table 4: Leader culpability
stcox founder culpable tc strong parity lpw ef ethnic lngdppc demdum act2 lnpop , nohr cluster(confid)

* Model 2 in Table 4: The effects of W
stcox res2 ris2 rss2 iss2 W_d W_rss2 W_iss2 tc strong parity lpw time_lpw ef ethnic lngdppc act2 time_act2 lnpop  , nohr cluster(confid)








***************************************************************************
* Figure 1 uses the program nonph_graph.  The program is available at:
* https://github.com/mtiernay/nonph_graph/blob/master/nonph_graph_121012.ado
stcox  res1 ris1 rss1 time_regular1 iss1 tc strong parity lpw time_lpw ef ethnic lngdppc demdum act2 time_act2 lnpop , nohr cluster(confid)
nonph_graph combined_coefficient










***************************************************************************
* Matching
* The matching procedure is done in R.  See kony_matching.R for the procedure.
* kony_matching.R uses the dataset leaders_matching.dta, which is the killing_kony.dta
* file with all observations removed that have missing values on the matched covariates.
* kony_matching.R produces the 4 matched datasets used below



*Rebel internal change, 1 year lag
use "match_reb_int_1.dta", clear
stset conflict_length [pweight = weights], failure(failure=1) 
stcox  regular_state_shock irregular_state_shock match_reb_int_1 rebel_external_shock tc strong parity lpw ef ethnic lngdppc demdum act2 lnpop , nohr


*Rebel external change, 1 year lag
use "match_reb_ex_1.dta", clear
stset conflict_length [pweight = weights], failure(failure=1)
stcox  regular_state_shock irregular_state_shock rebel_internal_shock match_reb_ex_1 tc strong parity lpw ef ethnic lngdppc demdum act2 lnpop , nohr


*Government regular change, 1 year lag
use "match_gov_reg_1.dta", clear
stset conflict_length [pweight = weights], failure(failure=1)
stcox  match_gov_reg_1 irregular_state_shock rebel_internal_shock rebel_external_shock tc strong parity lpw ef ethnic lngdppc demdum act2 lnpop , nohr


*Government regular change, 1 year lag
use "match_gov_irreg_1.dta", clear
stset conflict_length [pweight = weights], failure(failure=1)
stcox  regular_state_shock match_gov_irreg_1 rebel_internal_shock rebel_external_shock tc strong parity lpw ef ethnic lngdppc demdum act2 lnpop , nohr


