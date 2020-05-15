# ------------------------------------------------
# -                                              -
# -                                              -
# -                FINAL DEMO                    -
# -                                              -
# -                                              -
# ------------------------------------------------
# ------------------------------------------------
# -                 OT ERB                       -
# ------------------------------------------------
cat bearfoot_resos/* > bearfoot_resos.csv
# open in excel & convert to tab delimeted text

# Run on branch estelle/erb-no-guests to generate guest file
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/empty.txt
--reso_csv=/Users/estelle/bearfoot_erb_resos.txt
--config_json="{formatVersion:OPENTABLE_ERB, resoDateFormat:D_M_YYYY, resoTimeFormat:H_M,resoCreationDateFormat:D_M_YYYY, quoteDetectionEnabled: false}"
--dry_run=true
--output_guest_folder=/Users/estelle/bearfoot_guests_from_resos

# Run Locally (RESOS & GUESTS)
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/bearfoot_guests_from_resos.txt
--reso_csv=/Users/estelle/bearfoot_resos_all.txt
--config_json="{formatVersion:OPENTABLE_ERB, resoDateFormat:D_M_YYYY, resoTimeFormat:H_M,resoCreationDateFormat:D_M_YYYY, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/bearfoot_resos_all.txt estelle@crawl-server:~/ && 
scp -i ~/.ssh/google_compute_engine ~/bearfoot_guests_from_resos.txt estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp bearfoot_resos_all.txt ~ && cp bearfoot_guests_from_resos.txt ~

cd ~/importer/server

# DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3345 -g ../../bearfoot_guests_from_resos.txt -r ../../bearfoot_erb_resos.txt -c "{formatVersion:OPENTABLE_ERB, resoDateFormat:D_M_YYYY, resoTimeFormat:H_M,resoCreationDateFormat:D_M_YYYY, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# ------------------------------------------------
# -          SEVEN ROOMS / CUSTOM                -
# ------------------------------------------------

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/bearfoot_7rooms_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_CUSTOM,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: false}"

./run_importer.sh -e demo -b 3345 -g ../../bearfoot_7rooms_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_CUSTOM,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: false}"


# ------------------------------------------------
# -                                              -
# -                                              -
# -                    PROD                      -
# -                                              -
# -                                              -
# ------------------------------------------------

# CHECK - make sure configurations are in prod

# ------------------------------------------------
# -                 OT ERB                       -
# ------------------------------------------------
./run_importer.sh -e prod -b 10561 -g ../../bearfoot_guests_from_resos.txt -r ../../bearfoot_erb_resos.txt -c "{formatVersion:OPENTABLE_ERB, resoDateFormat:D_M_YYYY, resoTimeFormat:H_M,resoCreationDateFormat:D_M_YYYY, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# ------------------------------------------------
# -          SEVEN ROOMS / CUSTOM                -
# ------------------------------------------------

./run_importer.sh -e prod -b 10561 -g ../../bearfoot_7rooms_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_CUSTOM,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"


# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------