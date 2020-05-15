# ------------------- INSTRUCTIONS ------------------------
#
# (Cmd + Shift + F) -> <??____??> -> actual value
# or run ./createRunCommands.sh to auto-fill
#
# ----------------- BUSINESS DETAILS ----------------------
#
# Business Name - Alma Cafe / Alma Restaurant
# Demo ID - 3439
# Reminder Texts - true
# Welcome Texts - false
# Export Configurations - n 
#
# ------------------- DATA DETAILS -----------------------
#
# Booking System - OPENTABLE_GUESTCENTER
# Ticket Type - ticketTypeName: Alma Cafe
# Config Type - flex
# Reso Date Format - YYYY_M_D_DASH
# Reso Time Format - H_M_A
# Reservation file name - alma_cafe_resos
#
# --------------------------------------------------------


# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/Downloads/alma_cafe_resos_all_fixed.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Cafe Alma'}"

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/alma_restaurant_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Restaurant Alma'}"

scp -i ~/.ssh/google_compute_engine ~/alma_restaurant_resos.csv estelle@crawl-server:~/ && 
scp -i ~/.ssh/google_compute_engine ~/Downloads/alma_cafe_resos_all_fixed.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp alma_cafe_resos_all_fixed.csv ~ && cp alma_restaurant_resos.csv ~

cd ~/importer/server

# check dashboard-demo.exploretock.com for tables at ID 
./export_configuration.sh prod 10246 10246.prod.proto
./import_configuration.sh demo 3473 10246.prod.proto

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3473 -g ../../alma_cafe_resos_all_fixed.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Cafe Alma'}"

./run_importer.sh -e demo -b 3473 -g ../../alma_restaurant_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Restaurant Alma'}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
