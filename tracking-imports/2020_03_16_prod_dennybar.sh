# ------------------- INSTRUCTIONS ------------------------
#
# (Cmd + Shift + F) -> <??____??> -> actual value
# or run ./createRunCommands.sh to auto-fill
#
# ----------------- BUSINESS DETAILS ----------------------
#
# Business Name - Denny Bar
# Demo ID - 3192
# Prod ID - 10689
# Reminder Texts - true
# Welcome Texts - false
# Export Configurations - y 
#
# ------------------- DATA DETAILS -----------------------
#
# Booking System - RESY
# Ticket Type - ticketTypeName: 
# Config Type - Flex
# Reso Date Format - YYYY_M_D_DASH
# Reso Time Format - HH_MM_SS
# Waitlist Date Format - YYY_M_D_DASH
# Waitlist Time Format - HH_MM_SS
# Reservation file name - dennybar_prod_resos 
# Guest file name - dennybar_prod_guests
# Waitlist file name - dennybar_prod_waitlist
# Export Business ID - 10689
# Import Business ID - 3192
#
# --------------------------------------------------------


# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------

# Check headers & adjust appropriately to Import Job Formatter on Mac Numbers

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/dennybar_prod_guests.csv
--reso_csv=/Users/estelle/dennybar_prod_resos.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# Run Locally (WAITLISTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/dennybar_prod_waitlist.csv
--reso_csv=/Users/estelle/empty.txt
--config_json= "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYY_M_D_DASH ,resoTimeFormat:HH_MM_SS,fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}]}"

scp -i ~/.ssh/google_compute_engine ~/dennybar_prod_guests.csv estelle@crawl-server:~/ && 
scp -i ~/.ssh/google_compute_engine ~/dennybar_prod_resos.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/dennybar_prod_waitlist.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp dennybar_prod_resos.csv ~ && cp dennybar_prod_guests.csv ~ && cp dennybar_prod_waitlist.csv ~

cd ~/importer/server

# [Optional] Jenkins Cron for export/import configs
# https://cron.tocktix.com/job/Export%20configurations/build?delay=0sec

# export configs from prod to demo
./export_configuration.sh prod 10689 10689.prod.proto
./import_configuration.sh demo 3192 10689.prod.proto

# check dashboard-demo.exploretock.com for tables at ID 3192

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3192 -g ../../dennybar_prod_guests.csv -r ../../dennybar_prod_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# FINAL DEMO (WAITLIST)
./run_importer.sh -e demo -b 3192 -g ../../dennybar_prod_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYY_M_D_DASH, resoTimeFormat:HH_MM_SS, fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}]}"

# ------------------------------------------------
# -                 PRODUCTION                   -
# ------------------------------------------------

# Must Check BEFORE PROD:
#  [ x ] Pushed configurations? (if necessary)
#  [ x ] Enabled/Disabled Welcome Texts? (-t true)
#  [ x ] No extra guests or reservations in dashboard prod? (unless AM says ok)
#  [ x ] BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#  [ x ] If LARGE file, use nohup to run in background & DO NOT RE-RUN

# PRODUCTION (RESOS & GUESTS)
./run_importer.sh -e prod -b 10689 -g ../../dennybar_prod_guests.csv -r ../../dennybar_prod_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}" -t false

# PRODUCTION (WAITLIST)
./run_importer.sh -e prod -b 10689 -g ../../dennybar_prod_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYY_M_D_DASH, resoTimeFormat:HH_MM_SS, fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}]}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
