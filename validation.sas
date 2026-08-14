libname MIDTERM "/home/u64352390/project/Midterm"; 
run; 
 
/* we do not utilize PROC IMPORT since the file isn't delimited but fix-width  
PROC IMPORT OUT= MIDTERM.origin 
			DATAFILE= "/home/u64352394/BIOSTAT203A/Midterm_Project/matched-multiple-birth-fetal-death-2016-2020.txt" 
RUN; */ 
 
DATA MIDTERM.origin_main (label="Matched Multiple Birth and Fetal Death: Selected Variables"); 
    INFILE '//home/u64352390/project/Midterm/MULTIPLES.TXT'  
        LRECL=157 TRUNCOVER; 
 
/* 	location for specification 
	of format and informats */ 
 
 
    INPUT 
        /* Identification & linkage */ 
        BIRTHID     13                    /* 1=Survivor, 2=Infant death, 3=Fetal death */ 
        PLURAL      1                     /* 2=Twin, 3=Triplet, 4=Quadruplet */ 
        COUNT       8                     /* Number of matched records in set */ 
        MULTID      2-7                   /* Matched ID for multiple delivery (numeric ID) */ 
 
        /* Infant characteristics */ 
        SEX         $104                  /* M/F */ 
        NO_ABNORM   125                   /* No abnormal conditions checked */ 
        AGER5       144                   /* Infant age at death recode */ 
        BWTR12      114-115               /* Birthweight recode (12-cat) */ 
        BWTR4       118                   /* Birthweight recode (4-cat) */ 
        MANNER      147                   /* Manner of death */ 
        OEGEST_R12  110-111               /* Gestational age recode (12-cat) */ 
        APGAR5      97-98                 /* 5-minute APGAR score (0–10, 99 Unknown) */ 
        ME_PRES     83                    /* Fetal presentation */ 
        ME_ROUT     84                    /* Route/method of delivery */ 
        DMETHOD     86                    /* Delivery method */ 
        NO_MMORB    93                    /* No maternal morbidity flag */ 
 
        /* Maternal {some paternal} characteristics */ 
        MAGER9      17                    /* Maternal age recode (1–9) */ 
        MEDUC       24                    /* Maternal education */ 
        ILP_R11     35-36                 /* Interval since last pregnancy recode */ 
        NATIVITY    19                    /* Maternal nativity */ 
        CIG_0       43-44                 /* Cigarettes 3 months before pregnancy */ 
        CIG_1       45-46                 /* Cigarettes 1st trimester */ 
        CIG_2       47-48                 /* Cigarettes 2nd trimester */ 
        CIG_3       49-50                 /* Cigarettes 3rd trimester */ 
        CIG0_R      51                    /* Cigarettes 3 months before (recode) */ 
        CIG_R       $55                   /* Cigarette smoking recode (Y/N/U) */ 
        RF_INFTR    $63                   /* Infertility treatment used (Y/N/U) */ 
        BMI_R       56                    /* BMI recode (1–6, 9=Unknown) */ 
         
        FAGER11     25-26                 /* Paternal age recode */ 
        FEDUC       28                    /* Paternal education */ 
         
       	/* Maternal Conditions */ 
        RF_CESAR    $64                   /* Previous cesarean (Y/N/U) */ 
        NO_RISKS    67                    /* No risk factors reported */ 
        RF_PDIAB    $58                   /* Prepregnancy diabetes */ 
        RF_GDIAB    $59                   /* Gestational diabetes */ 
        RF_PHYPE    $60                   /* Prepregnancy hypertension */ 
        RF_GHYPE    $61                   /* Gestational hypertension */ 
 
        /* Maternal infections (68–73) */ 
        IP_GON      $68                   /* Gonorrhea */ 
        IP_SYPH     $69                   /* Syphilis */ 
        IP_CHLAM    $70                   /* Chlamydia */ 
        IP_HEPB     $71                   /* Hepatitis B */ 
        IP_HEPC     $72                   /* Hepatitis C */ 
        NO_INFEC    73                    /* No infections reported */ 
    ; 
