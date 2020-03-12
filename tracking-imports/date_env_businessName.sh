# ------------------- INSTRUCTIONS ------------------------
#
# (Cmd + Shift + F) -> <??____??> -> actual value
#
# ----------------- BUSINESS DETAILS ----------------------
#
# Business Name - 
# Final Demo - CHECK SALESFORCE
# Prod ID - CHECK SALESFORCE
# Reminder Texts - <??reminder_texts_bool??> (true/false)
# Welcome Texts - <??welcome_texts_bool??> (-t true)
# Export Configurations - true/false
#
# ------------------- DATA DETAILS -----------------------
#
# Booking System - <??booking_system??>
# Ticket Type - <??ticket_type??>
# Config Type - Flex/Slot
# Reso Date Format - <??reso_date_format??> (YYYY_M_D_DASH, M_D_YY)
# Reso Time Format - <??reso_time_format??> (HH_MM_SS, H_M_A)
# Waitlist Date Format - <??waitlist_date_format??> (YYYY_M_D_DASH, M_D_YY)
# reservation file name - <??business_resos??> 
# guest file name - <??business_guests??>
# waitlist file name - <??business_waitlist??>
# Export Business ID - <??export_business_id??>
# Import Business ID - <??import_business_id??>
# Import Business ID - <??import_2_business_id??>
#
# --------------------------------------------------------


# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
./concat.sh ~/<??business_resos??>.zip ~/<??business_resos??>.csv

# Check headers & adjust appropriately to Import Job Formatter on Mac Numbers

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/<??business_guests??>.csv
--reso_csv=/Users/estelle/<??business_resos??>.csv
--config_json="{formatVersion:<??booking_system??>,separator:',', resoDateFormat:<??reso_date_format??>,resoTimeFormat:<??reso_time_format??>, quoteDetectionEnabled: false, smsReminderEnabled: <??reminder_texts_bool??>, ticketTypeName: '<??ticket_type??>'}"

# Run Locally (WAITLISTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/<??business_waitlist??>.csv
--reso_csv=/Users/estelle/empty.txt
--config_json= "{formatVersion:WAITLIST,separator:',',guestDateFormat:<??waitlist_date_format??> ,  fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}], ticketTypeName: '<??ticket_type??>'}"

scp -i ~/.ssh/google_compute_engine ~/<??business_guests??>.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine ~/<??business_resos??>.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine ~/<??business_waitlist??>.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp <??business_resos??>.csv ~ && cp <??business_guests??>.csv ~ && cp <??business_waitlist??>.csv ~

cd ~/importer/server

# Optional Jenkins Cron for export/import configs
# https://cron.tocktix.com/job/Export%20configurations/build?delay=0sec

# export configs from demo to final demo
./export_configuration.sh demo <??export_business_id??> <??export_business_id??>.demo.proto
./import_configuration.sh demo <??import_business_id??> <??export_business_id??>.demo.proto

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b  -g ../../<??business_guests??>.csv -r ../../<??business_resos??>.csv -c "{formatVersion:<??booking_system??>,separator:',', resoDateFormat:<??reso_date_format??>,resoTimeFormat:<??reso_time_format??>, quoteDetectionEnabled: false, smsReminderEnabled: <??reminder_texts_bool??>, ticketTypeName: '<??ticket_type??>'}"

# FINAL DEMO (WAITLIST)
./run_importer.sh -e demo -b  -g ../../<??business_waitlist??>.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:<??waitlist_date_format??> ,  fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}], ticketTypeName: '<??ticket_type??>'}"

# ------------------------------------------------
# -                 PRODUCTION                   -
# ------------------------------------------------

# export configs from demo to prod 
./import_configuration.sh prod <??import_2_business_id??> <??export_business_id??>.demo.proto

# Must Check BEFORE PROD:
#  [ ] Pushed configurations? (if necessary)
#  [ ] Enabled/Disabled Welcome Texts? (-t true)
#  [ ] No extra guests or reservations in dashboard prod? (unless AM says ok)
#  [ ] BUSINESS ID FOR PRODUCTION IS THE RIGHT ONE (!!!!!)
#  [ ] If LARGE file, use nohup to run in background & DO NOT RE-RUN

# PRODUCTION (RESOS & GUESTS)
./run_importer.sh -e prod -b  -g ../../<??business_guests??>.csv -r ../../<??business_resos??>.csv -c "{formatVersion:<??booking_system??>,separator:',', resoDateFormat:<??reso_date_format??>,resoTimeFormat:<??reso_time_format??>, quoteDetectionEnabled: false, smsReminderEnabled: <??reminder_texts_bool??>, ticketTypeName: '<??ticket_type??>'}" <??welcome_texts_bool??>

# PRODUCTION (WAITLIST)
./run_importer.sh -e prod -b  -g ../../<??business_waitlist??>.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:<??waitlist_date_format??> ,  fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}], ticketTypeName: '<??ticket_type??>'}"


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
