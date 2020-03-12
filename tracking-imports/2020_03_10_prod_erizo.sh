# --------------------- DETAILS --------------------------
# Business Name - Erizo Portland
# Final Demo - 3314
# Prod ID - 10398
# Booking System - RESY
# Config Type - Flex
# Reminder Texts - Yes
# Welcome Texts - No
# --------------------------------------------------------

# added "source" column before "table seated at"

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/erizo_guests.csv
--reso_csv=/Users/estelle/erizo_resos.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/erizo_guests.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine ~/erizo_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp erizo_guests.csv ~ && cp erizo_resos.csv ~

cd ~/importer/server

# FINAL DEMO
./run_importer.sh -e demo -b 3314 -g ../../erizo_guests.csv -r ../../erizo_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# Must Check BEFORE PROD:
#    PUSHED CONFIGURATIONS FOR PROD (if necessary)
#    ENABLED/DISABLED WELCOME TEXTS (-t true)
#    NO GUESTS OR RESERVATIONS in dashboard prod (unless AM says ok)
#    BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#    IF BIG FILE USE nohup TO RUN IN BACKGROUND & DO NOT RE-RUN

# PRODUCTION
./run_importer.sh -e prod -b 10398 -g ../../erizo_guests.csv -r ../../erizo_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"
