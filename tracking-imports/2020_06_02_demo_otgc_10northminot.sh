# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/10northminot.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/10northminot.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp 10northminot.csv ~

cd ~/importer/server

# export configs from prod to demo
./export_configuration.sh prod 14329 14329.prod.proto
./import_configuration.sh demo 3702 14329.prod.proto

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3702 -g ../../10northminot.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18