# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/alma_cafe_final_demo.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Cafe Alma'}"

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/alma_restaurant_final_demo.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Restaurant Alma'}"

scp -i ~/.ssh/google_compute_engine ~/alma_restaurant_final_demo.csv estelle@crawl-server:~/ && 
scp -i ~/.ssh/google_compute_engine ~/alma_cafe_final_demo.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp alma_cafe_final_demo.csv ~ && cp alma_restaurant_final_demo.csv ~

cd ~/importer/server

# check dashboard-demo.exploretock.com for tables at ID 
./export_configuration.sh prod 10246 10246.prod.proto
./import_configuration.sh demo 3544 10246.prod.proto

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3544 -g ../../alma_cafe_final_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Cafe Alma'}"

./run_importer.sh -e demo -b 3544 -g ../../alma_restaurant_final_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Restaurant Alma'}"

# Must Check BEFORE PROD:
#  [ ] Pushed configurations? (if necessary)
#  [ ] Enabled/Disabled Welcome Texts? (-t true)
#  [ ] No extra guests or reservations in dashboard prod? (unless AM says ok)
#  [ ] BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#  [ ] If LARGE file, use nohup to run in background & DO NOT RE-RUN

./run_importer.sh -e prod -b 10246 -g ../../alma_cafe_final_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Cafe Alma'}"

./run_importer.sh -e prod -b 10246 -g ../../alma_restaurant_final_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Restaurant Alma'}"


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
