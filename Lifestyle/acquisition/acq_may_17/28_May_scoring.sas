

Data spdtmp7.VB_AQ_LS_Mayscr_final (compress= yes drop= e_betax);
set spdtmp7.VB_AQ_LS_Mayscr;

e_betax = 
exp(-(-3.835258292+FEMALE_REV_AED*0.0001497395+
Gender_M_dummy*-0.642119158+
ISC_nat_dummy*-0.12715143+
LMG_EFFECTIVE_POINTS*0.0001172581+
Local_nat_dummy*0.5953723504+
Lstg_sgmnt_1*-0.614937857+
Lstg_sgmnt_2*0.0934663555+
Lstg_sgmnt_4*-0.284667577+
Lstg_sgmnt_6*0.0847148576+
Rev_MX_perc*-0.439373313+
Rev_SM_perc*0.2867287143+
Units_HC_perc*0.3030147735+
active_time_lmg*-0.001814216+
concept_count*0.2041808495+
no_of_txn_BS3*0.0548368422+
no_of_txn_HC3*0.1039043085+
no_of_txn_SM6*-0.069809471+
recency_lmg*-0.007246585+
recency_lmg3*-0.003815389+
recency_lmg9*-0.001741012+
total_points_lmg3*-0.000118936));

May_score = 1/(1+e_betax)
;

run;
