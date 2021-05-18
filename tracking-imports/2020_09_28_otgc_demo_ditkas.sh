# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/ditkas_demo.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/ditkas_demo.csv importer@eng-imports-0:~/trashcan && ssh -i ~/.ssh/google_compute_engine importer@eng-imports-0

# DEMO
#nohup ./run_importer.sh -e demo -b 4624 -g ~/trashcan/ditkas_demo.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------

# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

start time 
end time 

file lines 623,150