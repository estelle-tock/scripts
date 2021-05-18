# ------------------------------------------------
# -               IMPORT COMMANDS                -
# ------------------------------------------------
# To Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/blue_duck_tavern_prod.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# in server/scripts/importer
./concat.sh ~/downloads/blue_duck_tavern_prod.zip ~/blue_duck_tavern_prod.csv

scp -i ~/.ssh/google_compute_engine ~/blue_duck_tavern_prod.csv importer@eng-imports-0:~/trashcan && ssh -i ~/.ssh/google_compute_engine importer@eng-imports-0

cd workspace/admin/server

# staging
nohup ./run_importer.sh -e staging -b 28649 -g ~/trashcan/blueducktavern_demo.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &

# second site
scp -i ~/.ssh/google_compute_engine ~/BlueDuckTavern_MissingResosV2.csv importer@eng-imports-0:~/trashcan && ssh -i ~/.ssh/google_compute_engine importer@eng-imports-0

nohup ./run_importer.sh -e staging -b 28978 -g ~/trashcan/BlueDuckTavern_MissingResosV2.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &


# third import
nohup ./run_importer.sh -e staging -b 29022 -g ~/trashcan/blue_duck_tavern_prod.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &

# ran it twice

# fourth import with same data into demo
nohup ./run_importer.sh -e demo -b 5117 -g ~/trashcan/blue_duck_tavern_prod.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &

# fifth import with same data into demo
nohup ./run_importer.sh -e demo -b 5141 -g ~/trashcan/blue_duck_tavern_prod.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &

# last demo import with no katina bell into demo
nohup ./run_importer.sh -e demo -b 5166 -g ~/trashcan/blue_duck_tavern_reimport_no_katina.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------

# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

start time 
end time 

file lines 798234