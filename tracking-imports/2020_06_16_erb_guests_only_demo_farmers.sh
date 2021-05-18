# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/farmers_prod.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_ERB,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A,resoCreationTimeFormat:H_MM, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/farmers_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp farmers_prod.csv ~

cd ~/importer/server

./run_importer.sh -e demo -b 3886 -g ../../farmers_prod.csv -c "{formatVersion:OPENTABLE_ERB,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A,guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------
