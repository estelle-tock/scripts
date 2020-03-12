# Aristia
# Demo ID - 3038
# OpenTable Guest Center
# No welcome texts -t
# Yes Reminder Texts
# Yes Push Configs


./concat.sh ~/aristia_resos.zip

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/aristia_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY,guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"


scp -i ~/.ssh/google_compute_engine ~/aristia_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp aristia_resos.csv ~

cd ~/importer/server

./run_importer.sh -e demo -b 3038 -g ../../aristia_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY,guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"