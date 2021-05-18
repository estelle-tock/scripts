# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/aburihana_demo.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/aburihana_demo.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp aburihana_demo.csv ~

cd ~/importer/server

# FINAL DEMO (RESOS & GUESTS)
nohup ./run_importer.sh -e demo -b 3927 -g ../../aburihana_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------