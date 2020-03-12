# --------------------- DETAILS --------------------------
# Business Name - Forage
# Demo - 3254
# Booking System - OPENTABLE_GUESTCENTER
# Config Type - Flex
# Reservation Cols - ReservationFields >  (Spot check)
# Guest Cols - GuestFields >  (Spot Check)
# Reminder Texts - Yes
# Welcome Texts - No
# PUSH CONFIGURATIONS DEMO TO SECOND DEMO
#      from: 3100
#        to: 3254
# --------------------------------------------------------

# Push configurations FROM ID (demo) - 3100
# https://cron.tocktix.com/job/Export%20configurations/build?delay=0sec
# env = demo
# output_file = 3100.demo.proto
# business_id = 3100

# Push configurations TO ID (demo 2.0) - 3254
# https://cron.tocktix.com/job/Import%20configurations/build?delay=0sec
# env = demo
# input_file = 3100.demo.proto
# business_id = 3254


./concat.sh forage_resos.zip forage_resos.csv

#LOCAL
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/forage_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"


scp -i ~/.ssh/google_compute_engine forage_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp forage_resos.csv ~

cd ~/importer/server

git pull

./gradlew regenerateSource shadowJar cronJar


#DEMO
./run_importer.sh -e demo -b 3254 -g ../../forage_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"



# computer fell asleep, disconnect from vpn, & import stopped halfway
# REMAKING DEMO SITE - 3295

# DEMO 3.0
./export_configuration.sh demo 3100 3100.demo.proto
./import_configuration.sh demo 3295 3100.demo.proto

# updating configurations from 3100 -> 3295
nohup ./run_importer.sh -e demo -b 3295 -g ../../forage_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}" &


nohup ./run_importer.sh -e demo -b 3295 -g ../../forage_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, resumeFromChunkId:113}" &


# ran nohup twice on server bc unsure if process was running ^^^^^
# REMAKING DEMO SITE - 3298

# DEMO 4.0

# updating configurations from 3100 -> 3298
./export_configuration.sh demo 3100 3100.demo.proto
./import_configuration.sh demo 3298 3100.demo.proto

nohup ./run_importer.sh -e demo -b 3298 -g ../../forage_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}" &

