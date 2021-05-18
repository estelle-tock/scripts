# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------

scp -i ~/.ssh/google_compute_engine ~/river.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp river.csv ~

cd ~/importer/server

# export configs from prod to demo
./export_configuration.sh prod 15323 15323.prod.proto
./import_configuration.sh demo 3597 15323.prod.proto

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3597 -g ../../river.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
