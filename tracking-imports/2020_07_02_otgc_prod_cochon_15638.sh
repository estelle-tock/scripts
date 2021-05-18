scp -i ~/.ssh/google_compute_engine ~/cochon_resos_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp cochon_resos_prod.csv ~

cd ~/importer/server

nohup ./run_importer.sh -e prod -b 15638 -g ../../cochon_resos_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

file lines 240193