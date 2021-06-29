import excel "C:\Users\Jesson Pagaduan\Google Drive\regional_inequality\results\beta_convergence\beta_convergence.xlsx", sheet("Sheet1") firstrow

log using "C:\Users\Jesson Pagaduan\Google Drive\regional_inequality\results\beta_convergence\beta_convergence.log"

**Baseline

*Using linear regession to obtain beta coefficient
reg long_run_growth log_ntl_pc_2000, vce(robust)

*Calculate speed of convergence
. disp ln(1 + 18 * _b[log_ntl_pc_2000]) / 18

*Calculate half-life
. disp -ln(2) / ln(1 + _b[log_ntl_pc_2000])


*Use nonlinear regression
nl (long_run_growth = {tau} - (1 - exp(-{beta} * 18)) / 18 * log_ntl_pc_2000), vce(robust)

*Obstain speed of convergence, should be consistent
disp /beta

**Excluding Metro Manila

*Using linear regession to obtain beta coefficient
reg long_run_growth log_ntl_pc_2000 if region_id != 3, vce(robust)

*Calculate speed of convergence
. disp ln(1 + 18 * _b[log_ntl_pc_2000]) / 18

*Calculate half-life
. disp -ln(2) / ln(1 + _b[log_ntl_pc_2000])


*Use nonlinear regression
nl (long_run_growth = {tau} - (1 - exp(-{beta} * 18)) / 18 * log_ntl_pc_2000) if region_id != 3, vce(robust)

*Obstain speed of convergence, should be consistent
disp /beta

***Interestingly, even when I exclude Metro Manila cities from the sample, I get a
***consistent speed of convergence as well as half life. This is also in line with
***the finding that the share of variation in total inequality explained by
***between-group inequality has declined over time, while within-group inequality's
***importance overtook.

***This is crucial because between- and within-group inequality requires a different 
***set of policies.

log close
