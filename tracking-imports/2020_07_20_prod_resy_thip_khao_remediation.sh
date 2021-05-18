@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/thip_guests_prod.csv
--reso_csv=/Users/estelle/thip_resos_prod.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM_SS, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false, startFromChunkId:11, endBeforeChunkId:12}"

scp -i ~/.ssh/google_compute_engine ~/thip_guests_prod.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/thip_resos_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp thip_guests_prod.csv ~ && cp thip_resos_prod.csv ~

cd ~/importer/server

nohup ./run_importer.sh -e demo -b 4231 -g ../../thip_guests_prod.csv -r ../../thip_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM_SS, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false, startFromChunkId:11, endBeforeChunkId:12}" &


# ------------------------------------------------
# -                      PROD                    -
# ------------------------------------------------


nohup ./run_importer.sh -e prod -b 13856 -g ../../thip_guests_prod.csv -r ../../thip_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM_SS, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false, startFromChunkId:11, endBeforeChunkId:12, allowReimport:true}" &


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------