RUN; 
 
 
PROC FORMAT; * utilize $ for character variables; 
    /* Core categorical variables */ 
    value BIRTHIDF  1='Survivor'  2='Infant death'  3='Fetal death'; 
    value PLURF     2='Twin'  3='Triplet'  4='Quadruplet'; 
    value CNTF      1='Unmatched'  2='Two matched'  3='Three matched'  4='Four matched'; 
 
    /* Infant characteristics */ 
    value $SEXF     'M'='Male'  'F'='Female'; 
    value NOABF     1='True'  0='False'  9='Not reported'; 
    value AGER5F    1='<1 hour'  2='1–23 hours'  3='1–6 days' 
                    4='7–27 days (late neonatal)'  5='≥28 days (postneonatal)'; 
    value BW12F     1='227–499g' 2='500–999g' 3='1000–1499g' 4='1500–1999g' 
                    5='2000–2499g' 6='2500–2999g' 7='3000–3499g' 8='3500–3999g' 
                    9='4000–4499g' 10='4500–4999g' 11='5000–8165g' 12='Unknown'; 
    value BW4F      1='<1500g'  2='1500–2499g'  3='≥2500g'  4='Unknown'; 
    value MANNERF   1='Accident' 2='Suicide' 3='Homicide' 4='Pending investigation' 
                    5='Could not determine' 6='Self-inflicted' 7='Natural' .='Not specified'; 
    value OEG12F    1='<16 wks' 2='16–19' 3='20–23' 4='24–27' 5='28–31' 6='32–33' 
                    7='34–36' 8='37–38' 9='39–40' 10='41' 11='≥42' 12='Unknown'; 
    value PRESF     1='Cephalic' 2='Breech' 3='Other' 9='Unknown'; 
    value ROUTF     1='Spontaneous' 2='Forceps' 3='Vacuum' 4='Cesarean' 9='Unknown'; 
    value DMETHF    1='Vaginal (non-C-section)' 2='Vaginal after C-section' 
                    3='Primary C-section' 4='Repeat C-section' 
                    5='Vaginal (prev C-section unknown)' 
                    6='C-section (prev C-section unknown)' 9='Unknown'; 
    value NOMORB    1='True'  0='False'  9='Not reported'; 
 
    /* Maternal & paternal */ 
    value MAGER9F   1='<15' 2='15–19' 3='20–24' 4='25–29' 
                    5='30–34' 6='35–39' 7='40–44' 8='45–49' 9='50–54'; 
    value FAGERF    1='<15' 2='15–19' 3='20–24' 4='25–29' 5='30–34' 
                    6='35–39' 7='40–44' 8='45–49' 9='50–54' 
                    10='55–98' 11='Unknown'; 
    value MEDUCF    1='≤8th grade' 2='9–12 no diploma' 3='High school/GED' 
                    4='Some college' 5='Associate degree' 6='Bachelor’s' 
                    7='Master’s' 8='Doctorate/Professional' 9='Unknown'; 
    value FEDUCF    1='≤8th grade' 2='9–12 no diploma' 3='High school/GED' 
                    4='Some college' 5='Associate degree' 6='Bachelor’s' 
                    7='Master’s' 8='Doctorate/Professional' 9='Unknown'; 
    value ILP11F    0='0–3 mo (plural delivery)' 1='4–11 mo' 2='12–17 mo' 3='18–23 mo' 
                    4='24–35 mo' 5='36–47 mo' 6='48–59 mo' 7='60–71 mo' 
                    8='72+ mo' 88='NA (no prev preg)' 99='Unknown'; 
    value NATIVF    1='Born in US' 2='Born outside US' 3='Unknown'; 
    value CIGNF     0-97='Number per day' 98='≥98/day' 99='Unknown'; 
    value CIG0RF    0='Nonsmoker' 1='1–5' 2='6–10' 3='11–20' 4='21–40' 5='41+' 6='Unknown'; 
    value $YESNOF   'Y'='Yes' 'N'='No' 'U'='Unknown'; 
    value BMI_RF    1='Underweight' 2='Normal' 3='Overweight' 
                    4='Obesity I' 5='Obesity II' 6='Obesity III' 9='Unknown'; 
 
    /* Maternal risk & infection flags */ 
    value NORISKF   1='No risk factors TRUE' 0='FALSE' 9='Not reported'; 
    value NOINFECF  1='No infection TRUE'    0='FALSE' 9='Not reported'; 
