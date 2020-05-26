

# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
./concat.sh ~/hamiltons_resos ~/hamiltons_resos.csv

# tags too long, needed to add tags limit to code

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/hamiltons_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/hamiltons_resos.csv estelle@crawl-server:~/ 

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp hamiltons_resos.csv ~

cd ~/importer/server

# export configs from prod to demo
./export_configuration.sh prod 11115 11115.prod.proto
./import_configuration.sh demo 3480 11115.prod.proto

# check dashboard-demo.exploretock.com for tables at ID 3480

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3480 -g ../../hamiltons_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# Must Check BEFORE PROD:
#  [ ] Pushed configurations? (if necessary)
#  [ ] Enabled/Disabled Welcome Texts? (-t true)
#  [ ] No extra guests or reservations in dashboard prod? (unless AM says ok)
#  [ ] BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#  [ ] If LARGE file, use nohup to run in background & DO NOT RE-RUN

./run_importer.sh -e prod -b 11115 -g ../../hamiltons_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
