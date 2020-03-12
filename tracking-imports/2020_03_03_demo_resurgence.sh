# --------------------- DETAILS --------------------------
# Business Name - Resurgence
# Demo - 3194
# Booking System - OPENTABLE_CUSTOM
# Config Type - Flex
# Reservation Cols - ReservationFields >  (Spot check)
# Guest Cols - GuestFields >  (Spot Check)
# Reminder Texts - Yes
# PUSH CONFIGURATIONS DEMO TO PROD
# --------------------------------------------------------

# Push configurations FROM ID (<from_env>) - <from_id>
# https://cron.tocktix.com/job/Export%20configurations/build?delay=0sec
# env = <from_env>
# output_file = <from_id.demo.proto>
# business_id = <from_id>

# Push configurations TO ID (<to_env>) - <to_id>
# https://cron.tocktix.com/job/Import%20configurations/build?delay=0sec
# env = <to_env>
# input_file = <to_id>.demo.proto
# business_id = <to_id>

# Push configurations TO ID (<to_env_2>) - <to_id_2>
# https://cron.tocktix.com/job/Import%20configurations/build?delay=0sec
# env = <to_env_2>
# input_file = <to_id_2>.demo.proto
# business_id = <to_id_2>

./concat.sh ~/business_resos.zip ~/business_resos.csv

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/business_guests.csv
--reso_csv=/Users/estelle/business_resos.csv
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/business_guests.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine ~/business_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp business_guests.csv ~ && cp business_resos.csv ~

cd ~/importer/server

git checkout master

./gradlew regenerateSource shadowJar cronJar

# FINAL DEMO
./run_importer.sh -e demo -b  -g ../../business_guests.csv -r ../../business_resos.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# PRODUCTION
./run_importer.sh -e prod -b  -g ../../business_guests.csv -r ../../business_resos.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"
