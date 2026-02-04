****************************************************
* Project: Occupational Injury Rates and Labor Markets
* Author: Lindsey McDaniel
* Date: February 2026
*
* DATASETS:
* 1. BLS Survey of Occupational Injuries and Illnesses (SOII), 2024
*    Source: U.S. Bureau of Labor Statistics
* 2. State Unemployment Rates, 2024
*    Source: BLS Local Area Unemployment Statistics (via FRED)
****************************************************
 
import delimited https://https://drive.google.com/uc?export=download&id=17LT9VIo073pp1gbG7jHns4rm4mRc-igl///
 "injury_rates_2024.csv", ///
clear varnames(1) rowrange(3), clear

*rename variables
rename area state_name
*label variables 
label variable state_name "U.S. STATES"
destring privateindustry, replace force

describe
summarize privateindustry
tabulate state_name
*allowed me to see if categories were duplicated, spot any missing values, and verify the units of analysis which were the states and injury reports

save "injury_rates_2024.dta", replace

*second data set 
import delimited https:// drive.google.com/uc?export=download&id=17LT9VIo073pp1gbG7jHns4rm4mRc-igl///
 "number_unemployment_2025.csv", ///
clear varnames(1) rowrange(3), clear
rename unemployedpersonsperjobopeningra unemployed
save "number_unemployment_2025.dta", replace
*MERGE
use "injury_rates_2024.dta", clear
merge m:1 unemployed using "number_unemployment_2025.dta"
