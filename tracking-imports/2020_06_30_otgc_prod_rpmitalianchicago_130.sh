# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/rpm_italian_chicago_prod.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/rpm_italian_chicago_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp rpm_italian_chicago_prod.csv ~

cd ~/importer/server

# FINAL DEMO (RESOS & GUESTS)
nohup ./run_importer.sh -e demo -b 3977 -g ../../rpm_italian_chicago_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

# lock out of site
# using retry logic - no failures on 426 chunks, amazing!!!!

nohup ./run_importer.sh -e prod -b 130 -g ../../rpm_italian_chicago_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

# let them back in site

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# new importer code

#final demo
start time 16.01.41 (6/30/2020)
end time 17.30...ish

#prod
start time 12:16:00 (07/01/2020)
end time 14:19:04
# 2.5 hours

file lines 729045