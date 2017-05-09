



proc logistic  
     inmodel = spdtmp7.VB_WB_LS_Train_scores;    /* Use the outmodel file from Model_Training here */ 
     score data = spdtmp7.VB_WB_Apr_LS_Alldata14
	 Out  = spdtmp30.VB_WB_LS_May_scores;
run; 

Data spdtmp30.VB_WB_LS_May_scores_final;
set spdtmp30.VB_WB_LS_May_scores;

e_betax = exp(-(-4.072849875+
FEMALE_REV_AED*0.0003271154+
KIDS_REV_AED*0.0000924759+
Local_nat_dummy*0.3157868555+
recency_lmg*-0.005141386+
total_points_MX*-0.000671881+
total_unit_SM6*-0.031477712+
Expat_Arab_nat_dummy*0.2308367515+
ISC_nat_dummy*0.1955428155+
total_points_SH6*-0.00070476+
avg_units_per_txn_SH*-0.029366301+
distinct_prod_BS3*-0.004386148+
recency_SH*0.0007673874));

May_score = 1/(1+e_betax);
run;




