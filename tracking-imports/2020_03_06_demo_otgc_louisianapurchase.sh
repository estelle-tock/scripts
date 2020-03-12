# --------------------- DETAILS --------------------------
# Business Name - Louisiana Purchase - San Diego
# Demo - 3301
# Booking System - OPENTABLE_GUESTCENTER
# Config Type - Flex
# Reminder Texts - Yes
# Welcome Texts - Yes (DO NOT PUSH FOR DEMO)
# --------------------------------------------------------

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/lou_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/lou_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp lou_resos.csv ~

cd ~/importer/server

# DEMO
./run_importer.sh -e demo -b 3301 -g ../../lou_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"
