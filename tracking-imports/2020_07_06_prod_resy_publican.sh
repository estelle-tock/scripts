@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/publican_guests.csv
--reso_csv=/Users/estelle/publican_resos.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM_SS, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false}"

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/publican_waitlist.csv
--config_json="{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:H_M_A, resoCreationDateFormat:YYYY_M_D_DASH, resoCreationTimeFormat:H_MM, ticketTypeName: 'Publican', allowReimport: true}"

scp -i ~/.ssh/google_compute_engine ~/publican_guests.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/publican_resos.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/publican_waitlist.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp publican_guests.csv ~ &&
cp publican_resos.csv ~ &&
cp publican_waitlist.csv ~

cd ~/importer/server

nohup ./run_importer.sh -e demo -b 4123 -g ../../publican_guests.csv -r ../../publican_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM_SS, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

start time 18:00:00
end time 18:20:09
file lines 247,634

nohup ./run_importer.sh -e demo -b 4123 -g ../../publican_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:H_M_A, resoCreationDateFormat:YYYY_M_D_DASH, resoCreationTimeFormat:H_MM, ticketTypeName: 'Publican', allowReimport: true}" &

start time 17:24
end time 17:28
file lines 1422

# ------------------------------------------------
# -                      PROD                    -
# ------------------------------------------------



nohup ./run_importer.sh -e prod -b 8689 -g ../../publican_guests.csv -r ../../publican_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM_SS, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

start time 18:09:51
end time 18:28:42
file lines 247,634

nohup ./run_importer.sh -e prod -b 8689 -g ../../publican_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:H_M_A, resoCreationDateFormat:YYYY_M_D_DASH, resoCreationTimeFormat:H_MM, ticketTypeName: 'Publican', allowReimport: true}" &

start time 18:39:52
end time 18:46:15
file lines 1422


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------
