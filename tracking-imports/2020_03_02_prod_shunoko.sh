# Shunoko
# Final Demo - 2975
# Prod ID - 10198
# Booking System - Resy
# Config Type - Flex
# Reservation Cols - ReservationFields > Resy (Spot check)
# Guest Cols - GuestFields > Resy (Spot Check)

./concat.sh ~/shunoko_resos.zip ~/shunoko_resos.csv

# Manual file modifications
# Renamed "table_seated_at" to "source"
# Added column header to last column named "table_seated_at"

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/shunoko_guests.csv
--reso_csv=/Users/estelle/shunoko_resos.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/shunoko_guests.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine ~/shunoko_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp shunoko_guests.csv ~ && cp shunoko_resos.csv ~

cd ~/importer/server

git checkout master

./gradlew regenerateSource shadowJar cronJar

# FINAL DEMO
./run_importer.sh -e demo -b 2975 -g ../../shunoko_guests.csv -r ../../shunoko_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# PRODUCTION
./run_importer.sh -e prod -b 10198 -g ../../shunoko_guests.csv -r ../../shunoko_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"