# --------------------- DETAILS --------------------------
# Business Name - Louisiana Purchase
# Final Demo - 3302
# Final Demo 2.0 - 3336
# Prod ID - 10584
# Booking System - OPENTABLE_GUESTCENTER
# Config Type - Flex
# Reminder Texts - Yes
# Welcome Texts - Yes
# --------------------------------------------------------

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/louisianapurchase_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/louisianapurchase_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp louisianapurchase_resos.csv ~

cd ~/importer/server

# FINAL DEMO
./run_importer.sh -e demo -b 3302 -g ../../louisianapurchase_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"

#------------------------------------------------------------------
# new file added & new demo site created
# final demo 2 - 3336

scp -i ~/.ssh/google_compute_engine ~/louisianapurchase_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp louisianapurchase_resos.csv ~

cd ~/importer/server

# FINAL DEMO 2.0
./run_importer.sh -e demo -b 3336 -g ../../louisianapurchase_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# Must Check BEFORE PROD:
#    PUSHED CONFIGURATIONS FOR PROD (if necessary)
#    ENABLED/DISABLED WELCOME TEXTS (-t true)
#    NO GUESTS OR RESERVATIONS in dashboard prod (unless AM says ok)
#    BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#    IF BIG FILE USE nohup TO RUN IN BACKGROUND & DO NOT RE-RUN

# PRODUCTION
./run_importer.sh -e prod -b 10584 -g ../../louisianapurchase_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}" -t true
