# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------

# reservation add source column before table_seated_at
# guest renaming columns to resy format

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/stlawrence_guests.csv
--reso_csv=/Users/estelle/stlawrence_resos.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, resoCreationDateFormat:YYYY_M_D_DASH,resoCreationTimeFormat:HH_MM_SS,guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true }"

scp -i ~/.ssh/google_compute_engine ~/stlawrence_guests.csv estelle@crawl-server:~/ && 
scp -i ~/.ssh/google_compute_engine ~/stlawrence_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp stlawrence_resos.csv ~ && cp stlawrence_guests.csv ~

cd ~/importer/server


# export configs from prod to demo
./export_configuration.sh prod 11967 11967.prod.proto
./import_configuration.sh demo 3540 11967.prod.proto


# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3540 -g ../../stlawrence_guests.csv -r ../../stlawrence_resos.csv -c  "{formatVersion:RESY, resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, resoCreationDateFormat:YYYY_M_D_DASH,guestDateFormat:YYYY_M_D_DASH,quoteDetectionEnabled: false, smsReminderEnabled: false, separator:','}"

./import_configuration.sh demo 3713 11967.prod.proto

./run_importer.sh -e demo -b 3713 -g ../../stlawrence_guests.csv -r ../../stlawrence_resos.csv -c  "{formatVersion:RESY, resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, resoCreationDateFormat:YYYY_M_D_DASH,guestDateFormat:YYYY_M_D_DASH,quoteDetectionEnabled: false, smsReminderEnabled: false, separator:','}"



# Must Check BEFORE PROD:
#  [ ] Pushed configurations? (if necessary)
#  [ ] Enabled/Disabled Welcome Texts? (-t true)
#  [ ] No extra guests or reservations in dashboard prod? (unless AM says ok)
#  [ ] BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#  [ ] If LARGE file, use nohup to run in background & DO NOT RE-RUN

./run_importer.sh -e prod -b 11967 -g ../../stlawrence_guests.csv -r ../../stlawrence_resos.csv -c "{formatVersion:RESY, resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, resoCreationDateFormat:YYYY_M_D_DASH,guestDateFormat:YYYY_M_D_DASH,quoteDetectionEnabled: false, smsReminderEnabled: false, separator:','}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------
