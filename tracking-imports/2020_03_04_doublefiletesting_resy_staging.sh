# ------------------------------------------------
# -               IMPORT COMMANDS                -
# ------------------------------------------------
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/eleven_yelp_guests_test.csv
--reso_csv=/Users/estelle/eleven_yelp_resos_test.csv
--config_json="{formatVersion:DOUBLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, resoCreationDateFormat:M_D_YY, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: true}"
# TODO
# add in valdiation so it will error on bad date format


# ----------------------- OTGC ---------------------------


# RESY - Resos & Guests
nohup ./run_importer.sh -e staging -b 25448 -g ~/trashcan/resy_test_guest.csv -r ~/trashcan/resy_test_reso.csv -c "{formatVersion:DOUBLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:HH_MM, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: false}" &

nohup ./run_importer.sh -e staging -b  -g ~/trashcan/resy_daisies_guest.csv -r ~/trashcan/resy_daisies_reso.csv -c "{formatVersion:DOUBLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:HH_MM, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: false}" &

nohup ./run_importer.sh -e staging -b 25477 -g ~/trashcan/daisies_guests_test.csv -r ~/trashcan/daisies_resos_test.csv -c "{formatVersion:DOUBLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:HH_MM_SS, resoCreationDateFormat:M_D_YY, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: true}" &

# guest file only

# reso file only



nohup ./run_importer.sh -e demo -b 5355 -g ~/trashcan/mollys_guests.csv -r ~/trashcan/mollys_resos.csv -c "{formatVersion:RESY_V3,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:HH_MM, resoCreationDateFormat:M_D_YY, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: false}" &



nohup ./run_importer.sh -e demo -b 5360 -g ~/trashcan/custom_guests_only.csv -c "{formatVersion:OPENTABLE_CUSTOM_GUESTS_ONLY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:HH_MM, resoCreationDateFormat:M_D_YY, guestDateFormat: M_D_YYYY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: false}" &