# ------------------- INSTRUCTIONS ------------------------
#
# (Cmd + Shift + F) -> <??____??> -> actual value
# or run ./createRunCommands.sh to auto-fill
#
# ----------------- BUSINESS DETAILS ----------------------
#
# Business Name - Carbon County
# Demo ID - 3471
# Prod ID - 
# Reminder Texts - false
# Welcome Texts - false
# Export Configurations - y 
#
# ------------------- DATA DETAILS -----------------------
#
# Booking System - YELP
# Ticket Type - ticketTypeName: 
# Config Type - Flex
# Reso Date Format - M_D_YY
# Reso Time Format - H_M_A
# Waitlist Date Format - 
# Waitlist Time Format - 
# Reservation file name - carbon_resos 
# Guest file name - carbon_guests
# Waitlist file name - 
# Export Business ID - 10667
# Import Business ID - 3347
# Import Business ID - <??import_2_business_id??>
#
# --------------------------------------------------------

./concat.sh ~/carbon_resos_05_05.zip ~/carbon_resos_05_05.csv

# Check headers & adjust appropriately to Import Job Formatter on Mac Numbers

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/carbon_guests_05_05.csv
--reso_csv=/Users/estelle/carbon_resos_05_05.csv
--config_json="{formatVersion:YELP,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/carbon_guests_05_05.csv estelle@crawl-server:~/ && 
scp -i ~/.ssh/google_compute_engine ~/carbon_resos_05_05.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp carbon_guests_05_05.csv ~ && cp carbon_resos_05_05.csv ~

cd ~/importer/server

# [Optional] Jenkins Cron for export/import configs
# https://cron.tocktix.com/job/Export%20configurations/build?delay=0sec

# export configs from prod to demo
./export_configuration.sh prod 10667 10667.prod.proto
./import_configuration.sh demo 3471 10667.prod.proto

# check dashboard-demo.exploretock.com for tables at ID 3471

# DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3471 -g ../../carbon_guests_05_05.csv -r ../../carbon_resos_05_05.csv -c "{formatVersion:YELP,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: false }"


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update Status
# Update with number of lines in each file
# Update with number of records imported for resos (Reports > Item Sales > 2000-01-01 to today)
# Update with number of records imported for guests (Guests tab)
# Update with number of records imported for waitlist (Operations > Waitlist)
# Pick out some guests and make sure they're in dashboard
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------