# --------------------- DETAILS --------------------------
# Business Name - Cellar Door
# Demo -
# Booking System - YELP
# Config Type - Flex
# Reservation Cols - ReservationFields >  (Spot check)
# Guest Cols - GuestFields >  (Spot Check)
# Reminder Texts - Yes
# Welcome Texts - No
# PUSH CONFIGURATIONS DEMO TO PROD
#       from: 10659
#         to: 3229
# --------------------------------------------------------

./concat.sh ~/cellardoor_resos.zip ~/cellardoor_resos.csv

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/cellardoor_guests.csv
--reso_csv=/Users/estelle/cellardoor_resos.csv
--config_json="{formatVersion:YELP,separator:',', resoDateFormat:M_D_YYYY_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/cellardoor_guests.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine ~/cellardoor_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp cellardoor_guests.csv ~ && cp cellardoor_resos.csv ~

cd ~/importer/server

git checkout master

./gradlew regenerateSource shadowJar cronJar

./export_configuration.sh prod 10659 10659.prod.proto
./import_configuration.sh demo 3229 10659.prod.proto

# DEMO
./run_importer.sh -e demo -b 3229 -g ../../cellardoor_guests.csv -r ../../cellardoor_resos.csv -c "{formatVersion:YELP,separator:',', resoDateFormat:M_D_YYYY_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"