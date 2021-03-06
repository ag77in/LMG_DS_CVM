




data spdtmp7.sd_hc_txn_acapr1(compress=yes keep=lmg_mem_card_number txn_dt_wid lmg_x_dept_cd revenue_aed invoice_number units item_code base_points_accrued retail_cost_1_aed retail_cost_2_aed date);
set spdtmp7.sd_txn_wb;
where txn_dt_wid>=20170401 and txn_dt_wid<=20170430 and LMG_concept_name="Home center" and revenue_aed>0 and units>0 and base_points_accrued >0 ;
date = INPUT(PUT(TXN_DT_WID,8.),YYMMDD8.); 
           format date ddmmyys10.;
run;

proc sql;
create table spdtmp7.sd_hc_txn_acapr1 (compress=yes) as 
select distinct LMG_mem_card_number from spdtmp7.sd_hc_txn_acapr1
group by LMG_mem_card_number;
run;

data spdtmp7.sd_hc_txn_acapr1(compress=yes);
set spdtmp7.sd_hc_txn_acapr1;
purchase_flag=1;
run;

proc sql;
create table spdtmp7.sd_hc_txn_acapr(compress=yes) as
select a.*,b.* from spdtmp7.sd_hc_txn_acapr a left join spdtmp7.sd_hc_txn_acapr1 b on
a.LMG_mem_card_number=b.LMG_mem_Card_number;
run;

data spdtmp7.sd_hc_txn_acapr(compress=yes);
set spdtmp7.sd_hc_txn_acapr;
if purchase_flag=. then purchase_flag=0;
else purchase_flag=purchase_flag;
run;

proc freq data=spdtmp7.sd_hc_txn_ac;
tables purchase_flag;
run;

proc means data=spdtmp7.sd_hc_txn_acapr;
run;

proc delete data=spdtmp7.sd_hc_txn_acapr1;
run;