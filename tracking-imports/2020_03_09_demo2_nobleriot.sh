# --------------------- DETAILS --------------------------
# Business Name - Noble Riot
# Demo - 3318
# Booking System - OPENTABLE_GUESTCENTER
# Config Type - Flex
# Reminder Texts - Yes
# Welcome Texts - No
# PUSH CONFIGURATIONS PROD TO DEMO
#       from: 10776
#         to: 3318
# --------------------------------------------------------

./concat.sh ~/noble_resos.zip ~/noble_resos.csv

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/noble_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/noble_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp noble_resos.csv ~

cd ~/importer/server

git checkout master

./gradlew regenerateSource shadowJar cronJar

# Optional Jenkins Cron for export/import configs
# https://cron.tocktix.com/job/Export%20configurations/build?delay=0sec

# prod to demo
./export_configuration.sh prod 10776 10776.prod.proto
./import_configuration.sh demo 3318 10776.prod.proto

# DEMO
./run_importer.sh -e demo -b 3318 -g ../../noble_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"
