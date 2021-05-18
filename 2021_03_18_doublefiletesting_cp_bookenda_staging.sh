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


# CELLARPASS - Resos & Guests
nohup ./run_importer.sh -e staging -b 26354 -g ~/trashcan/arrington_guests.csv -r ~/trashcan/arrington_resos.csv -c "{formatVersion:DOUBLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, resoCreationDateFormat:M_D_YY, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:true,allowReimport: false}" &


26371

# guest file only

# reso file only

