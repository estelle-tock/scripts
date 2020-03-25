# ------------------- INSTRUCTIONS ------------------------
#
# (Cmd + Shift + F) -> <??____??> -> actual value
# or run ./createRunCommands.sh to auto-fill
#
# ----------------- BUSINESS DETAILS ----------------------
#
# Business Name - Barnette Vinyards
# Demo ID - 3311
# Prod ID - 
# Reminder Texts - false
# Welcome Texts - false
# Export Configurations - n 
#
# ------------------- DATA DETAILS -----------------------
#
# Booking System - OPENTABLE_ERB
# Ticket Type - ticketTypeName: 
# Config Type - slot
# Reso Date Format - 
# Reso Time Format - 
# Waitlist Date Format - 
# Waitlist Time Format - 
# Reservation file name -  
# Guest file name - barnette_guests.csv
# Waitlist file name - 
# Export Business ID - 
# Import Business ID - 
# Import Business ID - <??import_2_business_id??>
#
# --------------------------------------------------------


# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/barnette_guests.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_ERB,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: false}"


# ( set a breakpoint in the code to see what's happening )

# converted Excel to CSV using numbers manually


scp -i ~/.ssh/google_compute_engine ~/barnette_guests.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp barnette_guests.csv ~

cd ~/importer/server

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3311 -g ../../barnette_guests.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_ERB,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: false}"


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
