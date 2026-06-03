*** CORRECT VARIABLES
gen primary = 0 
replace primary = 1 if Data=="Survey"
* Collapse the data to the paper level - FIGURE 2
gen Year_ = 1 if Year==2018
replace Year_ = 2 if Year==2019
replace Year_ = 3 if Year==2020
replace Year_ = 4 if Year==2021
replace Year_ = 5 if Year==2022
replace Year_ = 6 if Year==2023
replace Year_ = 7 if Year==2024
replace Year_ = 8 if Year==2025
replace Year_ = 9 if Year==2026
gen Year_sq = Year_*Year_

* FIGURE 2
preserve
collapse (mean) mean_effect = Effectsize (mean) mean_sample_size = Samplesize (mean) mean_Desv_s = Desv_s (mean) mean_year = Year (first) studylbl, by(Study)
meta set mean_effect mean_Desv_s,  random studylabel(studylbl)
meta forestplot, subgroup(mean_year)
restore

*** SET META ANALYSIS
meta set Effectsize Desv_s, studylabel(studylbl) random
meta summarize

* Table 3
meta bias, egger


* Table 4
*Step 1 - transform variables
gen Avscore_sq = Avscore*Avscore
encode Perf, gen(Perf_num)
encode Method, gen(Method_num)
encode Serv, gen(Serv_num)
encode IndCode1, gen(NACE_num)

*Step 2 - meta analysis - column 1
*xi: meta regress Year_ Year_sq  primary Avtop ib4.Perf_num
xi: meta regress Avscore Avscore_sq ib1.Perf_num ib2020.Year ib3.Method_num ib3.Serv_num ib1.NACE_num primary
outreg2 using table1.rtf, replace pdec(4) bdec(4) stats(coef se pval) ctitle(Meta-regress)

*Step 3 - do Figure to show Quadratic effect
meta regress c.Avscore##c.Avscore ///
    ib1.Perf_num ib2020.Year ib3.Method_num ///
    ib3.Serv_num ib1.NACE_num primary

	nlcom -_b[Avscore] / (2*_b[c.Avscore#c.Avscore])

margins, at(Avscore=(0(5)100)) atmeans

marginsplot, recast(line) recastci(rarea) ///
    ytitle("Predicted Outcome") ///
    xtitle("Global Digitalization Index") ///
    title("Quadratic Effect of Global Digitalization")

*Step 4 -  run the multi-level analysis - first the baseline model and after the full model, the baseline model is without variables to get the log likelihood (for the pseudo R2)
mixed Effectsize || No: || Obs:
xi: mixed Effectsize Avscore Avscore_sq ib1.Perf_num ib2020.Year ib3.Method_num ib3.Serv_num ib1.NACE_num primary || No: || Obs:
outreg2 using table1.rtf, pdec(4) bdec(4) stats(coef se pval) ctitle(Multi-level)

