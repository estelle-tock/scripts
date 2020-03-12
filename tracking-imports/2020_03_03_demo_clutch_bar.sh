# --------------------- DETAILS --------------------------
# Business Name - Clutch Bar
# Demo - 3159
# Booking System - OPENTABLE_GUESTCENTER
# Config Type - Flex
# Reservation Cols - opentable > OpenTableGuestCenterFields(Spot check)
# Reminder Texts - Yes
# Welcome Texts - No (only yes if in prod)
# --------------------------------------------------------

# Column •ÈÀ"Visit Date" rename to Visit Date

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/clutch_bar_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY,guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/clutch_bar_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp clutch_bar_resos.csv ~

cd ~/importer/server

git checkout master

./gradlew regenerateSource shadowJar cronJar

# DEMO
./run_importer.sh -e demo -b 3159 -g ../../clutch_bar_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY,guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"
