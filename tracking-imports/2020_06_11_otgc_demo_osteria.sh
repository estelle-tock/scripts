# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
scp -i ~/.ssh/google_compute_engine ~/osteria_resos_demo.csv estelle@crawl-server:~/
scp -i ~/.ssh/google_compute_engine ~/osteria_guests_demo.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp osteria_resos_demo.csv ~
cp osteria_guests_demo.csv ~

cd ~/importer/server

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3692 -g ../../osteria_resos_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"


./run_importer.sh -e demo -b 3692 -g ../../osteria_guests_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------
