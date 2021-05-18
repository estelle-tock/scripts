

# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--reso_csv=/Users/estelle/tooth_resos.csv
--config_json="{formatVersion:CELLAR_PASS,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, resoCreationDateFormat:M_D_YYYY_H_M_A,guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"


scp -i ~/.ssh/google_compute_engine ~/tooth_resos.csv estelle@crawl-server:~/ 

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp tooth_resos.csv ~ 

cd ~/importer/server


# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3562 -r ../../tooth_resos.csv -c "{formatVersion:CELLAR_PASS,separator:',', resoDateFormat:M_D_YYYY,resoTimeFormat:H_M_A, resoCreationDateFormat:M_D_YYYY_H_M_A,guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
