# ------------------------------------------------
# -               IMPORT COMMANDS                -
# ------------------------------------------------

# To Run Locally
# It's useful to run the file locally to make sure your config commands are correct before running on the server

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/<file_name>.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# if the import has multiple files, download all as a zip and run concat script to generate one file
# in server/scripts/importer
./concat.sh ~/downloads/<file_name>.zip ~/<file_name>.csv

# we copy the file to the ~/trashcan because that dir gets cleaned out every 30 days automatically
scp -i ~/.ssh/google_compute_engine ~/<file_name>.csv importer@eng-imports-0:~/trashcan && ssh -i ~/.ssh/google_compute_engine importer@eng-imports-0

cd workspace/admin/server

git fetch --all --tags

# you can find the latest_api-server-big_deployment build number in #push-cafe channel topic or 
# Jenkins > ApiServer Restart import server > latest build number > Parameters
git checkout tags/version_<latest_api-server-big_deployment> -b <yourname>/version_<latest_api-server-big_deployment>

# rebuild the jar on your server
./gradlew regenerateSource cronJar shadowJar

# Demo
# let the #production-team know in slack you are starting a large demo import
# make sure all configurations are correct

# DEMO - double file example
nohup ./run_importer.sh -e demo -b 5715 -g ~/trashcan/marble_guests.csv  -r ~/trashcan/marble_resos.csv -c "{formatVersion:DOUBLE_FILE, separator: ',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A,resoCreationDate:M_D_YY, resoCreationTimeFormat:H_M_A,guestDateFormat: M_D_YYYY, smsReminderEnabled: true, guestFullNameOrder:FIRST_LAST,resoFullNameOrder:FIRST_LAST, allowReimport:false,startFromChunkId:102}" &

# PROD -  DOUBLE CHECK PROD ID!!!!!!!!!
# let the #production-team know in slack you are starting a large prod import
nohup ./run_importer.sh -e prod -b 23731 -g ~/trashcan/marble_guests.csv  -r ~/trashcan/marble_resos.csv -c "{formatVersion:DOUBLE_FILE, separator: ',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A,resoCreationDate:M_D_YY, resoCreationTimeFormat:H_M_A,guestDateFormat: M_D_YYYY, smsReminderEnabled: true, guestFullNameOrder:FIRST_LAST,resoFullNameOrder:FIRST_LAST, allowReimport:false,startFromChunkId:102}" &


nohup ./run_importer.sh -e prod -b 23731 -g ~/trashcan/marble_guests.csv  -r ~/trashcan/marble_resos.csv -c "{formatVersion:DOUBLE_FILE, separator: ',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A,resoCreationDate:M_D_YY, resoCreationTimeFormat:H_M_A,guestDateFormat: M_D_YYYY, smsReminderEnabled: true, guestFullNameOrder:FIRST_LAST,resoFullNameOrder:FIRST_LAST, allowReimport:false,startFromChunkId:103}" &
# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------

# ------------------- METRICS --------------------
# Start Time: 
# End Time: 
# File Lines: 
# ------------------------------------------------

# -------- UPDATE SALESFORCE REMINDERS -----------
# Paste nohup command into sf case or upload this file
# Update Import Status to "Demo Completed" or "Prod Completed"
# ------------------------------------------------