

# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--reso_csv=/Users/estelle/chimney_rock_resos_final_2.csv
--config_json="{formatVersion:CELLAR_PASS,separator:',', resoDateFormat:M_D_YYYY,resoTimeFormat:H_M_A, resoCreationDateFormat:M_D_YYYY_H_M_A,guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/chimney_rock_otgc_guests_only.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,guestDateFormat:M_D_YYYY,separator:',',quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/chimney_rock_resos_final_2.csv estelle@crawl-server:~/ 
scp -i ~/.ssh/google_compute_engine ~/chimney_rock_otgc_guests_only.csv estelle@crawl-server:~/ 

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp chimney_rock_resos_final_2.csv ~ 
cp chimney_rock_otgc_guests_only.csv ~

cd ~/importer/server

./export_configuration.sh prod 12849 12849.prod.proto
./import_configuration.sh demo 3534 12849.prod.proto


# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3534 -r ../../chimney_rock_resos_final_2.csv -c "{formatVersion:CELLAR_PASS,separator:',', resoDateFormat:M_D_YYYY,resoTimeFormat:H_M_A, resoCreationDateFormat:M_D_YYYY_H_M_A,guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"

./run_importer.sh -e demo -b 3534 -g ../../chimney_rock_otgc_guests_only.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,guestDateFormat:M_D_YYYY,separator:',',quoteDetectionEnabled: false, smsReminderEnabled: true}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
