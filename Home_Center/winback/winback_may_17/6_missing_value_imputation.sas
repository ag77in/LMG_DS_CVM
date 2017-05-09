/*Missing Value imputation*/



data spdtmp7.sd_hc_txn_wbmay(compress=yes);
set spdtmp7.sd_hc_txn_wbmay ;
Format age_group $50.0;
Format age_group $50.0;
if age>0 and age <=10 then age_group = "ag1";
else if age>10 and age <=18 then age_group = "ag2";
else if age>19 and age <=25 then age_group = "ag3";
else if age>25 and age<=35 then age_group = "ag4";
else if age>35 and age <=50 then age_group = "ag5";
else if age>50 and age<=75 then age_group = "ag6";
else if age>75 then age_group = "ag7";
else age_group = "NA";
run;

/*delete*/


data spdtmp7.sd_hc_txn_wbmay_11 (compress= yes);
set spdtmp7.sd_hc_txn_wbmay;
where age_group<> "NA";
run;

proc freq data=spdtmp7.sd_hc_txn_wbmay_11;
table age_group;
run;


data spdtmp7.sd_hc_txn_wbmay (compress= yes);
set spdtmp7.sd_hc_txn_wbmay;
Rand_no = ranuni(123);

if age_group = "NA" and Rand_no <=0.0050 then age_group = "ag1";
else if age_group = "NA" and Rand_no > 0.0050and Rand_no <= 0.0116 then age_group = "ag2";
else if age_group = "NA" and Rand_no > 0.0116 and Rand_no <= 0.0690 then age_group = "ag3";
else if age_group = "NA" and Rand_no > 0.0692 and Rand_no <= 0.4530 then age_group = "ag4";
else if age_group = "NA" and Rand_no > 0.4530and Rand_no <= 0.9015 then age_group = "ag5";
else if age_group = "NA" and Rand_no > 0.9015 and Rand_no <= 0.9988 then age_group = "ag6";
else if age_group = "NA" and Rand_no > 0.9988 and Rand_no <= 1.00 then age_group = "ag7";
else age_group=age_group;

run;
proc sql;
create table abc as
select count(distinct LMG_mem_card_number) from spdtmp7.sd_hc_txn_wbmay;
quit;

proc freq data=spdtmp7.sd_hc_txn_wbmay;
table age_group;
run;


data spdtmp7.sd_hc_txn_wbmay;
set spdtmp7.sd_hc_txn_wbmay;
if sex_mf_name="" or sex_mf_name="Unspecified"
then sex_mf_name="NA";
else sex_mf_name=sex_mf_name;
run;


data spdtmp7.sd_hc_txn_wbmay_11;
set spdtmp7.sd_hc_txn_wbmay;
where sex_mf_name<>"NA";
run;


proc freq data=spdtmp7.sd_hc_txn_wbmay_11;
tables sex_mf_name;
run;


data spdtmp7.sd_hc_txn_wbmay (compress= yes);
set spdtmp7.sd_hc_txn_wbmay;
Rand_no = ranuni(123);
if sex_mf_name = "NA" and Rand_no <=0.4970 then sex_mf_name = "F";
else if sex_mf_name = "NA" and Rand_no > 0.4970 and Rand_no <= 1 then sex_mf_name = "M";
else sex_mf_name=sex_mf_name;
run;

proc sql;
create table abc as
select count(distinct LMG_mem_card_number) from spdtmp7.sd_hc_txn_wbmay;
quit;

proc freq data=spdtmp7.sd_hc_txn_wbmay;
table sex_mf_name;
run;


proc freq data=spdtmp7.sd_hc_txn_wbmay;
table cvm_nationality_group;
run;

data spdtmp7.sd_hc_txn_wbmay;
set spdtmp7.sd_hc_txn_wbmay;
if cvm_nationality_group="" or cvm_nationality_group="Unspecified"
then cvm_nationality_group="NA";
else cvm_nationality_group=cvm_nationality_group;
run;


data spdtmp7.sd_hc_txn_wbmay_11;
set spdtmp7.sd_hc_txn_wbmay;
where cvm_nationality_group<>"NA";
run;

proc freq data=spdtmp7.sd_hc_txn_wbmay_11;
table cvm_nationality_group;
run;



data spdtmp7.sd_hc_txn_wbmay(compress= yes);
set spdtmp7.sd_hc_txn_wbmay;
Rand_no = ranuni(123);

if cvm_nationality_group="NA" and Rand_no <=0.2173 then cvm_nationality_group = "Expat Arab";
else if cvm_nationality_group="NA" and Rand_no > 0.2173 and Rand_no <= .4734then cvm_nationality_group = "ISC";
else if cvm_nationality_group="NA" and Rand_no > 0.4734 and Rand_no <= .6623 then cvm_nationality_group = "Local";
else if cvm_nationality_group="NA" and Rand_no > 0.6623 and Rand_no <= 1 then cvm_nationality_group = "Others";
else cvm_nationality_group=cvm_nationality_group;

run;

proc freq data=spdtmp7.sd_hc_txn_wbmay;
table cvm_nationality_group;
run;


data spdtmp7.sd_hc_txn_wbmay;
set spdtmp7.sd_hc_txn_wbmay;
           /* Age Dummy */
  if age_group = "ag1" then age_grp_1_dummy = 1; else age_grp_1_dummy = 0;
  if age_group = "ag2" then age_grp_2_dummy = 1; else age_grp_2_dummy = 0;
  if age_group = "ag3" then age_grp_3_dummy = 1; else age_grp_3_dummy = 0;
  if age_group = "ag4" then age_grp_4_dummy = 1; else age_grp_4_dummy = 0;
  if age_group = "ag5" then age_grp_5_dummy = 1; else age_grp_5_dummy = 0;
  if age_group = "ag6" then age_grp_6_dummy= 1; else age_grp_6_dummy = 0;
      /*Nationality Dummy*/
  if CVM_Nationality_group = "Local" then Local_nat_dummy = 1; else Local_nat_dummy = 0;
  if CVM_Nationality_group = "Expat Arab" then Expat_Arab_nat_dummy = 1; else Expat_Arab_nat_dummy = 0;
  if CVM_Nationality_group = "ISC" then  ISC_nat_dummy = 1; else ISC_nat_dummy = 0;
    
           /*Gender Dummy */
  if SEX_MF_NAME = "M" then Gender_M_dummy = 1; else Gender_M_dummy = 0;

 
       
run;

proc sql;
create table abc as
select count(distinct LMG_mem_card_number) from spdtmp7.sd_hc_txn_wbmay;
quit;


proc freq data=  spdtmp7.sd_hc_txn_wbmay;
tables Local_nat_dummy Expat_Arab_nat_dummy ISC_nat_dummy Gender_M_dummy;
run;



proc delete data=spdtmp7.sd_hc_txn_wbmay_11;run;