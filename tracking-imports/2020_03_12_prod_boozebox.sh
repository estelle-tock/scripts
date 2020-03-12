# ----------------- BUSINESS DETAILS ----------------------
#
# Business Name - Booze Box
# Final Demo - CHECK SALESFORCE
# Prod ID - CHECK SALESFORCE
# Reminder Texts - true (true/false)
# Welcome Texts - false (-t true/false)
#
# ------------------- DATA DETAILS -----------------------
#
# Booking System - RESY
# Ticket Type - Booze Box
# Config Type - Flex/Slot
# Reso Date Format - YYYY_M_D_DASH (YYYY_M_D_DASH, M_D_YY)
# Reso Time Format - HH_MM_SS (HH_MM_SS, H_M_A)
# Waitlist Date Format - YYYY_M_D_DASH (YYYY_M_D_DASH, M_D_YY)
# reservation file name: boozebox_resos 
# guest file name: boozebox_guests
# waitlist file name: boozebox_waitlist
#
# --------------------------------------------------------

# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
./concat.sh ~/boozebox_resos.zip ~/boozebox_resos.csv

# added source before table_seated_at column

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/boozebox_guests.csv
--reso_csv=/Users/estelle/boozebox_resos.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Booze Box'}"

# Run Locally (WAITLISTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/boozebox_waitlist.csv
--reso_csv=/Users/estelle/empty.txt
--config_json= "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH , resoTimeFormat:HH_MM_SS, fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}]}"

scp -i ~/.ssh/google_compute_engine ~/boozebox_guests.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine ~/boozebox_resos.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine ~/boozebox_waitlist.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp boozebox_guests.csv ~ && cp boozebox_resos.csv ~ && cp boozebox_waitlist.csv ~

cd ~/importer/server

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3374 -g ../../boozebox_guests.csv -r ../../boozebox_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Booze Box'}"

# FINAL DEMO (WAITLIST)
./run_importer.sh -e demo -b 3374 -g ../../boozebox_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH , resoTimeFormat:HH_MM_SS, fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}], ticketTypeName: 'Booze Box'}"


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
./run_importer.sh -e prod -b 10266 -g ../../boozebox_guests.csv -r ../../boozebox_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Booze Box'}"

# PRODUCTION (WAITLIST)
./run_importer.sh -e prod -b 10266 -g ../../boozebox_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH , resoTimeFormat:HH_MM_SS, fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}], ticketTypeName: 'Booze Box'}"


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------

# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------
