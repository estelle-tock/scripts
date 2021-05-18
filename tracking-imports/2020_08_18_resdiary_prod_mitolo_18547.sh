# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/mitolo.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:RESDIARYV1,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/mitolo.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp mitolo.csv ~

cd ~/importer/server

# FINAL DEMO
#nohup ./run_importer.sh -e demo -b 4376 -g ../../mitolo.csv -r ../../empty.txt -c "{formatVersion:RESDIARYV1,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}" &


# PROD
#nohup ./run_importer.sh -e prod -b 18547 -g ../../mitolo.csv -r ../../empty.txt -c "{formatVersion:RESDIARYV1,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

start time 
end time 

file lines 7513