RUN; 
 
 
DATA MIDTERM.formatted; 
    SET MIDTERM.origin_main; 
 
    LABEL 
        /* Identification */ 
        BIRTHID     = "Record category: Survivor / Infant death / Fetal death" 
        PLURAL      = "Birth type (twin/triplet/quadruplet)" 
        COUNT       = "Number of matched records in set" 
        MULTID      = "Matched set ID" 
 
        /* Infant characteristics */ 
        SEX         = "Infant sex" 
        NO_ABNORM   = "No abnormal conditions checked" 
        AGER5       = "Infant age at death recode" 
        BWTR12      = "Newborn Birthweight  (12 categories)" 
        BWTR4       = "Newborn Birthweight  (4 categories)" 
        MANNER      = "Manner of death" 
        OEGEST_R12  = "Gestational age recode (12 categories)" 
        APGAR5      = "5-minute APGAR score (test of general condition)" 
        ME_PRES     = "Fetal presentation at delivery" 
        ME_ROUT     = "Route & method of delivery" 
        DMETHOD     = "Delivery method" 
        NO_MMORB    = "No maternal morbidity reported" 
 
        /* Maternal and paternal */ 
        MAGER9      = "Maternal age group" 
        MEDUC       = "Maternal education" 
        ILP_R11     = "Interval since last pregnancy recode" 
        NATIVITY    = "Maternal nativity (born in/outside US)" 
        CIG_0       = "Cigarettes/day, 3 months before pregnancy" 
        CIG_1       = "Cigarettes/day, 1st trimester" 
        CIG_2       = "Cigarettes/day, 2nd trimester" 
        CIG_3       = "Cigarettes/day, 3rd trimester" 
        CIG0_R      = "Cigarettes before pregnancy (recode)" 
        CIG_R       = "Smoked during pregnancy (Y/N/U)" 
        RF_INFTR    = "Infertility treatment used (Y/N/U)" 
        BMI_R       = "Body Mass Index (Assumed Maternal & recode)" /*special naming*/ 
        FAGER11     = "Paternal age group" 
        FEDUC       = "Paternal education" 
 
        /* Maternal risk & infection */ 
        RF_CESAR    = "Previous cesarean (Y/N/U)" 
        NO_RISKS    = "No risk factors reported (based on maternal characteristics)" 
        RF_PDIAB    = "Prepregnancy diabetes (Y/N/U)" 
        RF_GDIAB    = "Gestational diabetes (Y/N/U)" 
        RF_PHYPE    = "Prepregnancy hypertension (Y/N/U)" 
        RF_GHYPE    = "Gestational hypertension (Y/N/U)" 
        IP_GON      = "Gonorrhea (Y/N/U)" 
        IP_SYPH     = "Syphilis (Y/N/U)" 
        IP_CHLAM    = "Chlamydia (Y/N/U)" 
        IP_HEPB     = "Hepatitis B (Y/N/U)" 
        IP_HEPC     = "Hepatitis C (Y/N/U)" 
        NO_INFEC    = "No infections reported" 
    ; 
 
    FORMAT 
        /* categorical variables */ 
        BIRTHID     BIRTHIDF. 
        PLURAL      PLURF. 
        COUNT       CNTF. 
        SEX         SEXF. 
        NO_ABNORM   NOABF. 
        AGER5       AGER5F. 
        BWTR12      BW12F. 
        BWTR4       BW4F. 
        MANNER      MANNERF. 
        OEGEST_R12  OEG12F. 
        ME_PRES     PRESF. 
        ME_ROUT     ROUTF. 
        DMETHOD     DMETHF. 
        NO_MMORB    NOMORB. 
        MAGER9      MAGER9F. 
        MEDUC       MEDUCF. 
        ILP_R11     ILP11F. 
        NATIVITY    NATIVF. 
        CIG0_R      CIG0RF. 
        CIG_R       $YESNOF. 
        RF_INFTR    $YESNOF. 
        BMI_R       BMI_RF. 
        FAGER11     FAGERF. 
        FEDUC       FEDUCF. 
        RF_CESAR    $YESNOF. 
        NO_RISKS    NORISKF. 
        RF_PDIAB    $YESNOF. 
        RF_GDIAB    $YESNOF. 
        RF_PHYPE    $YESNOF. 
        RF_GHYPE    $YESNOF. 
        IP_GON      $YESNOF. 
        IP_SYPH     $YESNOF. 
        IP_CHLAM    $YESNOF. 
        IP_HEPB     $YESNOF. 
        IP_HEPC     $YESNOF. 
        NO_INFEC    NOINFECF. 
    ; 
 
    /* numeric variables (no formats): */ 
    FORMAT 
        MULTID z6. 
RUN;

proc contents data=MIDTERM.formatted order=varnum;

run;




*Maternal and Perinatal Characteristics Across Multiple Birth Outcomes;

