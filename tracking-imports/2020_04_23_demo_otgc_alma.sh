# ------------------- INSTRUCTIONS ------------------------
#
# (Cmd + Shift + F) -> <??____??> -> actual value
# or run ./createRunCommands.sh to auto-fill
#
# ----------------- BUSINESS DETAILS ----------------------
#
# Business Name - Alma
# Demo ID - 3414
# Prod ID - 
# Reminder Texts - true
# Welcome Texts - false
# Export Configurations - y 
#
# ------------------- DATA DETAILS -----------------------
#
# Booking System - OPENTABLE_GUEST_CENTER
# Ticket Type - ticketTypeName: 
# Config Type - Flex
# Reso Date Format - YYYY_M_D_DASH
# Reso Time Format - H_M_A
# Waitlist Date Format - 
# Waitlist Time Format - 
# Reservation file name - alma_resos 
# Guest file name - 
# Waitlist file name - 
# Export Business ID - 10246
# Import Business ID - 3414
# Import Business ID - <??import_2_business_id??>
#
# --------------------------------------------------------


# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
./concat.sh ~/alma_resos ~/alma_resos.csv

# tags too long, needed to add tags limit to code

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/alma_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/alma_resos.csv estelle@crawl-server:~/ 

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp alma_resos.csv

cd ~/importer/server

# export configs from prod to demo
./export_configuration.sh prod 10246 10246.prod.proto
./import_configuration.sh demo 3414 10246.prod.proto
./import_configuration.sh demo 3415 10246.prod.proto

# check dashboard-demo.exploretock.com for tables at ID 3414

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3414 -g ../../alma_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
