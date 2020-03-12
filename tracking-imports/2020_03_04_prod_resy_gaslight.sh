# --------------------- DETAILS --------------------------
# Business Name - Gaslight
# Final Demo - 3148
# Prod ID - 10632
# Booking System - RESY
# Config Type - Flex
# Reservation Cols - ReservationFields > Resy (Spot check)
# Guest Cols - GuestFields > Resy (Spot Check)
# Reminder Texts - Yes
# Welcome Texts - No
# --------------------------------------------------------

./concat.sh ~/gaslight_resos.zip ~/gaslight_resos.csv

# added "source" column before "table seated at"

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/gaslight_guests.csv
--reso_csv=/Users/estelle/gaslight_resos.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/gaslight_guests.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine ~/gaslight_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp gaslight_guests.csv ~ && cp gaslight_resos.csv ~

cd ~/importer/server

git checkout master

./gradlew regenerateSource shadowJar cronJar

# FINAL DEMO
./run_importer.sh -e demo -b 3148 -g ../../gaslight_guests.csv -r ../../gaslight_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"


# PRODUCTION
./run_importer.sh -e prod -b 10632 -g ../../gaslight_guests.csv -r ../../gaslight_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"
