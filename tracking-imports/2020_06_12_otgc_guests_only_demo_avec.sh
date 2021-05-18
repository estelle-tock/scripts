# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/avec_guests_demo.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A,resoCreationTimeFormat:H_MM, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/avec_guests_demo.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp avec_guests_demo.csv ~

cd ~/importer/server

./run_importer.sh -e demo -b 3694 -g ../../avec_guests_demo.csv -r ../../empty.txt -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A,resoCreationTimeFormat:H_MM, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------
