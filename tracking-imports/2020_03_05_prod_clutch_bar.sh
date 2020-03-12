# --------------------- DETAILS --------------------------
# Business Name - Clutch Bar
# Final Demo - 3160
# Prod ID - 8717
# Booking System - OPENTABLE_GUESTCENTER
# Config Type - Flex
# Reminder Texts - Yes
# Welcome Texts - YES
# PUSH CONFIGURATIONS
#       from: 3159 (demo)
#         to: 3160 (final demo)
#         to: 8717 (prod)
# --------------------------------------------------------

# Optional Jenkins Cron for export/import configs
# https://cron.tocktix.com/job/Export%20configurations/build?delay=0sec

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/clutchbar_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH,guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/clutchbar_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp clutchbar_resos.csv ~

cd ~/importer/server

git checkout master

./gradlew regenerateSource shadowJar cronJar

./export_configuration.sh demo 3159 3159.demo.proto
./import_configuration.sh demo 3160 3159.demo.proto

# FINAL DEMO
./run_importer.sh -e demo -b 3160 -g ../../clutchbar_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH,guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"


# PRODUCTION
./import_configuration.sh prod 8717 3159.demo.proto

# Must Check BEFORE PROD:
#    PUSHED CONFIGURATIONS FOR PROD (if necessary)
#    ENABLED/DISABLED WELCOME TEXTS (-t true)
#    NO GUESTS OR RESERVATIONS in dashboard prod (unless AM says ok)
#    BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#    IF BIG FILE USE nohup TO RUN IN BACKGROUND & DO NOT RE-RUN

./run_importer.sh -e prod -b 8717 -g ../../clutchbar_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH,guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}" -t true
