


Data SPDTMP7.VB_CUS_Active_Mayscr_final(compress=yes drop= e_betax);

set SPDTMP7.VB_CUS_TN_ITM_REV_AE_Mayscr;

e_betax = 
exp(-(-5.310039032+
Dpt_FashAcc_trnxns*-0.063945326+
Dpt_Spa_trnxns*-0.066949263+
Dpt_TeenGifts_Rev*-0.000534634+
FEMALE_REV_AED*0.0000340299+
KIDS_REV_AED*-0.000006464779+
Lstg_sgmnt_5*0.2030357425+
Lstg_sgmnt_7*-0.14034027+
Nationality_Local*0.0844899237+
RFM_2*2.4345327015+
RFM_3*1.5929788317+
RFM_4*3.5757456516+
RFM_5*4.4614271342+
RFM_6*4.7500670252+
Rev_Grp_WB_perc*0.1132118058+
Rev_LS_perc*-0.48078345+
Sex_F_dummy*0.1104960969+
active_time_LMG3*0.0027473491));

May_score = 1/(1+e_betax);

run;

Data spdtmp90.VB_LS_AE_MAY17_SCORE(compress=yes);
set SPDTMP7.VB_CUS_Active_Mayscr_final (keep= lmg_mem_card_number May_score)
	spdtmp30.VB_WB_LS_May_scores_final (keep= lmg_mem_card_number May_score)
	spdtmp7.VB_AQ_LS_Mayscr_final (keep= lmg_mem_card_number May_score);

run;


proc contents data= spdtmp7.VB_AQ_LS_Mayscr_final;
run;