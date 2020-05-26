# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------

# reservation add source column before table_seated_at
# guest renaming columns to resy format

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/lark_guests_final.csv
--reso_csv=/Users/estelle/lark_resos_final.csv
--config_json="{formatVersion:RESY, resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, resoCreationDateFormat:YYYY_M_D_DASH,resoCreationTimeFormat:HH_MM_SS,guestDateFormat:YYYY_M_D_DASH,quoteDetectionEnabled: false, smsReminderEnabled: true, separator:',', resumeFromChunkId: }"

scp -i ~/.ssh/google_compute_engine ~/lark_guests_final.csv estelle@crawl-server:~/ && 
scp -i ~/.ssh/google_compute_engine ~/lark_resos_final.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp lark_resos_final.csv ~ && cp lark_guests_final.csv ~

cd ~/importer/server

# FINAL DEMO (RESOS & GUESTS)

./run_importer.sh -e demo -b 3567 -g ../../lark_guests_final.csv -r ../../lark_resos_final.csv -c "{formatVersion:RESY, resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, resoCreationDateFormat:YYYY_M_D_DASH,resoCreationTimeFormat:HH_MM_SS,guestDateFormat:YYYY_M_D_DASH,quoteDetectionEnabled: false, smsReminderEnabled: true, separator:','}"

# Must Check BEFORE PROD:
#  [ ] Pushed configurations? (if necessary)
#  [ ] Enabled/Disabled Welcome Texts? (-t true)
#  [ ] No extra guests or reservations in dashboard prod? (unless AM says ok)
#  [ ] BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#  [ ] If LARGE file, use nohup to run in background & DO NOT RE-RUN

./run_importer.sh -e prod -b 14455 -g ../../lark_guests_final.csv -r ../../lark_resos_final.csv -c "{formatVersion:RESY, resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, resoCreationDateFormat:YYYY_M_D_DASH,resoCreationTimeFormat:HH_MM_SS,guestDateFormat:YYYY_M_D_DASH,quoteDetectionEnabled: false, smsReminderEnabled: true, separator:',', resumeFromChunkId: 11}"



# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------




# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update Status
# Update with number of lines in each file
# Update with number of records imported for resos (Reports > Item Sales > 2000-01-01 to today)
# Update with number of records imported for guests (Guests tab)
# Update with number of records imported for waitlist (Operations > Waitlist)
# Pick out some guests and make sure they're in dashboard
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------
