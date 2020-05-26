

# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------

# convert event file to OT_GC_GUEST_ONLY

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--reso_csv=/Users/estelle/sanford_resos_final.csv
--config_json="{formatVersion:CELLAR_PASS,separator:',', resoDateFormat:M_D_YYYY,resoTimeFormat:H_M_A, resoCreationDateFormat:M_D_YYYY_H_M_A,guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/sanford_guests_ot_guests_only.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,guestDateFormat:M_D_YYYY,separator:',',quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/sanford_resos_final.csv estelle@crawl-server:~/ 
scp -i ~/.ssh/google_compute_engine ~/sanford_guests_ot_guests_only.csv estelle@crawl-server:~/ 

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp sanford_resos_final.csv ~
cp sanford_guests_ot_guests_only.csv ~

cd ~/importer/server

./export_configuration.sh prod 8231 8231.prod.proto
./import_configuration.sh demo 3533 8231.prod.proto


# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3533 -r ../../sanford_resos_final.csv -c "{formatVersion:CELLAR_PASS,separator:',', resoDateFormat:M_D_YYYY,resoTimeFormat:H_M_A, resoCreationDateFormat:M_D_YYYY_H_M_A,guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

./run_importer.sh -e demo -b 3533 -g ../../sanford_guests_ot_guests_only.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,guestDateFormat:M_D_YYYY,separator:',',quoteDetectionEnabled: false, smsReminderEnabled: false}"

# Must Check BEFORE PROD:
#  [ ] Pushed configurations? (if necessary)
#  [ ] Enabled/Disabled Welcome Texts? (-t true)
#  [ ] No extra guests or reservations in dashboard prod? (unless AM says ok)
#  [ ] BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#  [ ] If LARGE file, use nohup to run in background & DO NOT RE-RUN

./run_importer.sh -e prod -b 8231 -r ../../sanford_resos_final.csv -c "{formatVersion:CELLAR_PASS,separator:',', resoDateFormat:M_D_YYYY,resoTimeFormat:H_M_A, resoCreationDateFormat:M_D_YYYY_H_M_A,guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

./run_importer.sh -e prod -b 8231 -g ../../sanford_guests_ot_guests_only.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,guestDateFormat:M_D_YYYY,separator:',',quoteDetectionEnabled: false, smsReminderEnabled: false}"


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------