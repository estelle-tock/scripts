# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/715_prod.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/715_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp 715_prod.csv ~

cd ~/importer/server

# DEMO (RESOS & GUESTS)
nohup ./run_importer.sh -e demo -b 4099 -g ../../715_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

start time 15:19:09
end time 15:26:34

nohup ./run_importer.sh -e prod -b 16964 -g ../../715_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

start time 15:56:33
end time 16:05:05

file lines 285658

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------



