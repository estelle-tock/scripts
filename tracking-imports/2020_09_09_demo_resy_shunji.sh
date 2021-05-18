
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/shunji_guests_3.csv
--reso_csv=/Users/estelle/shunji_resos_3.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_MM_SS, resoCreationDateFormat:YYYY_M_D_DASH,resoCreationTimeFormat:H_MM_SS, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

scp -i ~/.ssh/google_compute_engine ~/shunji_guests_3.csv importer@eng-imports-0:~/trashcan &&scp -i ~/.ssh/google_compute_engine ~/shunji_resos_3.csv importer@eng-imports-0:~/trashcan && ssh -i ~/.ssh/google_compute_engine importer@eng-imports-0


# off a branch - to append notes & check if the notes already exist - and exclude "No" for VIP column

nohup ./run_importer.sh -e demo -b 4514 -g ~/trashcan/shunji_guests_3.csv -r ~/trashcan/shunji_resos_3.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_MM_SS, resoCreationDateFormat:YYYY_M_D_DASH,resoCreationTimeFormat:H_MM_SS, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}" &
