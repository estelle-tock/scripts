# ------------------- INSTRUCTIONS ------------------------
#
# (Cmd + Shift + F) -> <??____??> -> actual value
# or run ./createRunCommands.sh to auto-fill
#
# ----------------- BUSINESS DETAILS ----------------------
#
# Business Name - Barnette Vineyards
# Demo ID - 1263
# Prod ID - 10376
# Reminder Texts - false
# Welcome Texts - false
# Export Configurations - n 
#
# ------------------- DATA DETAILS -----------------------
#
# Booking System - OPENTABLE_ERB
# Config Type - Slot
# Reso Date Format - YYYY_M_D_DASH
# Reso Time Format - HH_MM_SS
# Reservation file name - barnette_guests2.csv 
# Guest file name - empty.txt
#
# --------------------------------------------------------


# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
./concat.sh ~/barnette_guests2.csv.zip ~/barnette_guests2.csv

# converted Excel to CSV using numbers manually

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/barnette_guests2.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_ERB,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: false }"

scp -i ~/.ssh/google_compute_engine ~/barnette_guests2.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp barnette_guests2.csv ~

cd ~/importer/server

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 1263 -g ../../barnette_guests2.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_ERB,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: false }"


# ------------------------------------------------
# -                 PRODUCTION                   -
# ------------------------------------------------

# Must Check BEFORE PROD:
#  [ ] Pushed configurations? (if necessary)
#  [ ] Enabled/Disabled Welcome Texts? (-t true)
#  [ ] No extra guests or reservations in dashboard prod? (unless AM says ok)
#  [ ] BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#  [ ] If LARGE file, use nohup to run in background & DO NOT RE-RUN

# PRODUCTION (RESOS & GUESTS)
./run_importer.sh -e prod -b 10376 -g ../../barnette_guests2.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_ERB,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: false }"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------
