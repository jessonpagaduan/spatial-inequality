*This do file

import excel "C:\Users\Jesson Pagaduan\Google Drive\regional_inequality\data\population\population_by_province_clean.xlsx", sheet("Sheet1") firstrow clear

*Linear interpolation (for missing values in 2001-2009, 2011-2014) and extrapolation (2016-2018)
bysort province: ipolate population year, gen(population_ipolate) epolate




export excel using "C:\Users\Jesson Pagaduan\Google Drive\regional_inequality\data\population\population_series.xlsx", firstrow(variables) replace
save "C:\Users\Jesson Pagaduan\Google Drive\regional_inequality\data\population\population_series.dta", replace
