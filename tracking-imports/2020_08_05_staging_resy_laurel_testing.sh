
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/laurel_waitlist_prod.csv
--config_json="{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:H_M_A, resoCreationDateFormat:YYYY_M_D_DASH, resoCreationTimeFormat:H_MM, ticketTypeName: 'Publican', allowReimport: true}"

scp -i ~/.ssh/google_compute_engine ~/laurel_guests_prod.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/laurel_resos_prod.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/laurel_waitlist_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp laurel_guests_prod.csv ~ && cp laurel_resos_prod.csv ~ && cp laurel_waitlist_prod.csv ~

cd ~/importer/server

nohup ./run_importer.sh -e staging -b 19187 -g ../../laurel_guests_prod.csv -r ../../laurel_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

# stop import on chunk 60
# is the import in the db
# are the records for this business id in the db
# restart import without specifying chunk id, nor allowReimport
# starts from 0 again

nohup ./run_importer.sh -e staging -b 19187 -g ../../laurel_guests_prod.csv -r ../../laurel_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false}" &


# switching to branch with version from 07-21-2020

nohup ./run_importer.sh -e staging -b 19277 -g ../../laurel_guests_prod.csv -r ../../laurel_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

# still doesn't retry from last chunk