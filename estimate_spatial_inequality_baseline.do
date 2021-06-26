import excel "C:\Users\Jesson Pagaduan\Google Drive\regional_inequality\data\scratch\ntl_per_capita.xlsx", sheet("Sheet1") firstrow

log using "C:\Users\Jesson Pagaduan\Google Drive\regional_inequality\results\spatial_inequality\baseline.log"

forvalues i = 2000/2018 {
display(`i')
ineqdeco ntl_pc [aw=gpw_sum_ipo_share] if year==`i', bygroup(region_id)
}

log close
