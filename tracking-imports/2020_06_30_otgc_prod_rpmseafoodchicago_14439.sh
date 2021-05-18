# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/rpm_seafood_chicago_prod.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/rpm_seafood_chicago_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp rpm_seafood_chicago_prod.csv ~
cp rpm_seafood_chicago_prod_guests_only.csv ~

cd ~/importer/server

# clowncar ui
start - 16:30:45.745 (4:30)
end - 16:34:29.917 (4:34)

# remove all guests and reservations from clowncar ui insert

# nohup
start  - 21:41:17 (4:41)
end - 21:45:17 (4:45) 

# FINAL DEMO (RESOS & GUESTS)
nohup ./run_importer.sh -e prod -b 14439 -g ../../rpm_seafood_chicago_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:0}" &

nohup ./run_importer.sh -e prod -b 14439 -g ../../rpm_seafood_chicago_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:7}" &

nohup ./run_importer.sh -e prod -b 14439 -g ../../rpm_seafood_chicago_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:9}" &

nohup ./run_importer.sh -e prod -b 14439 -g ../../rpm_seafood_chicago_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:10}" &






./run_importer.sh -e prod -b 14439 -g ../../rpm_seafood_chicago_prod_guests_only.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"


# lock out of site


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# new importer code

#final demo
start time 21.32.56 (4:32 PM)
end time 

#prod
start time 
end time 

file lines 729045