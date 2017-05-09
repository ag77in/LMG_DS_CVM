


/*Getting Max Transactions of Lifestyle winback customer base (Model)*/

data spdtmp7.VB_WB_OOS_LS_MX_TXN(compress=yes keep=lmg_mem_card_number txn_dt_wid lmg_x_dept_cd revenue_aed invoice_number units item_code base_points_accrued retail_cost_1_aed retail_cost_2_aed date);
set spdtmp7.VB_WB_OOS_LS_TXN;
where 20140201<=txn_dt_wid<=20150131 and LMG_concept_name="Max" and revenue_aed>0 and units>0 and base_points_accrued >0 ;
date = INPUT(PUT(TXN_DT_WID,8.),YYMMDD8.); 
           format date ddmmyys10.;
run;

/*proc sql;*/
/*create table abc(compress=yes) as */
/*select count(distinct LMG_mem_Card_number), max(txn_dt_wid) from;*/
/*quit;*/


/*all metrics ls all customers*/

proc sql;
create table spdtmp7.VB_WB_OOS_LS_MX_TXN (compress=yes) as
select  LMG_mem_card_number, 
           sum(revenue_aed) as sum_revenue_aed_MX, 
           count(distinct date) as no_of_visits_MX, 
           count(distinct invoice_number) as no_of_txn_MX, 
           max(date) as end_date_MX, 
           min(date) as start_date_MX,
           count(distinct item_code) as distinct_prod_MX, 
           sum(units) as total_unit_MX, 
           sum(base_points_accrued) as total_points_MX ,
           sum(retail_cost_1_aed) as sum_cost_1_MX,
           sum(retail_cost_2_aed) as sum_cost_2_MX
		   
from spdtmp7.VB_WB_OOS_LS_MX_TXN
group by LMG_MEM_CARD_Number;
quit;

data spdtmp7.VB_WB_OOS_LS_MX_TXN(compress=yes);
set spdtmp7.VB_WB_OOS_LS_MX_TXN;
format start_date_MX ddmmyys10.;
format end_date_MX ddmmyys10.;
recency_MX=intck('day',end_date_MX,'31Jan2015'd);
active_time_MX=intck('day',start_date_MX,end_date_MX);
avg_units_per_txn_MX = total_unit_MX/no_of_txn_MX;
avg_units_per_visit_MX =  total_unit_MX/no_of_visits_MX;
run;


/* Making 3,6,9 month aggregates for potential Lifestyle winback customer base*/

data spdtmp7.VB_WB_OOS_LS_MX3_TXN(compress=yes keep=lmg_mem_card_number txn_dt_wid lmg_x_dept_cd revenue_aed invoice_number units item_code base_points_accrued retail_cost_1_aed retail_cost_2_aed date);
set spdtmp7.VB_WB_OOS_LS_TXN;
where txn_Dt_wid>=20141101 and txn_dt_wid<=20150131 and LMG_concept_name="Max" and revenue_aed>0 and units>0 and base_points_accrued >0 ;
date = INPUT(PUT(TXN_DT_WID,8.),YYMMDD8.); 
           format date ddmmyys10.;
run;


proc sql;
create table spdtmp7.VB_WB_OOS_LS_MX3_TXN(compress=yes) as
select  LMG_mem_card_number, 
           sum(revenue_aed) as sum_revenue_aed_MX3, 
           count(distinct date) as no_of_visits_MX3, 
           count(distinct invoice_number) as no_of_txn_MX3, 
           max(date) as end_date_MX3, 
           min(date) as start_date_MX3,
           count(distinct item_code) as distinct_prod_MX3, 
           sum(units) as total_unit_MX3, 
           sum(base_points_accrued) as total_points_MX3 ,
           sum(retail_cost_1_aed) as sum_cost_1_MX3,
           sum(retail_cost_2_aed) as sum_cost_2_MX3

from spdtmp7.VB_WB_OOS_LS_MX3_TXN

group by LMG_MEM_CARD_Number;

quit;


/*proc sql;*/
/*select count(distinct LMG_mem_card_number) from spdtmp7.VB_WB_OOS_LS_3_TXN;*/
/*quit;*/



data spdtmp7.VB_WB_OOS_LS_MX3_TXN(compress=yes);
set spdtmp7.VB_WB_OOS_LS_MX3_TXN;
format start_date_MX3 ddmmyys10.;
format end_date_MX3 ddmmyys10.;
recency_MX3=intck('day',end_date_MX3,'31Jan2015'd);
active_time_MX3=intck('day',start_date_MX3,end_date_MX3);
avg_units_per_txn_MX3 = total_unit_MX3/no_of_txn_MX3;
avg_units_per_visit_MX3 =  total_unit_MX3/no_of_visits_MX3;
run;

/*6months*/


