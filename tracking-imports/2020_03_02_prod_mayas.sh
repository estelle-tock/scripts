# --------------------- DETAILS --------------------------
# Business Name - Mayas New Orleans 
# Final Demo - 3105
# Prod ID - 10283
# Booking System - 
# Config Type - 
# Reservation Cols - ReservationFields >  (Spot check)
# Guest Cols - GuestFields >  (Spot Check)
# Reminder Texts - Yes
# PUSH CONFIGURATIONS DEMO TO PROD
# --------------------------------------------------------


# Push configurations FROM ID (Demo) - 3063
# https://cron.tocktix.com/job/Export%20configurations/build?delay=0sec
# env = demo
# output_file = 3063.demo.proto
# business_id = 3063

# Push configurations TO ID (Final Demo) - 3105
# https://cron.tocktix.com/job/Import%20configurations/build?delay=0sec
# env = demo
# input_file = 3105.demo.proto
# business_id = 3105

# Push configurations TO ID (Prod) - 10283
# https://cron.tocktix.com/job/Import%20configurations/build?delay=0sec
# env = prod
# input_file = 10283.demo.proto
# business_id = 10283

./concat.sh ~/mayas_resos.zip ~/mayas_resos.csv

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/mayas_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH,guestTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/mayas_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp mayas_resos.csv ~

cd ~/importer/server

git checkout master

./gradlew regenerateSource shadowJar cronJar

# FINAL DEMO
./run_importer.sh -e demo -b 3105 -g ../../mayas_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH,guestTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# PRODUCTION
./run_importer.sh -e prod -b  -g ../../mayas_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH,guestTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"
