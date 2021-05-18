# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/rpm_italian_dc_prod_4026.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/rpm_italian_dc_prod_4026.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp rpm_italian_dc_prod_4026.csv ~

cd ~/importer/server

# FINAL DEMO (RESOS & GUESTS)
nohup ./run_importer.sh -e demo -b 3981 -g ../../rpm_italian_dc_prod_4026.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

start time 13:14:03
end time 13:33:38

# update business set is_importing=1 where id=4026;

# PROD
nohup ./run_importer.sh -e prod -b 4026 -g ../../rpm_italian_dc_prod_4026.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

#Done Inserting Chunk 64/128
#Inserting Chunk 65/128
#Exception Deadlock

nohup ./run_importer.sh -e prod -b 4026 -g ../../rpm_italian_dc_prod_4026.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:65}" &

#Done Inserting Chunk 67/128
#Inserting Chunk 68/128
#Exception Deadlock

nohup ./run_importer.sh -e prod -b 4026 -g ../../rpm_italian_dc_prod_4026.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:68}" &

#Done Inserting Chunk 83/128
#Inserting Chunk 84/128
#Exception Deadlock

nohup ./run_importer.sh -e prod -b 4026 -g ../../rpm_italian_dc_prod_4026.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:84}" &

start time 13:33:38 ?
end time 16:15:35

# update business set is_importing=0 where id=4026;

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------



file lines 406675