data MIDTERM.analysis;
    set MIDTERM.formatted;
    if PLURAL in (2,3,4);
run;

%macro make_table(var=, fmt=, out=);

    proc freq data=MIDTERM.analysis noprint;
        tables &var.*PLURAL / out=&out.; 
    run;

    data &out.;
        set &out.;
        length varname $40 level $100 cell $40;
        varname = "&var.";
        level   = put(&var., &fmt.);
        cell    = cats(count, " (", put(percent, 6.1), "%)");
    run;

%mend;

%make_table(var=MEDUC,     fmt=MEDUCF.,      out=tbl1);
%make_table(var=NATIVITY,  fmt=NATIVF.,      out=tbl2);
%make_table(var=CIG_R,     fmt=$YESNOF.,     out=tbl3);
%make_table(var=NO_INFEC,  fmt=NOINFECF.,    out=tbl4);
%make_table(var=NO_ABNORM, fmt=NOABF.,       out=tbl5);
%make_table(var=DMETHOD,   fmt=DMETHF.,      out=tbl6);

data Table2_all;
    set tbl1 tbl2 tbl3 tbl4 tbl5 tbl6;
run;


proc sort data=Table2_all;
    by varname level PLURAL;
run;

proc transpose data=Table2_all out=Table2_wide(drop=_NAME_) prefix=col_;
    by varname level;
    id PLURAL;          
    var cell;
run;

data Table2_Final;
    set Table2_wide;
    label col_2 = "Twin"
          col_3 = "Triplet"
          col_4 = "Quadruplet";
    rename col_2= Twin col_3=Triplet col_4=Quadruplet;
run;

title "TABLE 1 | Maternal and Perinatal Characteristics Across Multiple Birth Outcomes";
proc print data=Table2_final label noobs;
run;
title;








*twins;

data twins;
    set MIDTERM.formatted;
    if PLURAL = 2;
    death = (BIRTHID in (2,3));

   
    if CIG_R = 'U' then delete;
    cig_Rn = (CIG_R = 'N');  

    NO_ABNORM = (NO_ABNORM = 0); 

    if MEDUC    = 9 then delete;
    if NATIVITY = 3 then delete;
    if DMETHOD  = 9 then delete;
run;

proc freq data=twins;
    tables death noinfec_true noabnorm_true;
run;

proc logistic data=twins descending;
    class 
        MEDUC    (ref='9–12 no diploma')
        NATIVITY (ref='Born in US')
        DMETHOD  (ref='C-section (prev C-section unknown)')
        / param=ref;

    model death(event='1') =
        MEDUC
        NATIVITY
        cig_Rn    
        NO_INFEC
        NO_ABNORM   
        DMETHOD
        / clodds=wald;
        ROC;
run;


*triplets ;

data triplets;
    set MIDTERM.formatted;
    if PLURAL = 3;
    death = (BIRTHID in (2,3));

   
    if CIG_R = 'U' then delete;
    cig_Rn = (CIG_R = 'N');  

    NO_ABNORM = (NO_ABNORM = 0); 

    if MEDUC    = 9 then delete;
    if NATIVITY = 3 then delete;
    if DMETHOD  = 9 then delete;
run;


proc logistic data= triplets descending;
    class 
        MEDUC    (ref='9–12 no diploma')
        NATIVITY (ref='Born in US')
        DMETHOD  (ref='C-section (prev C-section unknown)')
        / param=ref;

    model death(event='1') =
        MEDUC
        NATIVITY
        cig_Rn    
        NO_INFEC
        NO_ABNORM   
        DMETHOD
        / clodds=wald;
        ROC;
run;




*quadruplets;

data quadruplets;
    set MIDTERM.formatted;
    if PLURAL = 4 ;
    death = (BIRTHID in (2,3));

   
    if CIG_R = 'U' then delete;
    cig_Rn = (CIG_R = 'N');  

    NO_ABNORM = (NO_ABNORM = 0); 

    if MEDUC    = 9 then delete;
    if NATIVITY = 3 then delete;
    if DMETHOD  = 9 then delete;
run;


proc logistic data=quadruplets descending;
    class 
        MEDUC    (ref='9–12 no diploma')
        NATIVITY (ref='Born in US')
        DMETHOD  (ref='C-section (prev C-section unknown)')
        / param=ref;

    model death(event='1') =
        MEDUC
        NATIVITY
        cig_Rn    
        NO_INFEC
        NO_ABNORM   
        DMETHOD
        / clodds=wald;
        ROC;
run;





