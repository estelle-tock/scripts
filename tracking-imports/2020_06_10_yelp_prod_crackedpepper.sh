# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------

scp -i ~/.ssh/google_compute_engine ~/crackedpepper_guests.csv estelle@crawl-server:~/ && scp -i ~/.ssh/google_compute_engine ~/crackedpepper_resos.csv estelle@crawl-server:~/ 

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp crackedpepper_guests.csv ~ && cp crackedpepper_resos.csv ~

cd ~/importer/server

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3701 -g ../../crackedpepper_guests.csv -r ../../crackedpepper_resos.csv -c "{formatVersion:YELP,separator:',', resoDateFormat:M_D_YYYY_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: false}"


./run_importer.sh -e prod -b 15139 -g ../../crackedpepper_guests.csv -r ../../crackedpepper_resos.csv -c "{formatVersion:YELP,separator:',', resoDateFormat:M_D_YYYY_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"

./run_importer.sh -e prod -b 15139 -g ../../crackedpepper_guests.csv -r ../../crackedpepper_resos.csv -c "{formatVersion:YELP,separator:',', resoDateFormat:M_D_YYYY_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, resumeFromChunkId:33}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------