data spdtmp7.VB_WB_OOS_LS_MX6_TXN(compress=yes keep=lmg_mem_card_number txn_dt_wid lmg_x_dept_cd revenue_aed invoice_number units item_code base_points_accrued retail_cost_1_aed retail_cost_2_aed date);
set spdtmp7.VB_WB_OOS_LS_TXN;
where txn_Dt_wid>=20140801 and txn_dt_wid<=20150131 and LMG_concept_name="Max" and revenue_aed>0 and units>0 and base_points_accrued >0 ;
date = INPUT(PUT(TXN_DT_WID,8.),YYMMDD8.); 
           format date ddmmyys10.;
run;


proc sql;
create table spdtmp7.VB_WB_OOS_LS_MX6_TXN(compress=yes) as
select distinct LMG_mem_card_number, 
           sum(revenue_aed) as sum_revenue_aed_MX6, 
           count(distinct date) as no_of_visits_MX6, 
           count(distinct invoice_number) as no_of_txn_MX6, 
           max(date) as end_date_MX6, 
           min(date) as start_date_MX6,
           count(distinct item_code) as distinct_prod_MX6, 
           sum(units) as total_unit_MX6, 
           sum(base_points_accrued) as total_points_MX6,
		   sum(retail_cost_1_aed) as sum_cost_1_MX6,
		   sum(retail_cost_2_aed) as sum_cost_2_MX6 
from spdtmp7.VB_WB_OOS_LS_MX6_TXN

group by LMG_MEM_CARD_Number;

quit;



data spdtmp7.VB_WB_OOS_LS_MX6_TXN(compress=yes);
set spdtmp7.VB_WB_OOS_LS_MX6_TXN;
format start_date_MX6 ddmmyys10.;
format end_date_MX6 ddmmyys10.;
recency_MX6=intck('day',end_date_MX6,'31Jan2015'd);
active_time_MX6=intck('day',start_date_MX6,end_date_MX6);
avg_units_per_txn_MX6 = total_unit_MX6/no_of_txn_MX6;
avg_units_per_visit_MX6 =  total_unit_MX6/no_of_visits_MX6;
run;

/*9months*/

data spdtmp7.VB_WB_OOS_LS_MX9_TXN(compress=yes keep=lmg_mem_card_number txn_dt_wid lmg_x_dept_cd revenue_aed invoice_number units item_code base_points_accrued retail_cost_1_aed retail_cost_2_aed date);
set spdtmp7.VB_WB_OOS_LS_TXN;
where txn_Dt_wid>=20140501 and txn_dt_wid<=20150131 and LMG_concept_name="Max" and revenue_aed>0 and units>0 and base_points_accrued >0 ;
date = INPUT(PUT(TXN_DT_WID,8.),YYMMDD8.); 
           format date ddmmyys10.;
run;

proc sql;
create table spdtmp7.VB_WB_OOS_LS_MX9_TXN(compress=yes) as
select distinct LMG_mem_card_number, 
           sum(revenue_aed) as sum_revenue_aed_MX9, 
           count(distinct date) as no_of_visits_MX9, 
           count(distinct invoice_number) as no_of_txn_MX9, 
           max(date) as end_date_MX9, 
           min(date) as start_date_MX9,
           count(distinct item_code) as distinct_prod_MX9, 
           sum(units) as total_unit_MX9, 
           sum(base_points_accrued) as total_points_MX9 ,
           sum(retail_cost_1_aed) as sum_cost_1_MX9,
           sum(retail_cost_2_aed) as sum_cost_2_MX9

from spdtmp7.VB_WB_OOS_LS_MX9_TXN

group by LMG_MEM_CARD_Number;

quit;


/*proc sql;*/
/*select count(distinct LMG_mem_card_number) from spdtmp7.sd_MX_txn_31 ;*/
/*quit;*/


data spdtmp7.VB_WB_OOS_LS_MX9_TXN(compress=yes);
set spdtmp7.VB_WB_OOS_LS_MX9_TXN;
format start_date_MX9 ddmmyys10.;
format end_date_MX9 ddmmyys10.;
recency_MX9=intck('day',end_date_MX9,'31Jan2015'd);
active_time_MX9=intck('day',start_date_MX9,end_date_MX9);
avg_units_per_txn_MX9 = total_unit_MX9/no_of_txn_MX9;
avg_units_per_visit_MX9 =  total_unit_MX9/no_of_visits_MX9;
run;


/*join all tables*/

proc sql; 
create table spdtmp7.VB_WB_OOS_LS_MX_TXN_Overall (compress=yes) as
select a.*,b.*,c.*,d.* from spdtmp7.VB_WB_OOS_LS_MX_TXN a 
left join  spdtmp7.VB_WB_OOS_LS_MX3_TXN b on a.Lmg_mem_card_number=b.LMG_mem_card_number
left join spdtmp7.VB_WB_OOS_LS_MX6_TXN c on a.LMG_mem_card_number=c.LMG_mem_card_number
left join spdtmp7.VB_WB_OOS_LS_MX9_TXN d on a.LMG_mem_card_number=d.LMG_mem_card_number;
quit;



proc delete data=spdtmp7.VB_WB_OOS_LS_MX3_TXN;
proc delete data=spdtmp7.VB_WB_OOS_LS_MX6_TXN;
proc delete data=spdtmp7.VB_WB_OOS_LS_MX9_TXN;
