# ------------------- INSTRUCTIONS ------------------------
#
# (Cmd + Shift + F) -> <??____??> -> actual value
# or run ./createRunCommands.sh to auto-fill
#
# ----------------- BUSINESS DETAILS ----------------------
#
# Business Name - Alma
# Demo ID - 3443
# Prod ID - 12872
# Reminder Texts - true
# Welcome Texts - false
# Export Configurations - y 
#
# ------------------- DATA DETAILS -----------------------
#
# Booking System - OPENTABLE_GUEST_CENTER
# Config Type - Flex
# Reso Date Format - YYYY_M_D_DASH
# Reso Time Format - H_M_A
# Waitlist Date Format - 
# Waitlist Time Format - 
# Reservation file name - chinois_resos_prod 
#
# --------------------------------------------------------


# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
./concat.sh ~/chinois_resos_prod ~/chinois_resos_prod.csv

# tags too long, needed to add tags limit to code

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/chinois_resos_prod.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/chinois_resos_prod.csv estelle@crawl-server:~/ 

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp chinois_resos_prod.csv

cd ~/importer/server

# check dashboard-demo.exploretock.com for tables at ID 3443

# FINAL DEMO (RESOS & GUESTS)
nohup ./run_importer.sh -e demo -b 3443 -g ../../chinois_resos_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}" &


# Must Check BEFORE PROD:
#  [ ] Pushed configurations? (if necessary)
#  [ ] Enabled/Disabled Welcome Texts? (-t true)
#  [ ] No extra guests or reservations in dashboard prod? (unless AM says ok)
#  [ ] BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#  [ ] If LARGE file, use nohup to run in background & DO NOT RE-RUN


# PROD
nohup ./run_importer.sh -e prod -b 12872 -g ../../chinois_resos_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

(conn=958332) Duplicate entry '12872-2013-01-28' for key 'index_service_day_on_business_id_and_service_date'

nohup ./run_importer.sh -e prod -b 12872 -g ../../chinois_resos_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:4}"&

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------

# mhbell@mac.com
# rivastavo@aol.com
# edgarmmm@hotmail.com
# lasuma@mac.com
# samoanb7@gmail.com
# ryan.fisher@fairmont.com
# kgraiwer@yahoo.com
# michaeltfox@gmail.com
# mfox@loewshotels.com
# dolphinsday@yahoo.com
# belleosorio@gmail.com
# tharam7@gmail.com
# amber.smith3@fairmont.com
# kirk.honda@fairmont.com
# casey.duggan@viceroyhotelsandresorts.com
# norton@thehuntleyhotel.com
# kyle.vanleeuwen@fairmont.com
# miramar.concierge@fairmont.com
# drrevenue@drrevenue.com
# andrade5@pacbell.net
# gwen4re@aol.com
# daniela.ortiz@fairmont.com
# jessicalberger@gmail.com
# Concierges 23


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
