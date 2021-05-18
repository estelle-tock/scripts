
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/pst_waitlist_prod.csv
--config_json="{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:H_M_A, resoCreationDateFormat:YYYY_M_D_DASH, resoCreationTimeFormat:H_MM, ticketTypeName: 'Publican', allowReimport: true}"

scp -i ~/.ssh/google_compute_engine ~/pst_guests_prod.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/pst_resos_prod.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/pst_waitlist_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp pst_guests_prod.csv ~ && cp pst_resos_prod.csv ~ && cp pst_waitlist_prod.csv ~

cd ~/importer/server

nohup ./run_importer.sh -e demo -b 4311 -g ../../pst_guests_prod.csv -r ../../pst_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM_SS, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

start time 15:10:09 (10:10 AM) # on crawl-server
end time 15:27:42 (10:27 AM) # on crawl-server
file lines 

nohup ./run_importer.sh -e demo -b 4311 -g ../../pst_waitlist_prod.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationDateFormat:M_D_YY, resoCreationTimeFormat:H_MM, ticketTypeName: 'Pacific Standard Time', allowReimport: true}" &

start time 15:30:56 (10:30 AM) # on crawl-server
end time 15:38:48 (10:38 AM) # on crawl-server

# ------------------------------------------------
# -                      PROD                    -
# ------------------------------------------------

# lock them out 8686

nohup ./run_importer.sh -e prod -b 8686 -g ../../pst_guests_prod.csv -r ../../pst_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM_SS, quoteDetectionEnabled: false, smsReminderEnabled: true}" &

start time
end time 
file lines

nohup ./run_importer.sh -e prod -b 8686 -g ../../pst_waitlist_prod.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationDateFormat:M_D_YY, resoCreationTimeFormat:H_MM, ticketTypeName: 'Pacific Standard Time', allowReimport: true}" &

start time 
end time 
file lines 

# unlock them 8686


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------
