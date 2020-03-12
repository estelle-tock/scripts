# --------------------- DETAILS --------------------------
# Business Name - La Masa
# Final Demo - 2768
# Prod ID - 9457
# Booking System - OPENTABLE_GUESTCENTER
# Config Type - Flex
# Reminder Texts - No
# Welcome Texts - No
# PUSH CONFIGURATIONS DEMO TO PROD
#       from: 2767
#         to: 2768
#         to: 9457
# --------------------------------------------------------

./concat.sh ~/lamasa_resos.zip ~/lamasa_resos.csv

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/lamasa_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/lamasa_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp lamasa_resos.csv ~

cd ~/importer/server

# Optional Jenkins Cron for export/import configs
# https://cron.tocktix.com/job/Export%20configurations/build?delay=0sec

# demo to final demo
./export_configuration.sh demo 2767 2767.demo.proto
./import_configuration.sh demo 2768 2767.demo.proto

# FINAL DEMO
./run_importer.sh -e demo -b 2768 -g ../../lamasa_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# missing one record because of missing ^M at the end of a line (line before Savannah Larson)
# uploading just one record

scp -i ~/.ssh/google_compute_engine ~/lamasa_one.csv estelle@crawl-server:~/

./run_importer.sh -e demo -b 2768 -g ../../lamasa_one.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"


./import_configuration.sh prod 9457 2767.demo.proto

# Must Check BEFORE PROD:
#    PUSHED CONFIGURATIONS FOR PROD (if necessary)
#    ENABLED/DISABLED WELCOME TEXTS (-t true)
#    NO GUESTS OR RESERVATIONS in dashboard prod (unless AM says ok)
#    BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#    IF BIG FILE USE nohup TO RUN IN BACKGROUND & DO NOT RE-RUN

# PRODUCTION
./run_importer.sh -e prod -b 9457 -g ../../lamasa_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"

./run_importer.sh -e prod -b 9457 -g ../../lamasa_one.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"
