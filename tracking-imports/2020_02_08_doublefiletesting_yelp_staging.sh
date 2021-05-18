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


# YELP - Resos & Guests
nohup ./run_importer.sh -e staging -b 23887 -g ~/trashcan/eleven_yelp_guests_test.csv -r ~/trashcan/eleven_yelp_resos_test.csv -c "{formatVersion:DOUBLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: false}" &

#run2
nohup ./run_importer.sh -e staging -b 23891 -g ~/trashcan/eleven_yelp_guests_test.csv -r ~/trashcan/eleven_yelp_resos_test.csv -c "{formatVersion:DOUBLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: false}" &

#run3
nohup ./run_importer.sh -e staging -b 24014 -g ~/trashcan/eleven_yelp_guests_test.csv -r ~/trashcan/eleven_yelp_resos_test.csv -c "{formatVersion:DOUBLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: false}" &

nohup ./run_importer.sh -e staging -b 24523 -g ~/trashcan/eleven_yelp_guests_test.csv -r ~/trashcan/eleven_yelp_resos_test.csv -c "{formatVersion:DOUBLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: false}" &


# YELP - Guest File Only
nohup ./run_importer.sh -e staging -b 23888 -g ~/trashcan/eleven_yelp_guests_test.csv -c "{formatVersion:DOUBLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: false}" &


# YELP - Reso File Only
nohup ./run_importer.sh -e staging -b -r ~/trashcan/eleven_yelp_resos_test.csv -c "{formatVersion:DOUBLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: false}" &

