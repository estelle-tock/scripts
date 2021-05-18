@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/avec_guests_prod.csv
--reso_csv=/Users/estelle/avec_resos_prod.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM_SS, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false}"

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/avec_waitlist_prod.csv
--config_json="{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:H_M_A, resoCreationDateFormat:YYYY_M_D_DASH, resoCreationTimeFormat:H_MM, ticketTypeName: 'Publican', allowReimport: true}"

scp -i ~/.ssh/google_compute_engine ~/avec_guests_prod.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/avec_resos_prod.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/avec_waitlist_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp avec_guests_prod.csv ~ && cp avec_resos_prod.csv ~ && cp avec_waitlist_prod.csv ~

cd ~/importer/server

nohup ./run_importer.sh -e demo -b 4166 -g ../../avec_guests_prod.csv -r ../../avec_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM_SS, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

start time 13:09:00
end time 13:24:56
file lines 

nohup ./run_importer.sh -e demo -b 4166 -g ../../avec_waitlist_prod.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:H_M_A, resoCreationDateFormat:YYYY_M_D_DASH, resoCreationTimeFormat:H_MM, ticketTypeName: 'Publican', allowReimport: true}" &

start time 13:33:10
end time 13:37
file lines

# ------------------------------------------------
# -                      PROD                    -
# ------------------------------------------------



nohup ./run_importer.sh -e prod -b 8677 -g ../../avec_guests_prod.csv -r ../../avec_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM_SS, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

start time
end time 
file lines

nohup ./run_importer.sh -e prod -b 8677 -g ../../avec_waitlist_prod.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:H_M_A, resoCreationDateFormat:YYYY_M_D_DASH, resoCreationTimeFormat:H_MM, ticketTypeName: 'Publican', allowReimport: true}" &

start time 
end time 
file lines 


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------
