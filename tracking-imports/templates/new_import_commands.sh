# ------------------------------------------------
# -               IMPORT COMMANDS                -
# ------------------------------------------------
# To Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/businessName_env_businessId.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# in server/scripts/importer
./concat.sh ~/downloads/businessName_env_businessId.zip ~/businessName_env_businessId.csv

scp -i ~/.ssh/google_compute_engine ~/businessName_env_businessId.csv importer@eng-imports-0:~/trashcan && ssh -i ~/.ssh/google_compute_engine importer@eng-imports-0

cd workspace/admin/server

# Demo
#nohup ./run_importer.sh -e demo -b <DEMO_ID> -g ~/trashcan/businessName_env_businessId.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &


# Prod - DOUBLE CHECK PROD ID!!!!
#nohup ./run_importer.sh -e prod -b <PROD_ID> -g ~/trashcan/businessName_env_businessId.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------

# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# start time 
# end time 

# file lines 