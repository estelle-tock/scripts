# ------------------- INSTRUCTIONS ------------------------
#
# (Cmd + Shift + F) -> <??____??> -> actual value
# or run ./createRunCommands.sh to auto-fill
#
# ----------------- BUSINESS DETAILS ----------------------
#
# Business Name - Loquita
# Demo ID - 3512
# Prod ID - 14460
# Reminder Texts - true
# Welcome Texts - false
# Export Configurations - n 
#
# ------------------- DATA DETAILS -----------------------
#
# Booking System - RESY
# Ticket Type - ticketTypeName: 
# Config Type - 
# Reso Date Format - YYYY_M_D_DASH
# Reso Time Format - HH_MM_SS
# Waitlist Date Format - 
# Waitlist Time Format - 
# Reservation file name - loquita_resos 
# Guest file name - loquita_guests
# Waitlist file name - 
# Export Business ID - 
# Import Business ID - 
# Import Business ID - <??import_2_business_id??>
#
# --------------------------------------------------------


# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
./concat.sh ~/loquita_resos.zip ~/loquita_resos.csv

# reservation add source column before table_seated_at
# guest renaming columns to resy format

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/loquita_guests.csv
--reso_csv=/Users/estelle/loquita_resos.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true }"

scp -i ~/.ssh/google_compute_engine ~/loquita_guests.csv estelle@crawl-server:~/ && 
scp -i ~/.ssh/google_compute_engine ~/loquita_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp loquita_resos.csv ~ && cp loquita_guests.csv ~

cd ~/importer/server


# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3512 -g ../../loquita_guests.csv -r ../../loquita_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------

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
